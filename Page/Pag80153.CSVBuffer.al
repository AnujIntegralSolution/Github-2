page 80153 "CSV Buffer"
{
    ApplicationArea = All;
    Caption = 'CSV Buffer';
    PageType = List;
    SourceTable = "GS CSV Import Buffer";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ToolTip = 'Specifies the value of the Search Name field.', Comment = '%';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ToolTip = 'Specifies the value of the Address 2 field.', Comment = '%';
                }
            }
        }
    }



    actions
    {
        area(Processing)
        {
            action("CSV Buffer")
            {
                trigger OnAction()
                var
                    GetCSV: Codeunit "Import Export Buffers";
                begin
                    GetCSV.ImportCSVData();
                    GetCSV.ReadCSVdata();
                end;
            }

        }
    }
}
