page 80171 "Customer Order List"
{
    ApplicationArea = All;
    Caption = 'Customer Order List';
    PageType = List;
    SourceTable = "Customer Order";
    UsageCategory = Lists;
    CardPageId = "Customer Order Card";


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Order Series"; Rec."Order Series")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
