table 80158 "Clients Header"
{
    Caption = 'Clients Header';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "No."; code[20])
        {
            Caption = 'No.';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; Address; text[100])
        {
            Caption = 'Address';
        }
        field(4; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
        }
        field(5; "Item No."; code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;

            trigger OnValidate()
            var
                recItem: Record Item;
            begin
                if recItem.get(rec."Item No.") then begin
                    rec.Description := recItem.Description;
                    rec."Unit Price" := recItem."Unit Price";
                    rec."Last Date Modified" := recItem."Last Date Modified";
                end;
            end;
        }

        field(6; "Description"; text[100])
        {
            Caption = 'Description';
            Editable = false;
        }

        field(7; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            Editable = false;
        }
        field(8; Rank; Enum Rank)
        {
            Caption = 'Rank';
        }
        field(9; "Customer Picture"; MediaSet)
        {
            Caption = 'Customer Picture';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
