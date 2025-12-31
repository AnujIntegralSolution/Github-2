page 80160 "Temp Customer Sales Order Cue"
{
    ApplicationArea = All;
    Caption = 'Temp. Customer Sales Order Cue';
    PageType = CardPart;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            cuegroup(Overview)
            {
                Caption = 'Overview';

                field("No. of Orders"; Rec."No. of Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Order List";
                }
                field("No. of Invoices"; Rec."No. of Invoices")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Invoice List";
                }
                field("No. of Pstd. Shipments"; Rec."No. of Pstd. Shipments")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Order List";
                }
                field("Inv. Amounts (LCY)"; Rec."Inv. Amounts (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Inv. Amounts';
                }
            }
        }
    }










    var
        varTotal: Decimal;
}
