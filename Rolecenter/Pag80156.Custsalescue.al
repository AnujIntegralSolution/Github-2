page 80156 "Cust. sales cue"
{
    ApplicationArea = All;
    Caption = 'Cust. sales cue';
    PageType = CardPart;
    SourceTable = "Cust. sales cue";
    layout
    {
        area(Content)
        {
            cuegroup(General)
            {
                Caption = 'General';
                field("No. of Orders"; Rec."No. of Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Order List";
                }

                field("No. of Invoice"; Rec."No. of Invoice")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Invoice List";
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Lines";
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Lines";
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Lines";
                }
            }
        }
    }
}
