codeunit 80144 "Import Warehouse Item Journal"
{
    trigger OnRun()
    begin
    end;

    var
        TemplateName: Code[20];
        EntryNo: Integer;
        BatchName: Code[20];

    procedure SetTemplateAndBatch(VarTemplateName: Code[10]; VarBatchName: Code[10])
    var
    begin
        TemplateName := VarTemplateName;
        BatchName := VarBatchName;
    end;

    procedure ImportExcelFile()
    var
        ExcelBuffer: Record "Excel Buffer" temporary;
        IStream: InStream;
        FileName: Text;
        SheetName: Text;
    begin

        if not UploadIntoStream('Import Excel File', '', 'Excel Files|*.xlsx;*.xls', FileName, IStream) then
            exit;
        SheetName := ExcelBuffer.SelectSheetsNameStream(IStream);
        ExcelBuffer.OpenBookStream(IStream, SheetName);
        ExcelBuffer.ReadSheet();
        ProcessExcelData(ExcelBuffer);
    end;

    local procedure ProcessExcelData(var ExcelBuffer: Record "Excel Buffer")
    var
        TotalRows: Integer;
        ProcessedRows: Integer;
        RowNo: Integer;
    begin
        if not ExcelBuffer.FindLast() then exit;
        TotalRows := ExcelBuffer."Row No.";

        if TotalRows = 0 then begin
            Message('No data found in Excel file');
            exit;
        end;
        EntryNo := 0;
        ExcelBuffer.SetCurrentKey("Row No.", "Column No.");
        for RowNo := 2 to TotalRows do begin
            if CreateJournalLine(ExcelBuffer, RowNo) then
                ProcessedRows += 1;
        end;
        Message('Successfully imported %1 of %2 lines', ProcessedRows, TotalRows - 1);
    end;

    local procedure CreateJournalLine(var ExcelBuffer: Record "Excel Buffer"; RowNo: Integer): Boolean
    var
        WhseJournalLine: Record "Warehouse Journal Line";
        DocumentNo: Text;
        FromBinCode, ToBinCode, UOMCode, ItemNo : Code[20];
        LocationCode: Code[10];
        DecQuantity: Decimal;
        LotNo: Code[50];
        LineNo: Integer;
    begin
        DocumentNo := GetCellValue(ExcelBuffer, RowNo, 1);
        LocationCode := CopyStr(GetCellValue(ExcelBuffer, RowNo, 2), 1, 10);
        ItemNo := CopyStr(GetCellValue(ExcelBuffer, RowNo, 3), 1, 20);
        if not Evaluate(DecQuantity, GetCellValue(ExcelBuffer, RowNo, 4)) then
            DecQuantity := 0;
        FromBinCode := CopyStr(GetCellValue(ExcelBuffer, RowNo, 5), 1, 50);
        // ToBinCode := CopyStr(GetCellValue(ExcelBuffer, RowNo, 6), 1, 50); AT
        UOMCode := CopyStr(GetCellValue(ExcelBuffer, RowNo, 7), 1, 50);
        LotNo := CopyStr(GetCellValue(ExcelBuffer, RowNo, 8), 1, 50);
        if (DocumentNo = '') or (ItemNo = '') or (LocationCode = '') or (LotNo = '') or (DecQuantity = 0) then begin
            Message('Row %1: Missing required data (Item No, Location, or Quantity)', RowNo);
            exit(false);
        end;

        // if DocumentDoesNoExistsInShipBin(DocumentNo, LocationCode, ItemNo, LotNo) then
        //     Error('Row %1: Document No. %2 does not exist in shipping bin for Item No. %3, Location Code %4, Lot No. %5',
        //         RowNo, DocumentNo, ItemNo, LocationCode, LotNo);

        LineNo := GetNextLineNumber();
        WhseJournalLine.Init();
        WhseJournalLine."Journal Template Name" := TemplateName;
        WhseJournalLine."Journal Batch Name" := BatchName;
        WhseJournalLine."Line No." := LineNo;
        WhseJournalLine.Validate("Location Code", LocationCode);
        WhseJournalLine.Insert(true);
        WhseJournalLine."Entry Type" := WhseJournalLine."Entry Type"::Movement;
        WhseJournalLine."Phys. Inventory" := false;
        WhseJournalLine."Whse. Document Type" := WhseJournalLine."Whse. Document Type"::"Whse. Journal";
        WhseJournalLine.validate("Whse. Document No.", DocumentNo);
        WhseJournalLine.Validate("Item No.", ItemNo);
        if FromBinCode <> '' then
            WhseJournalLine.validate("From Bin Code", FromBinCode)
        else
            WhseJournalLine.validate("From Bin Code", GetShipBinCode(LocationCode));
        WhseJournalLine.validate("Unit of Measure Code", UOMCode);
        if ToBinCode <> '' then
            WhseJournalLine.validate("To Bin Code", ToBinCode)
        else
            WhseJournalLine.validate("To Bin Code", GetDefaultBinCode(ItemNo, LocationCode));
        WhseJournalLine.Validate(Quantity, DecQuantity);
        WhseJournalLine."Reference No." := CopyStr(DocumentNo, 1, 20);
        WhseJournalLine."Registering Date" := Today();
        WhseJournalLine.Modify();
        if (LotNo <> '') then
            AddItemTrackingToWhseJnlLine(WhseJournalLine, LotNo, DecQuantity);
        exit(true);
    end;

    local procedure AddItemTrackingToWhseJnlLine(var WhseJnlLine: Record "Warehouse Journal Line"; LotNo: Code[50]; Qty: Decimal)
    var
        WhseItemTrackingLine: Record "Whse. Item Tracking Line";
        UOMMgt: Codeunit "Unit of Measure Management";
        c: Codeunit "Item Tracking Management";
    begin
        if EntryNo = 0 then begin
            WhseItemTrackingLine.Reset();
            if WhseItemTrackingLine.FindLast() then
                EntryNo := WhseItemTrackingLine."Entry No."
            else
                EntryNo := 1
        end else
            EntryNo += 1;
        Clear(WhseItemTrackingLine);
        WhseItemTrackingLine.Init();
        WhseItemTrackingLine.SetSource(Database::"Warehouse Journal Line", 0,
            WhseJnlLine."Journal Batch Name", WhseJnlLine."Line No.", WhseJnlLine."Journal Template Name", 0);
        EntryNo += 1;
        WhseItemTrackingLine."Entry No." := EntryNo;
        WhseItemTrackingLine."Item No." := WhseJnlLine."Item No.";
        WhseItemTrackingLine."Variant Code" := '';
        WhseItemTrackingLine."Location Code" := WhseJnlLine."Location Code";
        WhseItemTrackingLine."Qty. per Unit of Measure" := WhseJnlLine."Qty. per Unit of Measure";
        WhseItemTrackingLine.validate("Quantity (Base)", WhseJnlLine."Qty. (Base)");
        WhseItemTrackingLine.Validate("Lot No.", LotNo);
        WhseItemTrackingLine.Insert();
    end;

    local procedure GetCellValue(var ExcelBuffer: Record "Excel Buffer"; RowNo: Integer; ColumnNo: Integer): Text
    begin
        if ExcelBuffer.get(RowNo, ColumnNo) then
            exit(ExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;

    local procedure GetNextLineNumber(): Integer
    var
        WhseJournalLine: Record "Warehouse Journal Line";
    begin
        WhseJournalLine.SetRange("Journal Template Name", TemplateName);
        WhseJournalLine.SetRange("Journal Batch Name", BatchName);
        if WhseJournalLine.FindLast() then
            exit(WhseJournalLine."Line No." + 10000);
        exit(10000);
    end;

    local procedure GetShipBinCode(LocationCode: Code[10]): Code[20]
    var
        Location: Record Location;
        Bin: Record Bin;
    begin
        if not Location.Get(LocationCode) then
            exit('');
        exit(Location."Shipment Bin Code");
    end;

    local procedure GetDefaultBinCode(ItemNo: Code[20]; LocationCode: Code[10]): Code[20]
    var
        BinContent: Record "Bin Content";
        Location: Record Location;
    begin
        BinContent.SetRange("Location Code", LocationCode);
        BinContent.SetRange("Item No.", ItemNo);
        BinContent.SetRange(Default, true);
        if BinContent.FindFirst() then
            exit(BinContent."Bin Code");
    end;

    local procedure DocumentDoesNoExistsInShipBin(DocumentNo: Text; LocationCode: Code[10]; ItemNo: Code[20]; LotNo: Code[50]): Boolean
    var
        WarehouseEntry: Record "Warehouse Entry";
    begin
        WarehouseEntry.SetRange("Whse. Document Type", WarehouseEntry."Whse. Document Type"::Shipment);
        WarehouseEntry.SetRange("Whse. Document No.", DocumentNo);
        WarehouseEntry.SetRange("Location Code", LocationCode);
        WarehouseEntry.SetRange("Item No.", ItemNo);
        WarehouseEntry.SetRange("Lot No.", LotNo);
        Exit(WarehouseEntry.IsEmpty)
    end;

}