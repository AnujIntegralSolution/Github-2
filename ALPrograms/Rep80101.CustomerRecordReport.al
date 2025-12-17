report 80140 "Customer Record Report"
{
    ApplicationArea = All;
    Caption = 'Customer Record Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Report_Layout/CustExlBufferReport.rdl';
    PreviewMode = PrintLayout;


    dataset
    {
        dataitem(CustomerExcelBuffer; "Customer Record")
        {
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(Name_2; "Name 2")
            {
            }
            column(Search_Name; "Search Name")
            {
            }
            column(BalanceLCY; "Balance (LCY)")
            {
            }
            column(Balance_Due__LCY_; "Balance Due (LCY)")
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
            column(Priority; Priority)
            {
            }
            column(Tot; Tot)
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
            column(Location_Name; "Location Name")
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
            column(Age; Age)
            {
            }

            column(Initialamount; Initialamount)
            {
            }
            column(NoOfYears; NoOfYears)
            {
            }
            column(RateOfInterest; RateOfInterest)
            {
            }
            column(FinalAmount; FinalAmount)
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
        Initialamount: Decimal;
        NoOfYears: Integer;
        RateOfInterest: Decimal;
        FinalAmount: Decimal;

}
