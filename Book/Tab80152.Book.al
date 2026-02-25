table 80152 Book
{
    Caption = 'Book';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Book ID"; Code[20])
        {
            Caption = 'Book ID';
            NotBlank = true;
        }
        field(2; "ISBN Number"; Text[20])
        {
            Caption = 'ISBN Number';
            NotBlank = true;
        }
        field(3; Title; Text[50])
        {
            Caption = 'Title';
            NotBlank = true;
        }
        field(4; Author; text[50])
        {
            Caption = 'Author';
            NotBlank = true;
        }
        field(5; "Book Price"; Decimal)
        {
            Caption = 'Book Price';
            NotBlank = true;
        }
        field(6; "Publication Date"; Date)
        {
            Caption = 'Publication Date';
            NotBlank = true;
        }
        field(7; Language; Option)
        {
            Caption = 'Language';
            NotBlank = true;
            OptionMembers = English,Chinese,Spanish,Hindi,Arabic,French,Portuguese,Bengali,Russian,Japanese;
        }
        field(8; "Book Category`"; Option)
        {
            Caption = 'Book Category`';
            NotBlank = true;
            OptionMembers = Fictio,NonFiction,Science,History,Mathematics,Tecnology,Art,Music,Health,Travel;
        }
        field(9; "Publish Date"; Date)
        {
            Caption = 'Publish Date';
            NotBlank = true;
        }

        field(10; "Rent Price"; Decimal)
        {
            Caption = 'Rent Price';
        }

    }
    keys
    {
        key(PK; "Book ID")
        {
            Clustered = true;
        }
    }
}
