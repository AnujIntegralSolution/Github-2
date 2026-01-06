query 80141 "Customer sales by quantity"
{
    Caption = 'Customer sales by quantity';
    QueryType = Normal;
    OrderBy = descending(Quantity);

    elements
    {
        dataitem(Customer;
        Customer)
        {
            column(No_; "No.")
            {

            }
            column(Name; Name)
            {

            }
            dataitem(Sales_Line; "Sales Line")
            {
                DataItemLink = "Sell-to Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;

                column(Quantity; Quantity)
                {

                }
            }


        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
