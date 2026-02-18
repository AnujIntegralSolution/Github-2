page 80172 "FlowField Test"
{
    PageType = List;
    SourceTable = "FlowField Test Table";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Customer No."; rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Has Invoices"; rec."Has Invoices")
                {
                    ApplicationArea = All;
                }
                field("Invoices Total"; rec."Invoices Total")
                {
                    ApplicationArea = All;
                }
                field("Invoices Count"; rec."Invoices Count")
                {
                    ApplicationArea = all;
                }
                field("Average Invoice"; rec."Average Invoice")
                {
                    ApplicationArea = All;
                }
                field("Max Invoice Amount"; rec."Max Invoice Amount")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}