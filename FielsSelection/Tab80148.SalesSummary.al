table 80148 "Sales Summary"
{
    Caption = 'Sales Summary';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(2; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(customer.Name where("No." = field("Customer No.")));
        }

        field(3; "Total Sales"; Decimal)
        {
            Caption = 'Total Sales';
            FieldClass = FlowField;
            CalcFormula = sum("Sales Invoice Line".Amount where("Sell-to Customer No." = field("Customer No.")));
        }
        field(4; "Open Order"; Decimal)
        {
            Caption = 'Open Order';
            FieldClass = FlowField;
            CalcFormula = sum("Sales Line".Amount where("Document Type" = const(Order),
             "Sell-to Customer No." = field("Customer No."), "Outstanding Quantity" = filter(<> 0)));
        }

        field(5; "Number of Orders"; Integer)
        {
            Caption = 'Number of Orders';
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" where("Document Type" = const(Order), "Sell-to Customer No." = field("Customer No.")));
        }


        field(6; "Sales Orders Amount"; Decimal)
        {
            Caption = 'Number of Orders';
            FieldClass = FlowField;
            CalcFormula = sum("Sales Header".Amount where("Document Type" = const(Order), "Sell-to Customer No." = field("Customer No.")));
        }






    }
    keys
    {
        key(PK; "Customer No.")
        {
            Clustered = true;
        }
    }
}
