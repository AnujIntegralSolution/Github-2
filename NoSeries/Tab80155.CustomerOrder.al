table 80155 "Customer Order"
{
    Caption = 'Customer Order';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(2; "Customer Name"; Text[50])
        {
            Caption = 'Customer Name';
        }
        field(3; "Order Series"; Code[20])
        {
            Caption = 'Order Series';
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "Order No.")
        {
            Clustered = true;
        }
    }
    local procedure AssistEdit(): Boolean
    var
        NoSeriesMgt: Codeunit "No. Series";
    begin
        if "Order No." = '' then begin
            "Order No." := NoSeriesMgt.GetNextNo("Order Series", WorkDate(), true);
            exit(true);

        end;
    end;



    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit "No. Series";
    begin
        if "Order No." = '' then begin
            TestField("Order Series");
            "Order No." := NoSeriesMgt.GetNextNo("Order Series", WorkDate(), true);
        end;

    end;



}
