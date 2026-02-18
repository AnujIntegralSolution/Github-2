table 80157 "Lookup tester"
{
    Caption = 'Lookup tester';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; pKey; Code[20])
        {
            Caption = 'pKey';
        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = item."No.";
        }
        field(3; "Type"; Option)
        {
            Caption = 'Type ';
            OptionMembers = Item,GL;
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if (Type = const(Item)) Item."No." else
            if (Type = const(GL)) "G/L Account"."No.";

        }
    }
    keys
    {
        key(PK; pKey)
        {
            Clustered = true;
        }
    }
}
