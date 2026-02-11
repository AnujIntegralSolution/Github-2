table 80154 "Business Scenario"
{
    Caption = 'Business Scenario';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;

            trigger OnValidate()
            var
                recWRHouse: Record item;
            begin
                if recWRHouse.get("Item No.") then begin
                    rec.Quantity := recWRHouse."Budget Quantity";
                    rec."UOM" := recWRHouse."Base Unit of Measure";
                end;
            end;

        }
        field(4; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(5; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
        }
        field(6; "UOM"; Code[20])
        {
            Caption = 'UOM ';
        }
        field(7; "Lot No."; Code[20])
        {
            Caption = 'Lot No.';
            TableRelation = "Whse. Item Tracking Line";


            trigger OnValidate()
            var
                recWHItem: Record "Whse. Item Tracking Line";
            begin
                if recWHItem.get("Lot No.") then
                    rec."Expiry Date" := recWHItem."Expiration Date";
            end;



        }
        field(8; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
        }
    }
    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
    }
}
