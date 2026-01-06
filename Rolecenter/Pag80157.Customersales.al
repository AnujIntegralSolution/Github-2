page 80157 "Cust. sales"
{
    ApplicationArea = All;
    Caption = 'Cust. sales';
    PageType = Card;
    SourceTable = "Cust. sales cue";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
