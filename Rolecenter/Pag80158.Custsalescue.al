page 80158 "Customer sales cue card"
{
    ApplicationArea = All;
    Caption = 'Customer sales cue card';
    PageType = List;
    SourceTable = "Customer Sales Cue";
    layout
    {
        area(Content)
        {
            cuegroup(General)
            {
                ShowCaption = false;
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;

                }
                field("No. of Orders"; Rec."No. of Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Order List";

                }


                field("Unit Price"; rec."Unit Price")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Lines";
                }
                field("No. of Invoice"; Rec."No. of Invoice")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Invoice List";
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
