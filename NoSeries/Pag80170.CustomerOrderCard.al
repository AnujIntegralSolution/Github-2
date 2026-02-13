page 80170 "Customer Order Card"
{
    ApplicationArea = All;
    Caption = 'Customer Order Card';
    PageType = Card;
    SourceTable = "Customer Order";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Order Series"; Rec."Order Series")
                {
                    ApplicationArea = All;
                }

                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        GenerateOrderNo()
                    end;
                }
                field("Customer Name"; Rec."Customer Name")
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
            action(GenerateNo)
            {
                ApplicationArea = All;
                Image = NumberSetup;
                Caption = 'Generate Order Number';
                Promoted = true;
                trigger OnAction()
                begin
                    GenerateOrderNo()
                end;
            }
        }
    }
    local procedure GenerateOrderNo()
    var
        NoSeriesMgt: Codeunit "No. Series";
        OrderNo: code[20];
    begin
        if rec."Order Series" = '' then
            Error('Please Select the order series first');

        if Rec."Order No." <> '' then
            if not Confirm('An order no already exists. Do you wont to generate a new one ?', false) then
                exit;
        OrderNo := NoSeriesMgt.GetNextNo(rec."Order Series", WorkDate(), true);
        if Rec.Get(rec."Order No.") then begin
            rec."Order No." := OrderNo;
            rec.Modify(true)
        end else begin
            rec.Init();
            rec."Order No." := OrderNo;
            rec.Insert(true);
        end;
        Message('New record no generated : %1', rec."Order No.");
        CurrPage.Update(false);
    end;
}
