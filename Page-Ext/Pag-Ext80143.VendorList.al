pageextension 80143 "Vendor List" extends "Vendor List"
{
    actions
    {
        addafter("Sent Emails")
        {

            action(GetVendorName)
            {
                ApplicationArea = All;
                Image = CodesList;
                Promoted = true;
                trigger OnAction()
                var
                    GetVendorCodeunit: Codeunit "Get Vendor Details";
                begin
                    GetVendorCodeunit.Run(rec);
                end;
            }

            action(GetCount)
            {
                ApplicationArea = All;
                Image = CodesList;
                Promoted = true;

                trigger OnAction()
                var
                    recVendor: Record Vendor;
                    recPurch: Record "Purchase Header";
                    counts: Integer;
                begin
                    recPurch.Reset();
                    recPurch.SetRange("Document Type", recPurch."Document Type"::Order);
                    recPurch.setrange("Buy-from Vendor No.", rec."No.");
                    if recPurch.FindSet() then
                        Message('%1', recPurch.Count);
                end;
            }
            action(GetAmount)
            {
                ApplicationArea = All;
                Image = AmountByPeriod;
                Promoted = true;
                trigger OnAction()
                var
                    recVendor: Record Vendor;
                    recPurch: Record "Purchase Header";
                    Total: Decimal;
                begin
                    recPurch.Reset();
                    recPurch.SetRange("Document Type", recPurch."Document Type"::Order);
                    recPurch.setrange("Buy-from Vendor No.", rec."No.");
                    if recPurch.FindSet() then begin
                        repeat
                            recPurch.CalcFields(Amount);
                            Total += recPurch.Amount;
                        until recPurch.Next() = 0;
                        Message('%1', Total);
                    end;
                end;
            }


            action("Get Line Count")
            {
                ApplicationArea = All;
                Image = LineDescription;
                Promoted = true;

                trigger OnAction()
                var
                    recVendor: Record Vendor;
                    recPurch: Record "Purchase Header";
                    recPurchLine: Record "Purchase Line";
                    Count: Integer;
                begin
                    recPurch.Reset();
                    recPurch.SetRange("Document Type", recPurch."Document Type"::Order);
                    recPurch.setrange("Buy-from Vendor No.", rec."No.");
                    if recPurch.FindSet() then begin
                        recPurchLine.Reset();
                        recPurchLine.SetRange("Document Type", recPurchLine."Document Type"::Order);
                        recPurchLine.SetRange("Buy-from Vendor No.", recPurch."Buy-from Vendor No.");
                        if recPurchLine.FindSet() then
                            count += recPurchLine.Count;
                        Message('%1', recPurchLine.Count);
                    end;
                end;
            }

            action("Get Line Amount")
            {
                ApplicationArea = All;
                Image = AmountByPeriod;
                Promoted = true;

                trigger OnAction()
                var
                    recVendor: Record Vendor;
                    recPurch: Record "Purchase Header";
                    recPurchLine: Record "Purchase Line";
                    Total: Decimal;
                begin
                    recPurch.Reset();
                    recPurch.SetRange("Document Type", recPurch."Document Type"::Order);
                    recPurch.setrange("Buy-from Vendor No.", rec."No.");
                    if recPurch.FindSet() then begin
                        recPurchLine.Reset();
                        recPurchLine.SetRange("Document Type", recPurchLine."Document Type"::Order);
                        recPurchLine.SetRange("Buy-from Vendor No.", recPurch."Buy-from Vendor No.");
                        if recPurchLine.FindSet() then
                            repeat
                                Total += recPurchLine."Line Amount";
                            until recPurchLine.Next() = 0;
                        Message('%1', Total);
                    end;
                end;
            }
        }
    }
}

// action(GetCount)
// {
//     ApplicationArea = All;
//     Promoted = true;
//     PromotedCategory = Process;
//     PromotedIsBig = true;
//     trigger OnAction()
//     var
//         varCount: integer;
//     begin
//         varCount := GetPurchaseCount(rec."No.");
//         Message('%1', varCount);
//     end;
// }


// action(GetPurchaseAmount)
// {
//     ApplicationArea = All;
//     Promoted = true;
//     PromotedCategory = Process;
//     PromotedIsBig = true;
//     trigger OnAction()
//     var
//         varAmount: Decimal;
//     begin
//         varAmount := GetPurchaseAmount(rec."No.");
//         Message('%1', varAmount);
//     end;
// }



// action(GetPurchaseLineCount)
// {
//     ApplicationArea = All;
//     Promoted = true;
//     PromotedCategory = Process;
//     PromotedIsBig = true;
//     trigger OnAction()
//     var
//         varLineCount: integer;
//     begin
//         varLineCount := GetPurchaseLineCount(rec."No.");
//         Message('%1', varLineCount);
//     end;
// }

// action(GetPurchaseLineAmount)
// {
//     trigger OnAction()
//     var
//         varLineAmount: Decimal;
//     begin
//         varLineAmount := GetPurchaseLineAmount(rec."No.");
//         Message('%1', varLineAmount);
//     end;
// }


// trigger OnOpenPage()
// var
//     myInt: Integer;
// begin
//     Codeunit.Run(Codeunit::"Get Vendor Details");
// end;


