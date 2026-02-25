codeunit 80155 ImportExcelData
{

    procedure ReadExcelSheet()
    var
        FileManagent: Codeunit "File Management";
        Istream: InStream;
        FromFile: Text[100];
    begin
        UploadIntoStream(UploadMsg, '', '', FromFile, Istream);
        if FromFile <> '' then begin
            FileName := FileManagent.GetFileName(FromFile);
            SheetName := TempExcelBuffer.SelectSheetsNameStream(Istream);
        end else
            Error(NoFileMsg);
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(Istream, SheetName);
        TempExcelBuffer.ReadSheet();
    end;

    procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text

    begin
        TempExcelBuffer.Reset();
        if TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;

    procedure ImportExcelData()
    var
        GSImportBuffer: Record "Customer Excel Buffer";
        RowNo: Integer;
        ColNo: Integer;
        LineNO: Integer;
        MaxRow: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRow := 0;
        LineNO := 0;
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then begin
            MaxRow := TempExcelBuffer."Row No.";
        end;
        for RowNo := 2 to MaxRow do begin
            LineNO := LineNO + 10000;
            GSImportBuffer.Init();
            Evaluate(GSImportBuffer."No.", GetValueAtCell(RowNo, 1));
            Evaluate(GSImportBuffer.Name, GetValueAtCell(RowNo, 2));
            Evaluate(GSImportBuffer."Search Name", GetValueAtCell(RowNo, 3));
            Evaluate(GSImportBuffer.Address, GetValueAtCell(RowNo, 4));
            Evaluate(GSImportBuffer."Address 2", GetValueAtCell(RowNo, 5));
            Evaluate(GSImportBuffer.City, GetValueAtCell(RowNo, 6));
            Evaluate(GSImportBuffer."Ship-to Code", GetValueAtCell(RowNo, 7));
            Evaluate(GSImportBuffer."Customer Posting Group", GetValueAtCell(RowNo, 8));
            Evaluate(GSImportBuffer."Country/Region Code", GetValueAtCell(RowNo, 9));
            Evaluate(GSImportBuffer."Last Date Modified", GetValueAtCell(RowNo, 10));
            Evaluate(GSImportBuffer."Gen. Bus. Posting Group", GetValueAtCell(RowNo, 11));
            Evaluate(GSImportBuffer."Post Code", GetValueAtCell(RowNo, 12));
            Evaluate(GSImportBuffer."State Code", GetValueAtCell(RowNo, 13));
            GSImportBuffer.Insert();
        end;
        Message(ExcelImportSuccess);
    end;

    var
        TransName: Code[10];
        FileName: Text[100];
        SheetName: Text[100];
        TempExcelBuffer: Record "Excel Buffer" temporary;
        UploadMsg: Label 'Please choose the Excel file';
        NoFileMsg: Label 'No Excel file found';
        BatchIsblankmsg: Label 'Trasaction name is blank';
        ExcelImportSuccess: Label 'Excel imported successfully';



}
