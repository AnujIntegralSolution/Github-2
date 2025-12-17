table 80142 "Employee Grievance Lines"
{
    Caption = 'Employee Grievance Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Grievance ID"; Code[20])
        {
            Caption = 'Grievance ID';
        }
        field(2; "Accused Employee Code"; Code[20])
        {
            Caption = 'Accused Employee Code';
            TableRelation = Employee;
            trigger OnValidate()
            var
                recEmp: Record Employee;
            begin
                if recEmp.get(rec."Accused Employee Code") then
                    rec."Accused Employee Name" := recEmp."First Name";
            end;
        }
        field(3; "Line No"; Integer)
        {
            Caption = 'Line No';
            AutoIncrement = true;
        }

        field(4; "Accused Employee Name"; Text[50])
        {
            Caption = 'Accused Employee Name ';
            Editable = false;
        }
        field(5; "Grievance Description 1"; Text[100])
        {
            Caption = 'Grievance Description 1';
        }
        field(6; "Grievance Description 2"; Text[100])
        {
            Caption = 'Grievance Description 2';
        }
        // field(7; Status; enum "Grievance Status")
        // {
        //     Caption = 'Status';
        //     Editable = false;
        // }
        field(8; "HR Initial Comment"; Text[100])
        {
            Caption = 'HR Initial Comment';
        }
        field(9; "HR Final Comment"; Text[100])
        {
            Caption = 'HR Final Comment';
        }
        field(10; Investigation; Boolean)
        {
            Caption = 'Investigation';
        }
        field(11; "Investigation Completed On"; Date)
        {
            Caption = 'Investigation Completed On';
        }
        field(12; "Investigated By"; Code[20])
        {
            Caption = 'Investigated By';
        }
        field(13; "Remarks"; Text[50])
        {
            Caption = 'Remarks';
        }
    }
    keys
    {
        key(PK; "Grievance ID", "Line No")
        {
            Clustered = true;
        }
    }


}
