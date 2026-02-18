report 80145 "Customer Excel Buffer Report"
{
    ApplicationArea = All;
    Caption = 'Customer Excel Buffer Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = '.vscode/Report_Layout/CustExlBufferReport.rdl';
    PreviewMode = PrintLayout;
    dataset
    {
        dataitem(CustomerExcelBuffer; "Customer Excel Buffer")
        {
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(BalanceLCY; "Balance (LCY)")
            {
            }
            column(CreditLimitLCY; "Credit Limit (LCY)")
            {
            }
            column(Blocked; Blocked)
            {
            }
            column(SalespersonCode; "Salesperson Code")
            {
            }
            column(DocumentSendingProfile; "Document Sending Profile")
            {
            }
            column(LastDateModified; "Last Date Modified")
            {
            }
            column(Address; Address)
            {
            }
            column(Address2; "Address 2")
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(City; City)
            {
            }
            column(StateCode; "State Code")
            {
            }
            column(PostCode; "Post Code")
            {
            }
            column(PhoneNo; "Phone No.")
            {
            }
            column(EMail; "E-Mail")
            {
            }
            column(FaxNo; "Fax No.")
            {
            }
            column(Language_Code; "Language Code")
            {
            }
            column(FormatRegion; "Format Region")
            {
            }
            column(BilltoCustomerNo; "Bill-to Customer No.")
            {
            }
            column(VATRegistrationNo; "VAT Registration No.")
            {
            }
            column(EORINumber; "EORI Number")
            {
            }
            column(GLN; GLN)
            {
            }
            column(UseGLNinElectronicDocument; "Use GLN in Electronic Document")
            {
            }
            column(RegistrationNumber; "Registration Number")
            {
            }
            column(GenBusPostingGroup; "Gen. Bus. Posting Group")
            {
            }
            column(CustomerPostingGroup; "Customer Posting Group")
            {
            }
            column(CurrencyCode; "Currency Code")
            {
            }
            column(CustomerPriceGroup; "Customer Price Group")
            {
            }
            column(CustomerDiscGroup; "Customer Disc. Group")
            {
            }
            column(InvoiceDiscCode; "Invoice Disc. Code")
            {
            }
            column(PricesIncludingVAT; "Prices Including VAT")
            {
            }
            column(ApplicationMethod; "Application Method")
            {
            }
            column(PaymentTermsCode; "Payment Terms Code")
            {
            }
            column(PaymentMethodCode; "Payment Method Code")
            {
            }
            column(FinChargeTermsCode; "Fin. Charge Terms Code")
            {
            }
            column(PrintStatements; "Print Statements")
            {
            }
            column(LastStatementNo; "Last Statement No.")
            {
            }
            column(ShiptoCode; "Ship-to Code")
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(CombineShipments; "Combine Shipments")
            {
            }
            column(Shipment_Method_Code; "Shipment Method Code")
            {
            }
            column(ShippingAgentCode; "Shipping Agent Code")
            {
            }
            column(recCompany; recCompany.Picture)
            {

            }

            trigger OnAfterGetRecord()
            begin
                GetCompanyDetails();
            end;

        }

    }

    local procedure GetCompanyDetails()
    begin
        if recCompany.get() then
            recCompany.CalcFields(Picture);
    end;

    var
        recCompany: Record "Company Information";

}
