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
                trigger OnValidate()
                begin
                    Pattern := '[A-Z]{2}[0-9]{3}';
                    if regex.IsMatch(Rec."No.", Pattern, 0) then
                        Message('Match')
                    else
                        Error('Please enter the valid input');
                end;
            }
            field(Name; Rec.Name)
            {
                ApplicationArea = All;
            }
            field("Item No."; Rec."Item No.")
            {
                ApplicationArea = All;
            }
            field(Description; Rec.Description)
            {
                ApplicationArea = All;
            }
            field("Unit Price"; Rec."Unit Price")
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
        Pattern: Text;
        Input: Text;
        Regex: Codeunit Regex;
}