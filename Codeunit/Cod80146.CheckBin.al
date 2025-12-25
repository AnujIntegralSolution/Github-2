codeunit 80146 "Check Bin"
{
    procedure CheckBinInventoryAvailable(
        ItemNo: Code[20];
        LocationCode: Code[10];
        RequiredQty: Decimal)
    var
        BinContent: Record "Bin Content";
        AvailableQty: Decimal;
    begin
        AvailableQty := 0;
        BinContent.SetRange("Item No.", ItemNo);
        BinContent.SetRange("Location Code", LocationCode);
        if BinContent.FindSet() then
            repeat
                AvailableQty += BinContent.Quantity;
            until BinContent.Next() = 0;
        if AvailableQty < RequiredQty then
            Error(
                'Insufficient bin inventory for Item %1 at Location %2. Available: %3, Required: %4.',
                ItemNo, LocationCode, AvailableQty, RequiredQty);
    end;
}

