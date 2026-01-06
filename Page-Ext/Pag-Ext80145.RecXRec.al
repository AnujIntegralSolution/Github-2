pageextension 80145 RecXRec extends "Customer Card"
{
    trigger OnOpenPage()
    begin
        Message('On open page (Rec), the Name is: %1', Rec.Name);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        Message('On modify, the Name is (Rec): %1', Rec.Name);
        Message('On modify, the previous Name is (xRec) : %1', xRec.Name);
    end;

    var
        myInt: Integer;
}
