page 80151 "Sales Summary List"
{
    ApplicationArea = All;
    Caption = 'Sales Summary List';
    PageType = List;
    SourceTable = "Sales Summary";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Customer No.';
                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Customer Name';
                }
                field("Total Sales"; Rec."Total Sales")
                {
                    ApplicationArea = all;
                    ToolTip = 'Total Sales';
                }
                field("Open Order"; Rec."Open Order")
                {
                    ApplicationArea = all;
                    ToolTip = 'Open Order';
                }
                field("Number of Orders"; Rec."Number of Orders")
                {
                    ApplicationArea = all;
                    ToolTip = 'Number of Orders';
                }
            }
        }
    }
}
