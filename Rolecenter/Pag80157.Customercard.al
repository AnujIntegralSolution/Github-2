page 80157 "Customer cards"
{
    ApplicationArea = All;
    Caption = 'Customer card';
    PageType = CardPart;
    SourceTable = "Customer Sales Cue";

    layout
    {
        area(Content)
        {
            cuegroup(General)
            {
                ShowCaption = false;


                field("No. of Orders"; Rec."No. of Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Order List";
                }
                field("No. of Invoice"; Rec."No. of Invoice")
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
