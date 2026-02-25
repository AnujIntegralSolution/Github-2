page 80166 "Lending List"
{
    ApplicationArea = All;
    Caption = 'Lending List';
    PageType = List;
    SourceTable = Lending;
    UsageCategory = Lists;
    CardPageId = "Lending Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Leanding ID"; Rec."Leanding ID")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Book ID"; Rec."Book ID")
                {
                    ApplicationArea = All;
                }
                field("Member ID"; Rec."Member ID")
                {
                    ApplicationArea = All;
                }
                field("Leanding Date"; Rec."Leanding Date")
                {
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = All;
                }
                field("Bill Amount"; Rec."Bill Amount")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

            }
        }
    }


}
