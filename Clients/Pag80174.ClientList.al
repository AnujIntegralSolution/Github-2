page 80174 "Client List"
{
    ApplicationArea = All;
    Caption = 'Client List';
    PageType = List;
    SourceTable = "Clients Header";
    UsageCategory = Tasks;
    CardPageId = "Client Card";
    Editable = false;
    AutoSplitKey = true;
    DelayedInsert = false;
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
                field("Customer Picture"; Rec."Customer Picture")
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleExprtxts;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }

                field("Unit Cost"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleExprtxts;
                }

                field("Last Date Modified"; Rec."Last Date Modified")
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
            action(ImportMultipleCustomerPictures)
            {
                Caption = 'Import Pictures';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Import;
                ToolTip = 'Import Pictures';

                trigger OnAction()
                var
                    IMPCustPicture: Codeunit ImportPictures;
                begin
                    IMPCustPicture.ImportPicturesFromZip();
                end;
            }
        }
    }



    ///----ST----ImportPictures--Start-------///

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        StyleExprtxt := changeColor.GetColor(rec);

        if (rec."Unit Price" < 1000) then
            StyleExprtxts := 'Unfavorable'
        else
            StyleExprtxts := 'Favorable';
    end;



    trigger OnOpenPage();
    var
        CL: Record "Clients Header";
    begin
        CL.setfilter("No.", '50000..');
        if CL.findset(false) then
            repeat
                if CL."No." = '60000' then
                    CL.Delete();
            until CL.Next() = 0;
    end;







    ///----ST----ImportPictures--End-------///
    var
        StyleExprtxt: text[50];
        StyleExprtxts: text[50];
        changeColor: Codeunit "Change Color";
}