page 80149 "GS CSV Imports"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "GS CSV Import Buffer";
    AutoSplitKey = true;
    Caption = 'GS CSV Import';
    DelayedInsert = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    SaveValues = true;
    SourceTableView = sorting("No.");

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = All;
                }
                field("State Code"; Rec."State Code")
                {
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("&Import")
            {
                ApplicationArea = All;
                Caption = '&Import';
                Image = ImportDatabase;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Import data from CSV';

                trigger OnAction()
                begin
                    ReadCSVdata();
                    ImportCSVData();
                end;
            }
        }
    }
    var
        TransName: Code[10];
        FileName: Text[100];
        TempCSVBuffer: Record "CSV Buffer" temporary;
        UploadMsg: Label 'Please choose the CSV file';
        NoFileMsg: Label 'No CSV file found';
        BatchIsblankmsg: Label 'Trasaction name is blank';
        CSVImportSuccess: Label 'CSV imported successfully';


    local procedure ReadCSVdata()
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

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin
        TempCSVBuffer.Reset();
        if TempCSVBuffer.Get(RowNo, ColNo) then
            exit(TempCSVBuffer.Value)
        else
            exit('');
    end;


    local procedure ImportCSVData()
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
        Message(CSVImportSuccess);
    end;
}