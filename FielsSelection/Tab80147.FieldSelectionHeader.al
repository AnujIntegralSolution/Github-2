table 80147 "Field Selection Header"
{
    Caption = 'Field Selection Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Table No."; Integer)
        {
            Caption = 'Table No.';
        }
        field(2; "Table Name"; Text[50])
        {
            Caption = 'Table Name';
        }
        field(3; "Filed No."; Integer)
        {
            Caption = 'Filed No.';
        }
        field(4; "Field Name"; Text[50])
        {
            Caption = 'Field Name';
        }

    }
    keys
    {
        key(PK; "Table No.")
        {
            Clustered = true;
        }
    }
}
