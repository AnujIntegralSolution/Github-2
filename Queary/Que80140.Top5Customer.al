query 80140 "Top 5 Customers"
{
    Caption = 'Top 5 Customer';
    QueryType = Normal;
    OrderBy = descending(Sales__LCY_);

    elements
    {
        dataitem(CustLedgerEntry; "Cust. Ledger Entry")
        {
            filter(Posting_Date; "Posting Date") { }
            column(Customer_No_; "Customer No.")
            {
            }
            column(Customer_Name; "Customer Name")
            {

            }
            column(Sales__LCY_; "Sales (LCY)")
            {
                Method = sum;
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
