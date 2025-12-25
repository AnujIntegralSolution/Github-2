codeunit 80145 "Import Export Buffers"
{



    // ------CSV  Buffer -------///

    procedure ReadCSVdata()
    var
        FileManagent: Codeunit "File Management";
        Istream: InStream;
        FromFile: Text[100];
    begin
        UploadIntoStream(UploadMsg, '', '', FromFile, Istream);
        if FromFile <> '' then begin
            FileName := FileManagent.GetFileName(FromFile);
        end else
            Error(NoFileMsg);
        TempCSVBuffer.Reset();
        TempCSVBuffer.DeleteAll();
        TempCSVBuffer.LoadDataFromStream(Istream, ',');
        TempCSVBuffer.GetNumberOfLines();
    end;

    procedure GetValueAtCSVCell(RowNo: Integer; ColNo: Integer): Text
    begin
        TempCSVBuffer.Reset();
        if TempCSVBuffer.Get(RowNo, ColNo) then
            exit(TempCSVBuffer.Value)
        else
            exit('');
    end;


    procedure ImportCSVData()
    var
        GSImportBuffer: Record "GS CSV Import Buffer";
        RowNo: Integer;
        ColNo: Integer;
        LineNO: Integer;
        MaxRow: Integer;
    begin
        RowNo := 0;
        ColNo := 0;
        MaxRow := 0;
        LineNO := 0;
        TempCSVBuffer.Reset();
        if TempCSVBuffer.FindLast() then begin
            MaxRow := TempCSVBuffer."Line No.";
        end;
        for RowNo := 2 to MaxRow do begin
            LineNO := LineNO + 10000;
            GSImportBuffer.Init();
            Evaluate(GSImportBuffer."No.", GetValueAtCSVCell(RowNo, 1));
            Evaluate(GSImportBuffer.Name, GetValueAtCSVCell(RowNo, 2));
            Evaluate(GSImportBuffer."Search Name", GetValueAtCSVCell(RowNo, 3));
            Evaluate(GSImportBuffer.Address, GetValueAtCSVCell(RowNo, 4));
            Evaluate(GSImportBuffer."Address 2", GetValueAtCSVCell(RowNo, 5));
            Evaluate(GSImportBuffer.City, GetValueAtCSVCell(RowNo, 6));
            GSImportBuffer.Insert();
        end;
        Message(ImportSuccess);
    end;


    // ------CSV  Buffer -------///


    // ------Excel Buffer -------///


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

    procedure ExcelGetValueAtCell(RowNo: Integer; ColNo: Integer): Text

    begin
        TempExcelBuffer.Reset();
        if TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;

    procedure ImportExcelData()
    var
        GSImportBuffer: Record "GS Excel Import Buffer";
        RowNo: Integer;
        ColNo: Integer;
        LineNO: Integer;
        MaxRow: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRow := 0;
        LineNO := 0;

        GSImportBuffer.Reset();
        if GSImportBuffer.FindLast() then
            LineNO := GSImportBuffer."Line No.";
        TempExcelBuffer.Reset();

        if TempExcelBuffer.FindLast() then begin
            MaxRow := TempExcelBuffer."Row No.";
        end;

        for RowNo := 2 to MaxRow do begin
            LineNO := LineNO + 10000;

            GSImportBuffer.Init();
            GSImportBuffer."Line No." := LineNO;
            Evaluate(GSImportBuffer."Product No.", ExcelGetValueAtCell(RowNo, 1));
            Evaluate(GSImportBuffer."Customer-No.", ExcelGetValueAtCell(RowNo, 2));
            Evaluate(GSImportBuffer.Date, ExcelGetValueAtCell(RowNo, 3));
            GSImportBuffer.Insert();
        end;
        Message(ImportSuccess);


    end;

    //--------Export-----//



    procedure ExportCustLedgerEntries(var ExcelBUffer: Record "GS Excel Import Buffer")
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        CustLedgerEntriesLbl: Label 'GS Excel Import Buffer';
        ExcelFileName: Label 'GS Excel Import Buffer _%1_%2';
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(ExcelBUffer.FieldCaption("Product No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(ExcelBUffer.FieldCaption("Customer-No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(ExcelBUffer.FieldCaption(Date), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

        if ExcelBUffer.FindSet() then
            repeat
                TempExcelBuffer.NewRow();
                TempExcelBuffer.AddColumn(ExcelBUffer."Product No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(ExcelBUffer."Customer-No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::text);
                TempExcelBuffer.AddColumn(ExcelBUffer.Date, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::date);

            until ExcelBUffer.Next() = 0;
        TempExcelBuffer.CreateNewBook(CustLedgerEntriesLbl);
        TempExcelBuffer.WriteSheet(CustLedgerEntriesLbl, CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(StrSubstNo(ExcelFileName, CurrentDateTime, UserId));
        TempExcelBuffer.OpenExcel();
    end;

    // ------Excel Buffer -------///



























    var
        FileName: Text[100];
        SheetName: Text[100];
        TempCSVBuffer: Record "CSV Buffer" temporary;
        TempExcelBuffer: Record "Excel Buffer" temporary;
        UploadMsg: Label 'Please choose the file';
        NoFileMsg: Label 'No file found';
        BatchIsblankmsg: Label 'Trasaction name is blank';
        ImportSuccess: Label 'imported successfully';



}

