pageextension 80142 "Purchase List" extends "Purchase Order List"
{
    actions
    {
        addafter(Release)
        {
            action(GetPurchCount)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    GetCount: Codeunit "Get Purchase Details";
                begin
                    GetCount.GetPurchaseCount(rec."Buy-from Vendor No.")
                end;
            }
            action(GetPurchAmount)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    GetCount: Codeunit "Get Purchase Details";
                begin
                    GetCount.GetPurchaseAmount(rec."Buy-from Vendor No.")
                end;
            }
            action(GetPurchLineCount)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    GetCount: Codeunit "Get Purchase Details";
                begin
                    GetCount.GetPurchaseLineCount(rec."Buy-from Vendor No.")
                end;
            }
            action(GetPurchLineAmount)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    GetCount: Codeunit "Get Purchase Details";
                begin
                    GetCount.GetPurchaseLineAmount(rec."Buy-from Vendor No.")
                end;
            }
        }
    }
}
