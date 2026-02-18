page 80174 "Client List"
{
    ApplicationArea = All;
    Caption = 'Client List';
    PageType = List;
    SourceTable = "Clients Header";
    UsageCategory = Lists;
    CardPageId = "Client Card";
    Editable = false;

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

                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }

                field("Unit Cost"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleExprtxts;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleExprtxt;
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
                Caption = 'Import Multiple Customer Pictures';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Import;
                ToolTip = 'Import Multiple Customer Pictures';

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

    ///----ST----ImportPictures--End-------///
    var
        StyleExprtxt: text[50];
        StyleExprtxts: text[50];
        changeColor: Codeunit "Change Color";
}