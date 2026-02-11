table 80153 Lending
{
    Caption = 'Lending';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Leanding ID"; Code[20])
        {
            Caption = 'Leanding ID';
            NotBlank = true;
        }
        field(2; "Book ID"; Code[20])
        {
            Caption = 'Book ID';
            TableRelation = Book."Book ID";
            NotBlank = true;
        }
        field(3; "Member ID"; Code[20])
        {
            Caption = 'Member ID';
            NotBlank = true;
        }
        field(4; "Leanding Date"; Date)
        {
            Caption = 'Leanding Date';
            NotBlank = true;
        }
        field(5; "Return Date"; Date)
        {
            Caption = 'Return Date';
            NotBlank = true;
        }
        field(6; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = New,Issued,Returned,Overdue;
            NotBlank = true;
        }
        field(7; "Customer Name"; text[50])
        {
            Caption = 'Customer Name';
            NotBlank = true;
        }
        field(8; "Due Date"; Date)
        {
            Caption = 'Due Date';
            NotBlank = true;
        }
        field(9; "Fine Amount"; Decimal)
        {
            Caption = 'Fine Amount';
            NotBlank = true;
        }
        field(10; "OverDue Date"; Date)
        {
            Caption = 'OverDue Date';
            NotBlank = true;
        }
    }
    keys
    {
        key(PK; "Leanding ID")
        {
            Clustered = true;
        }

        key(key1; "Book ID")
        {
            Clustered = false;
        }
    }
}
