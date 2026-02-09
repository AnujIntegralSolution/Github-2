page 80165 "Book Card"
{
    ApplicationArea = All;
    Caption = 'Book Card';
    PageType = Card;
    SourceTable = Book;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Book ID"; Rec."Book ID")
                {
                    ApplicationArea = All;
                }
                field("ISBN Number"; Rec."ISBN Number")
                {
                    ApplicationArea = All;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                }
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;
                }
                field("Book Price"; Rec."Book Price")
                {
                    ApplicationArea = All;
                }
                field("Publication Date"; Rec."Publication Date")
                {
                    ApplicationArea = All;
                }
                field(Language; Rec.Language)
                {
                    ApplicationArea = All;
                }
                field("Book Category`"; Rec."Book Category`")
                {
                    ApplicationArea = All;
                }
                field("Publisher Date"; Rec."Publisher Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
