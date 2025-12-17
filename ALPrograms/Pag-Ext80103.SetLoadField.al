pageextension 80141 "Set Load Field" extends "Item List"
{

    trigger OnOpenPage()
    var
        Cnt: Integer;
        item: Record item;
        Total: Decimal;
    begin
        item.SetLoadFields(item."Unit Cost");
        if item.FindSet() then begin
            repeat
                Total += item."Unit Cost";
                Cnt += 1;
            until item.Next() = 0;
            Message(Format(Total / Cnt));
        end;
    end;
}
