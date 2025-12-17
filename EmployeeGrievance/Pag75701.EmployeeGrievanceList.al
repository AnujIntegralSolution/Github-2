page 80141 "Employee Grievance List"
{
    ApplicationArea = All;
    Caption = 'Employee Grievance List';
    PageType = List;
    SourceTable = "Employee Grievance Header";
    UsageCategory = Lists;
    CardPageId = "Employee Grievance Card";
    // CardPageId = "Permission Set by User";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Grievance ID"; Rec."Grievance ID")
                {
                    applicationArea = All;
                }
                field("Date of Submission"; Rec."Date of Submission")
                {
                    applicationArea = All;
                }
                field("Date of Incident"; Rec."Date of Incident")
                {
                    applicationArea = All;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    applicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    applicationArea = All;
                }
                field("HR Verification"; Rec."HR Verification")
                {
                    applicationArea = All;
                }
                field("HR Verification Date"; Rec."HR Verification Date")
                {
                    applicationArea = All;
                }
                // field(Closed; Rec.Closed)
                // {
                //     applicationArea = All;
                // }
                field("Closed By"; Rec."Closed By")
                {
                    applicationArea = All;
                }
                field("Closed Date"; Rec."Closed Date")
                {
                    applicationArea = All;
                }
            }
        }
    }
}
