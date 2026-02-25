page 80156 "Temp Role Center"
{
    Caption = 'Temp. Role Center';
    PageType = RoleCenter;
    CardPageId = "Business Manager Role Center";

    layout
    {
        area(rolecenter)
        {
            part(Headline; RoleCenterHeadline)
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control16; "Activities")
            {
                AccessByPermission = TableData "Activities Cue" = I;
                ApplicationArea = Basic, Suite;
            }

            part("Customer Sales Cue"; "Customer cards")
            {
                ApplicationArea = Suite;
            }
            part("Temp Cust.SalesOrd.Cue"; "Temp Customer Sales Order Cue")
            {
                ApplicationArea = Basic, Suite;
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
                RunPageMode = View;
                ToolTip = 'Offer items or services to a customer.';
            }
            action("Sales Order")
            {
                AccessByPermission = TableData "Sales Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Order';
                Image = NewOrder;
                RunObject = Page "Sales Order";
                RunPageMode = View;
                ToolTip = 'Create a new sales order for items or services.';
            }
            action("Sales Invoice")
            {
                AccessByPermission = TableData "Sales Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Invoice';
                Image = NewSalesInvoice;
                RunObject = Page "Sales Invoice";
                RunPageMode = View;
                ToolTip = 'Create a new invoice for the sales of items or services. Invoice quantities cannot be posted partially.';
            }
            action("Purchase Quote")
            {
                AccessByPermission = TableData "Purchase Header" = IMD;
                ApplicationArea = Suite;
                Caption = 'Purchase Quote';
                Image = NewSalesQuote;
                RunObject = Page "Purchase Quote";
                RunPageMode = View;
                ToolTip = 'Create a new purchase quote.';
            }
            action("Purchase Order")
            {
                AccessByPermission = TableData "Purchase Header" = IMD;
                ApplicationArea = Suite;
                Caption = 'Purchase Order';
                Image = NewOrder;
                RunObject = Page "Purchase Order";
                RunPageMode = View;
                ToolTip = 'Create a new purchase order.';
            }
            action("Purchase Invoice")
            {
                AccessByPermission = TableData "Purchase Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Invoice';
                Image = NewPurchaseInvoice;
                RunObject = Page "Purchase Invoice";
                RunPageMode = View;
                ToolTip = 'Create a purchase invoice to mirror a sales document sent by a vendor.';
            }



            action("Employee Grievance")
            {
                AccessByPermission = TableData "Employee Grievance Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Employee Grievance';
                Image = Employee;
                RunObject = Page "Employee Grievance List";
                RunPageMode = View;
            }

            action(Book)
            {
                AccessByPermission = TableData Book = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Book';
                Image = NewDepreciationBook;
                RunObject = Page "Book List";
                RunPageMode = View;
            }

            action(Navigation)
            {
                AccessByPermission = TableData "Navigation Header" = IMD;
                ApplicationArea = Basic, Suite;
                Caption = 'Navigation';
                Image = NavigationPane;
                RunObject = Page "Navigation List";
                RunPageMode = View;
            }








        }

    }
}
