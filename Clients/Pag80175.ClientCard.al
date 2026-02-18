page 80175 "Client Card"
{
    ApplicationArea = All;
    Caption = 'Client Card';
    PageType = Card;
    SourceTable = "Clients Header";

    layout
    {
        area(Content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
            }
            field(Name; Rec.Name)
            {
                ApplicationArea = All;
            }

            field(Address; Rec.Address)
            {
                ApplicationArea = All;
            }

            field("Last Date Modified"; Rec."Last Date Modified")
            {
                ApplicationArea = All;
            }
            field(Rank; Rec.Rank)
            {
                ApplicationArea = All;
                StyleExpr = StyleExprtxt;

                trigger OnValidate()
                var
                    myInt: Integer;
                begin
                    StyleExprtxt := changeColor.GetColor(Rec);
                end;
            }
            field("Item No."; Rec."Item No.")
            {
                ApplicationArea = All;
            }
            field(Description; Rec.Description)
            {
                ApplicationArea = All;
            }
            field("Unit Cost"; Rec."Unit Price")
            {
                ApplicationArea = All;
            }
        }
        area(FactBoxes)
        {

            part(CustomerPicture; "Customer Picture")
            {
                ApplicationArea = All;
                Caption = 'Picture';
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        StyleExprtxt := changeColor.GetColor(rec)
    end;

    var
        StyleExprtxt: text[50];
        changeColor: Codeunit "Change Color";
}