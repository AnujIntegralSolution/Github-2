report 80143 "Report For Multi Table"
{
    ApplicationArea = All;
    Caption = 'Report For Multi Table';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'Github-2/Report_Layout/MultipleReport.rdl';
    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            PrintOnlyIfDetail = true;


            column(Customer_No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Customer_Name; Name)
            {
                IncludeCaption = true;
            }
            column(Customer_Phone_No_; "Phone No.")
            {
                IncludeCaption = true;
            }
            column(Customer_Address; Address)
            {
                IncludeCaption = true;
            }
            column(Customer_E_Mail; "E-Mail")
            {
                IncludeCaption = true;
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {

                DataItemTableView = sorting("Entry No.");
                DataItemLink = "Customer No." = field("No.");

                column(CustLedEnt_Entry_No_; "Entry No.")
                {
                    IncludeCaption = true;
                }
                column(CustLedEnt_Customer_No_; "Customer No.")
                {
                    IncludeCaption = true;
                }
                column(CustLedEnt_Posting_Date; "Posting Date")
                {
                    IncludeCaption = true;
                }
                column(CustLedEnt_Document_Type; "Document Type")
                {
                    IncludeCaption = true;
                }
                column(CustLedEnt_Document_No_; "Document No.")
                {
                    IncludeCaption = true;
                }

                column(CustLedEnt_Description; Description)
                {
                    IncludeCaption = true;
                }
                column(CustLedEnt_Currency_Code; "Currency Code")
                {
                    IncludeCaption = true;
                }

                column(CustLedEnt_Amount; Amount)
                {
                    IncludeCaption = true;
                }
                column(CustLedEnt_Original_Amt___LCY_; "Original Amt. (LCY)")
                {
                    IncludeCaption = true;
                }
                column(CustLedEnt_Remaining_Amt___LCY_; "Remaining Amt. (LCY)")
                {
                    IncludeCaption = true;
                }
            }
        }

        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = sorting("document type", "No.");


            column(SalesHeader_No_; "No.")
            {
                IncludeCaption = true;
            }
            column(SalesHeader_Posting_Date; "Posting Date")
            {
                IncludeCaption = true;
            }
            column(SalesHeader_Prices_Including_VAT; "Prices Including VAT")
            {
                IncludeCaption = true;
            }
            column(SalesHeader_Amount; Amount)
            {
                IncludeCaption = true;
            }
        }
    }

    labels
    {
        sales_Doc_Caption = 'Sales Document';
        Total_Caption = 'Total';

    }

}