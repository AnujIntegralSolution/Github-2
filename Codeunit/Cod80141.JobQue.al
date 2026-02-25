codeunit 80141 "Customer Mail"
{

    trigger OnRun()
    var
        customer: Record Customer;
    begin
        if customer.get('10000') then
            Sentmailcustomerdetails(customer."E-Mail", customer."No.");
    end;

    procedure Sentmailcustomerdetails(pNotifymail: text[100]; pCode: code[20])
    var
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        EmailBody: Text;
        Customer: Record Customer;
        CustomerReportId: Integer;
        CustomerInStream: InStream;
        CustomerFileName: Text;
        RecRef: RecordRef;
        TempBlob: Codeunit "Temp Blob";
        OutStream: OutStream;

    begin
        if Customer.get(pCode) then begin
            CustomerReportId := Report::"Customer Record Report";
            CustomerFileName := 'Customer Details';
            TempBlob.CreateOutStream(OutStream);
            Report.SaveAs(CustomerReportId, '', ReportFormat::Pdf, OutStream, RecRef);
            TempBlob.CreateInStream(CustomerInStream);

            EmailBody := 'Hello Customer' + '<br>' +
            Customer.Name + ' <br>' +
                'Address' + ' ' + ':' + ' ' + Customer.Address + '<br>' +
                   'City' + ' ' + ':' + ' ' + Customer.City + '<br>' +
              'Post Code' + ' ' + ':' + ' ' + Customer."Post Code" + '<br>' +
                'Country' + ' ' + ':' + ' ' + Customer."Country/Region Code" + '<br>' +
              'Phone No.' + ' ' + ':' + ' ' + Customer."Phone No." + '<br>' +
          'Language Code' + ' ' + ':' + ' ' + Customer."Language Code" + '<br>' + '<br><br>' +
          '<b>Thank you</b>' + '';

            EmailMessage.Create(pNotifymail, Customer.Name, EmailBody, true);
            EmailMessage.AddAttachment(CustomerFileName, 'Customer/pdf', CustomerInStream);
            if Email.Send(EmailMessage, Enum::"Email Scenario"::Default) then
                Message('Email Sent Sucessfully');
        end;
    end;
}
