page 80154 "Excel Buffer"
{
    ApplicationArea = All;
    Caption = 'Excel Buffer';
    PageType = List;
    SourceTable = "GS Excel Import Buffer";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Product No."; Rec."Product No.")
                {

                    ApplicationArea = All;
                }
                field("Customer-No."; Rec."Customer-No.")
                {

                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
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
            action("Excel Import")
            {
                ApplicationArea = All;
                Caption = '&Import';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Import data from excel';

                trigger OnAction()
                var
                    GetExcelBuffer: Codeunit "Import Export Buffers";
                begin
                    GetExcelBuffer.ReadExcelSheet();
                    GetExcelBuffer.ImportExcelData();
                end;
            }


            action("Excel Export")
            {
                ApplicationArea = All;
                Caption = '&Export';
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Export data from excel';

                trigger OnAction()
                var
                    GetExcelBuffer: Codeunit "Import Export Buffers";
                begin
                    GetExcelBuffer.ExportCustLedgerEntries(rec);
                end;
            }
        }
    }
}
