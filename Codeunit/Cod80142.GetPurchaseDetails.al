codeunit 80142 "Get Purchase Details"
{

    procedure GetPurchaseCount(pCode: code[20])
    var
        recVendor: Record Vendor;
        recPurch: Record "Purchase Header";
    begin
        recPurch.Reset();
        recPurch.SetRange("Document Type", recPurch."Document Type"::Order);
        recPurch.setrange("Buy-from Vendor No.", pCode);
        if recPurch.FindSet() then
            Message('%1', recPurch.Count);
    end;

    procedure GetPurchaseAmount(pCode: code[20])
    var
        recVendor: Record Vendor;
        recPurch: Record "Purchase Header";
        VarTotal: Decimal;
    begin
        recPurch.Reset();
        recPurch.SetRange("Document Type", recPurch."Document Type"::Order);
        recPurch.setrange("Buy-from Vendor No.", pCode);
        if recPurch.FindSet() then begin
            repeat
                recPurch.CalcFields(Amount);
                VarTotal += recPurch.Amount;
            until recPurch.Next() = 0;
            Message('%1', VarTotal);
        end;
    end;
    procedure GetPurchaseLineCount(pCode: code[20])
    var
        recVendor: Record Vendor;
        recPurch: Record "Purchase Header";
        recPurchLine: Record "Purchase Line";
        VarCount: Integer;
    begin
        recPurch.Reset();
        recPurch.SetRange("Document Type", recPurch."Document Type"::Order);
        recPurch.setrange("Buy-from Vendor No.", pcode);
        if recPurch.FindSet() then begin
            recPurchLine.Reset();
            recPurchLine.SetRange("Document Type", recPurchLine."Document Type"::Order);
            recPurchLine.SetRange("Buy-from Vendor No.", recPurch."Buy-from Vendor No.");
            if recPurchLine.FindSet() then
                VarCount += recPurchLine.Count;
            Message('%1', VarCount);
        end;
    end;


    procedure GetPurchaseLineAmount(PCode: code[20])
    var
        recVendor: Record Vendor;
        recPurch: Record "Purchase Header";
        recPurchLine: Record "Purchase Line";
        Total: Decimal;
    begin
        recPurch.Reset();
        recPurch.SetRange("Document Type", recPurch."Document Type"::Order);
        recPurch.setrange("Buy-from Vendor No.", PCode);
        if recPurch.FindSet() then begin
            recPurchLine.Reset();
            recPurchLine.SetRange("Document Type", recPurchLine."Document Type"::Order);
            recPurchLine.SetRange("Buy-from Vendor No.", recPurch."Buy-from Vendor No.");
            if recPurchLine.FindSet() then
                repeat
                    Total += recPurchLine."Line Amount";
                until recPurchLine.Next() = 0;
            Message('%1', Total);
        end;
    end;

}
