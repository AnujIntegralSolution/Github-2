page 80173 "Lookup tester Card"
{
    ApplicationArea = All;
    Caption = 'Lookup tester Card';
    PageType = Card;
    SourceTable = "Lookup tester";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;

                    trigger OnLookup(var text: text): Boolean
                    var
                        Item: Record Item;
                    begin
                        if Page.RunModal(page::"Item List", Item) = Action::LookupOK then begin
                            text := Item."No.";
                            exit(true);
                        end;

                    end;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if Rec.IsEmpty() then
            Rec.Insert();
    end;
}
