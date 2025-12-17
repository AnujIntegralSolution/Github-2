report 80141 "Employee Grievance Report"
{
    ApplicationArea = All;
    Caption = 'Employee Grievance Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = '.vscode/Report_Layout/Employee Grievance Report.rdl';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(EmployeeGrievanceHeader; "Employee Grievance Header")
        {
            RequestFilterFields = "Grievance ID";
            column(GrievanceID; "Grievance ID")
            {
            }
            column(DateofSubmission; "Date of Submission")
            {
            }
            column(DateofIncident; "Date of Incident")
            {
            }
            column(EmployeeNo; "Employee No.")
            {
            }
            column(EmployeeName; "Employee Name")
            {
            }
            column(Company; Company)
            {
            }
            column(HRVerification; "HR Verification")
            {
            }
            column(HRVerificationDate; "HR Verification Date")
            {
            }

            column(ClosedBy; "Closed By")
            {
            }
            column(Submit_Date; "Submit Date")
            {

            }
            column(ClosedDate; "Closed Date")
            {
            }


            dataitem("Employee Grievance Lines"; "Employee Grievance Lines")
            {
                DataItemLink = "Grievance ID" = field("Grievance ID");
                column(Accused_Employee_Code; "Accused Employee Code")
                {
                }
                column(Accused_Employee_Name; "Accused Employee Name")
                {
                }
                column(Grievance_Description_1; "Grievance Description 1")
                {
                }
                column(Grievance_Description_2; "Grievance Description 2")
                {
                }
                column(HR_Initial_Comment; "HR Initial Comment")
                {
                }
                column(HR_Final_Comment; "HR Final Comment")
                {
                }
                column(Investigation; Investigation)
                {
                }
                column(Investigation_Completed_On; "Investigation Completed On")
                {
                }
                column(Investigated_By; "Investigated By")
                {
                }
                column(Remarks_; "Remarks")
                {
                }
            }
        }
    }
}