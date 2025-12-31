page 80158 "Temp Role Center"
{
    Caption = 'Temp. Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Headline; RoleCenterHeadline)
            {
                ApplicationArea = Basic, Suite;
            }
            part("Temp Cust.SalesOrd.Cue"; "Temp Customer Sales Order Cue")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Order';
            }
            part("Cust Sales Cue"; "Cust. sales cue")
            {
                ApplicationArea = Suite;
            }

        }
    }

    actions
    {
        area(creation)
        {
            action("Sales Quote")
            {
                AccessByPermission = TableData "Sales Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Quote';
                Image = NewSalesQuote;
                RunObject = Page "Sales Quote";
                RunPageMode = Create;
                ToolTip = 'Offer items or services to a customer.';
            }
            action("Sales Order")
            {
                AccessByPermission = TableData "Sales Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Order';
                Image = NewOrder;
                RunObject = Page "Sales Order";
                RunPageMode = Create;
                ToolTip = 'Create a new sales order for items or services.';
            }
            action("Sales Invoice")
            {
                AccessByPermission = TableData "Sales Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Invoice';
                Image = NewSalesInvoice;
                RunObject = Page "Sales Invoice";
                RunPageMode = Create;
                ToolTip = 'Create a new invoice for the sales of items or services. Invoice quantities cannot be posted partially.';
            }
            action("Purchase Quote")
            {
                AccessByPermission = TableData "Purchase Header" = IMD;
                ApplicationArea = Suite;
                Caption = 'Purchase Quote';
                Image = NewSalesQuote;
                RunObject = Page "Purchase Quote";
                RunPageMode = Create;
                ToolTip = 'Create a new purchase quote.';
            }
            action("Page Purchase Order")
            {
                AccessByPermission = TableData "Purchase Header" = IMD;
                ApplicationArea = Suite;
                Caption = 'Purchase Order';
                Image = NewOrder;
                RunObject = Page "Purchase Order";
                RunPageMode = Create;
                ToolTip = 'Create a new purchase order.';
            }
            action("Purchase Invoice")
            {
                AccessByPermission = TableData "Purchase Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Invoice';
                Image = NewPurchaseInvoice;
                RunObject = Page "Purchase Invoice";
                RunPageMode = Create;
                ToolTip = 'Create a purchase invoice to mirror a sales document sent by a vendor.';
            }
        }

    }
}
