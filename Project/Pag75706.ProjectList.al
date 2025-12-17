page 80146 "Project List"
{
    ApplicationArea = All;
    Caption = 'Project List';
    PageType = List;
    SourceTable = "Project";
    UsageCategory = Lists;
    CardPageId = "Project Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Employee ID"; Rec."Employee ID")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }

                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = All;
                }
                field("No of Order"; Rec."No of Order")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    // trigger OnValidate()
                    // begin
                    //     if rec.Quantity < 1000 then begin
                    //         Error('Your Quantity is less then 1000');
                    //     end else
                    //         Rec.Status := Rec.Status::Release;
                    // end;
                }
                // field(Status; Rec.Status)
                // {
                //     ApplicationArea = All;
                // }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Setrange)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    rec.Reset();
                    Rec.SetRange("Sell-to Customer No.", 'CUS0003', 'CUS0006');
                    if Rec.FindSet() then
                        repeat
                            Message('Sell-to Customer No. %1', Rec."Sell-to Customer No.");
                        until Rec.Next() = 0;
                end;
            }

            action(Setfilter)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    rec.Reset();
                    // Rec.SetFilter("Document Type", 'Order');
                    Rec.SetFilter("Document Type", 'Blanket Order');
                    Message('Document Type %1', Rec."Document Type");
                end;
            }




            action("Get Order")
            {
                ApplicationArea = All;
                Image = GetOrder;
                trigger OnAction()
                var
                    recSales: Record "Sales Header";
                begin
                    rec.Reset();
                    recSales.SetRange("Document Type", recSales."Document Type"::Order);
                    recSales.SetRange("Sell-to Customer No.", rec."Sell-to Customer No.");
                    if recSales.FindFirst() then begin
                        repeat
                            rec."No Of Order" := recSales.Count;
                            rec.Modify();
                        until recSales.Next() = 0;
                    end else
                        Message('Order No. Not Found');
                end;
            }

            action("Update Email")
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                    recCust: Record Customer;
                begin
                    if Dialog.Confirm('Sure to Change Customer E-Mail') then
                        if recCust.get(rec."Sell-to Customer No.") then begin
                            recCust."E-Mail" := rec."Customer E-Mail";
                            recCust.Modify();
                        end;
                end;
            }
        }
    }
    var
        varProject: Record Project;
}

