page 80177 "Customer Excel Buffer List"
{
    ApplicationArea = All;
    Caption = 'Customer Excel Buffer List';
    SourceTable = "Customer Excel Buffer";
    PageType = List;
    UsageCategory = Tasks;
    AutoSplitKey = true;
    DelayedInsert = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    SaveValues = true;
    SourceTableView = sorting("No.");
    CardPageId = "Customer Excel Buffer Card";

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
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }

                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }

                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = All;
                }

                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
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
        area(navigation)
        {
            group("&Get")
            {
                Caption = '&Get';
                Image = Action;

                action("Import to BC")
                {
                    Caption = 'Import to BC';
                    ToolTip = 'Import data from excel';
                    ApplicationArea = Basic, Suite;
                    Image = Statistics;
                    ShortCutKey = 'F7';

                    trigger OnAction()
                    var
                        IMPCodeunit: Codeunit ImportExcelData;
                    begin
                        IMPCodeunit.ReadExcelSheet();
                        IMPCodeunit.ImportExcelData();
                    end;
                }
            }
        }

    }
}
