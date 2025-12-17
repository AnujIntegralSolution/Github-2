codeunit 80140 "Job Cu Every Monday"
{
    trigger OnRun()
    var
        recCustomer: Record Customer;

    begin
        if recCustomer.get() then begin
            SendMailWithReports(recCustomer."E-Mail", recCustomer."No.");
        end;
    end;

    procedure SendMailWithReports(pNotifyMail: text[80]; pCode: code[20])
    var
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        EmailBody: Text;
        Customer: Record Customer;
        CustomerReportId: Integer;
        PatientReportId: Integer;
        CustomerInStream: InStream;
        PatientInStream: InStream;
        CustomerFileName: Text;
        PatientFileName: Text;
        RecRef: RecordRef;
        TempBlob: Codeunit "Temp Blob";
        OutStream: OutStream;
        InStream: InStream;

    begin
        if customer.get(pCode) then begin
            CustomerReportId := Report::"Customer Record Report";
            CustomerFileName := 'Customer Record';
            TempBlob.CreateOutStream(OutStream);
            Report.SaveAs(CustomerReportId, '', ReportFormat::Pdf, OutStream, RecRef);
            TempBlob.CreateInStream(CustomerInStream);

            EmailBody :=
      'Hello Team,' + '<br><br>' +
      '' +
      'Please find the attached Stock and Patient Dispensing report.' + '<br><br>' +
      '' +
       customer.Address + ',' + '' + customer.City + ',' + '' + customer."Post Code" + ',' + '' + customer."Country/Region Code" + ',' + '' + '<br>' + customer."Phone No." + ',' + '' + '<br><br>' +
      'Thank you.';
            EmailMessage.Create(pNotifyMail, customer.Name, EmailBody, true);
            EmailMessage.AddAttachment(CustomerFileName, 'application/pdf', CustomerInStream);
            if Email.Send(EmailMessage, Enum::"Email Scenario"::Default) then
                Message('Email sent');
        end;
    end;
}

