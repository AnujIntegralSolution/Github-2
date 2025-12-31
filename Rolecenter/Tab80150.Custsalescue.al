table 80150 "Cust. sales cue"
{
    Caption = 'Cust. sales cue';


    fields
    {

        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(2; "No. of Orders"; Integer)
        {
            CalcFormula = count("Sales Header" where("Document Type" = const(Order),
                                                      "Sell-to Customer No." = field("Customer No.")));
            Caption = 'No. of Orders';
            FieldClass = FlowField;
        }
        field(3; "No. of Invoice"; Integer)
        {
            CalcFormula = count("Sales Header" where("Document Type" = const(Invoice),
                                                      "Sell-to Customer No." = field("Customer No.")));
            Caption = 'No. of Invoice';
            FieldClass = FlowField;
        }

        field(4; Amount; Decimal)
        {
            CalcFormula = sum("Sales Line".Amount where("Document Type" = filter(order), "sell-to Customer No." = field("Customer No.")));
            Caption = 'Amount';
            FieldClass = FlowField;
        }

        field(5; "Amount Including VAT"; Decimal)
        {
            CalcFormula = sum("Sales Line"."Amount Including VAT" where("Document Type" = filter(order), "sell-to Customer No." = field("Customer No.")));
            Caption = 'Amount Including VAT';
            FieldClass = FlowField;
        }

        field(6; Quantity; Decimal)
        {
            CalcFormula = sum("Sales Line".Quantity where("Document Type" = filter(order), "sell-to Customer No." = field("Customer No.")));
            Caption = 'Quantity';
            FieldClass = FlowField;

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
