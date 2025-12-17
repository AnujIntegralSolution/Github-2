table 80145 "Project"
{
    Caption = 'Project';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Sales Header"."No." where("Document Type" = field("Document Type"));
        }

        field(3; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            TableRelation = Customer;


            trigger OnValidate()
            var
                recCust: Record Customer;
            begin
                if recCust.get(Rec."Sell-to Customer No.") then
                    rec."Customer Name" := recCust.Name;
            end;
        }
        field(5; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }
        field(6; "Customer E-Mail"; Text[80])
        {
            Caption = 'Customer E-Mail';
        }
        field(7; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(8; "Employee ID"; Code[20])
        {
            Caption = 'Employee ID';
            TableRelation = Employee;
            trigger OnValidate()
            var
                recEmp: Record Employee;
            begin
                if recEmp.Get(rec."Employee ID") then
                    Rec."Employee Name" := recEmp."First Name" else
                    rec."Employee Name" := '';
            end;
        }
        field(9; "Employee Name"; Text[50])
        {
            Caption = 'Employee Name';
        }

        field(10; "User ID"; Text[40])
        {
            Caption = 'User ID';
            TableRelation = User;

            trigger OnValidate()
            var
                recUser: Record User;
            begin
                if recUser.Get(rec."User ID") then
                    Rec."User Name" := recUser."User Name" else
                    rec."User Name" := '';
            end;
        }
        field(11; "User Name"; text[20])
        {
            Caption = 'User Name';
            Editable = false;
        }

        field(21; Amount; Decimal)
        {
            Caption = 'Amount';


        }
        // field(16; Status; enum "Release Status")
        // {
        //     Caption = 'Status';
        //     Editable = false;
        // }

        field(17; Quantity; Integer)
        {
            Caption = 'Quantity';
        }
        field(4; "Ship To Code"; code[20])
        {
            Caption = 'Ship To Code';
        }

        field(19; "Location Name"; text[50])
        {
            Caption = 'Location Name';
        }
        field(18; "No of Order"; Integer)
        {
            Caption = 'No of Order';
        }
        field(20; Post; Boolean)
        {
            Caption = 'Post';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
    }
}


