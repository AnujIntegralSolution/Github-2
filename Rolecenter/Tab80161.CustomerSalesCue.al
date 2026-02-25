table 80161 "Customer Sales Cue"
{
    Caption = 'Customer Sales Cue';

    fields
    {
        field(1; "Customer No."; code[20])
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

        field(4; "Unit Price"; Decimal)
        {
            CalcFormula = sum("Sales Line"."Unit Price" where("Document Type" = filter(order), "sell-to Customer No." = field("Customer No.")));
            Caption = 'Unit Price';
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
