page 80168 "Customer Data"
{
    ApplicationArea = All;
    Caption = 'Customer Data';
    PageType = List;
    SourceTable = Customer;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    StyleExpr = MyStyleExprs;
                }

                field(Name; Rec.Name)
                {
                    ApplicationArea = All;

                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                    StyleExpr = MyStyleExpr;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
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
                field("Phone No."; Rec."Phone No.")
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
        area(Navigation)
        {
            action(Get)
            {
                trigger OnAction()
                begin
                    if CustomerRec.GET('4711') then
                        Message('%1', CustomerRec.Name)
                    else
                        Message('Cusstomer not found');
                end;
            }

            action(GetSystemid)
            {
                trigger OnAction()
                var
                    Customer: Record Customer;
                    Text000: Label 'Customer was found.';
                begin
                    If Customer.GetBySystemId('{5286305A-08A3-E911-8180-001DD8B7338E}') then
                        Message(Text000);
                end;
            }
            action(CalcSum)
            {
                trigger OnAction()
                var
                    MyFieldRef: FieldRef;
                    MyRecRef: RecordRef;
                begin
                    MyRecRef.Open(21);
                    MyFieldRef := MyRecRef.Field(18);
                    Message('Before CalcSum, Sales (LCY) is %1.', MyFieldRef.Value);
                    MyFieldRef.CalcSum;
                    Message('After CalcSum, Sales (LCY) is %1.', MyFieldRef.Value);
                end;
            }
        }
    }




    trigger OnAfterGetRecord();
    begin
        MyStyleExpr := 'Standard';
        if (rec.Balance < 10000) then
            MyStyleExpr := 'Ambiguous'
        else
            MyStyleExpr := 'Unfavorable';

        if (rec."No." <= '30000') then
            MyStyleExprs := 'Favorable'
        else
            MyStyleExprs := 'StrongAccent';
    end;

    var
        CustomerRec: Record Customer;
        MyStyleExpr: Text;
        MyStyleExprs: Text;
}