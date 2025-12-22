page 80150 "Field Selection List"
{
    ApplicationArea = All;
    Caption = 'Field Selection List';
    PageType = List;
    SourceTable = "Field Selection Header";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Table No."; Rec."Table No.")
                {
                    ToolTip = 'Specifies the value of the Table No. field.', Comment = '%';
                    TableRelation = Field.TableNo;

                    trigger OnValidate()
                    var
                        FieldRec: Record "Field";
                    begin
                        FieldRec.SetRange(TableNo, rec."Table No.");
                        if FieldRec.FindFirst() then
                            rec."Table Name" := FieldRec.TableName;
                    end;
                }
                field("Table Name"; Rec."Table Name")
                {
                    ToolTip = 'Specifies the value of the Table Name field.', Comment = '%';
                }
                field("Filed No."; Rec."Filed No.")
                {
                    ToolTip = 'Specifies the value of the Filed No. field.', Comment = '%';

                    trigger OnLookup(var text: text): Boolean
                    var
                        FieldRec: Record Field;
                        FieldSelec: Codeunit "Field Selection";
                    begin
                        FieldRec.SetRange(TableNo, rec."Table No.");
                        FieldRec.FindSet();
                        FieldSelec.Open(FieldRec);
                        rec."Filed No." := FieldRec."No.";
                        rec."Field Name" := FieldRec.FieldName;
                    end;
                }
                field("Field Name"; Rec."Field Name")
                {
                    ToolTip = 'Specifies the value of the Field Name field.', Comment = '%';
                }
            }
        }
    }
}
