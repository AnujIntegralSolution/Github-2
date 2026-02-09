table 80151 Employeee
{
    Caption = 'Employeee';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Empcode"; Integer)
        {
            Caption = 'Employee Code';
        }
        field(2; "EmpName"; text[50])
        {
            Caption = 'Employee Name';
        }
        field(3; "EmpDepartment"; text[50])
        {
            Caption = 'Employee Department';
        }





    }
    keys
    {
        key(PK; "Empcode")
        {
            Clustered = true;
        }
    }
}
