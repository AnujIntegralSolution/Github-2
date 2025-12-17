table 80144 "Project Line"
{
    Caption = 'Project Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; enum "Sales Document Type")
        {
            Caption = 'Document Type';
        }
        field(2; "Document No"; Code[20])
        {
            Caption = 'Document No';
            trigger OnValidate()
            var
                recSL: Record "Sales Line";
                recPL: Record "Project Line";
            begin
                recSL.SetRange("Document Type", recPL."Document Type");
                recSL.SetRange("Document No.", recPL."Document No");
                if recSL.FindFirst() then
                    Message('Quantity Value %1', recSL.Quantity);


            end;
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Item; Code[20])
        {
            TableRelation = Item;

            trigger OnValidate()
            var
                recItem: Record item;
            begin
                if recItem.get(rec.Item) then begin
                    rec.Description := recItem.Description;
                    rec.Inventory := recItem.Inventory;
                    rec."Substitutes Exist" := recItem."Substitutes Exist";
                end;
            end;
        }

        field(15; Inventory; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; Description; Text[50])
        {
            Caption = 'Description';
            Editable = false;
        }

        field(16; "Substitutes Exist"; Boolean)
        {
            Editable = false;
        }
        field(6; "Customer No"; Code[20])
        {
            TableRelation = Customer;
            trigger OnValidate()
            var
                recCust: Record Customer;
            begin
                if recCust.get("Customer No") then
                    rec."Ship-to Code" := recCust."Ship-to Code";

            end;
        }
        field(7; "Ship-to Code"; code[20])
        {
            Caption = 'Ship-to Code';
            Editable = false;
        }
        field(8; Quantity; Integer)
        {
            Caption = 'Quantity';
        }
        field(9; "Unit Of Measure Code"; Code[20])
        {
            Caption = 'Unit Of Measure Code';
        }
        field(10; "Unit Price Excl Vat"; Decimal)
        {
            Caption = 'Unit Price Excl Vat';
        }
        field(11; "Line Amount Excl Vat"; Decimal)
        {
            Caption = 'Line Amount Excl Vat';
        }
        field(12; "Purchase Order Line No"; Integer)
        {
            Caption = 'Purchase Order Line No';
        }
        field(13; "HSN/SAC Code"; Code[20])
        {
            Caption = 'HSN/SAC Code';
        }
        field(14; Branch; Code[20])
        {
            Caption = 'Branch';
        }
    }
    keys
    {
        key(PK; "Document No", "Line No")
        {
            Clustered = true;
        }
    }
}
