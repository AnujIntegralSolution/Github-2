report 80142 "Project Report"
{
    ApplicationArea = All;
    Caption = 'Project Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = '.vscode/Report_Layout/Project Report.rdl';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(Project; Project)
        {
            column(DocumentType; "Document Type")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(CustomerEMail; "Customer E-Mail")
            {
            }
            column(LocationName; "Location Name")
            {
            }
            column(ShipToCode; "Ship To Code")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(EmployeeID; "Employee ID")
            {
            }
            column(EmployeeName; "Employee Name")
            {
            }
            column(Amount; Amount)
            {
            }
            column(UserID; "User ID")
            {
            }
            column(UserName; "User Name")
            {
            }
            column(Quantity; Quantity)
            {
            }
            // column(Status; Status)
            // {
            // }
            column(Post; Post)
            {
            }
            column(Company_name; companyDetails[1])
            {
            }
            column(Company_Address; companyDetails[2])
            {
            }
            column(Company_Address2; companyDetails[3])
            {
            }
            column(Company_City; companyDetails[4])
            {
            }
            column(Company_PostCode; companyDetails[5])
            {
            }
            column(Company_StateCode; companyDetails[6])
            {
            }
            column(Company_Country; companyDetails[7])
            {
            }
            column(Company_ContactName; companyDetails[8])
            {
            }
            column(Company_Email; companyDetails[9])
            {
            }
            column(Company_PhoneNo; companyDetails[10])
            {
            }

            trigger OnAfterGetRecord()
            begin
                GetCompanyInfo();
            end;
        }
    }


    local procedure GetCompanyInfo()
    begin
        if recCompany.get() then
            recCompany.CalcFields(Picture);
        companyDetails[1] := recCompany.Name;
        companyDetails[2] := recCompany.Address;
        companyDetails[3] := recCompany."Address 2";
        companyDetails[4] := recCompany.City;
        // companyDetails[5] := recCompany."State Code";
        companyDetails[6] := recCompany."Post Code";
        companyDetails[7] := recCompany."Country/Region Code";
        companyDetails[8] := recCompany."Contact Person";
        companyDetails[9] := recCompany."E-Mail";
        companyDetails[10] := recCompany."Phone No.";
    end;


    var
        recCompany: Record "Company Information";
        companyDetails: array[10] of text;

}
