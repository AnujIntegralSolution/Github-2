query 80142 PersonswhoPaidFine
{
    QueryType = Normal;

    elements
    {
        dataitem(Lending; Lending)
        {
            DataItemTableFilter = "Bill Amount" = filter(> 0);

            column(Leanding_ID; "Leanding ID")
            {
                Caption = 'Leanding ID';
            }
            column(Customer_Name; "Customer Name")
            {
                Caption = 'Customer Name';
            }
            column(Bill_Amount; "Bill Amount")
            {
                Caption = 'Fine Amount';
            }
            column(Book_ID; "Book ID")
            {
                Caption = 'Book ID';
            }
            column(Leanding_Date; "Leanding Date")
            {
                Caption = 'Leanding Date';
            }



        }
    }
}
