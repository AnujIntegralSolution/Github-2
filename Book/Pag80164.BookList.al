page 80164 "Book List"
{
    ApplicationArea = All;
    Caption = 'Book List';
    PageType = Card;
    SourceTable = Book;
    CardPageId = "Book Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';

                field("Book ID"; Rec."Book ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("ISBN Number"; Rec."ISBN Number")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    trigger OnValidate()
                    var
                        ISBN: Codeunit BookISBNValidation;
                    begin
                        if not ISBN.ValidateISBNNumber(rec."ISBN Number") then
                            Error('Invalid ISBN Number');

                    end;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Book Price"; Rec."Book Price")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Publication Date"; Rec."Publication Date")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(Language; Rec.Language)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Book Category`"; Rec."Book Category`")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Publisher Date"; Rec."Publisher Date")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
            }
        }
    }
}
