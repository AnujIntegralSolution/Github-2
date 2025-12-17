page 80142 "Employee Grievance Card"
{
    ApplicationArea = All;
    Caption = 'Employee Grievance Card';
    PageType = Card;
    SourceTable = "Employee Grievance Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                // Editable = rec.Status <> rec.Status::Closed;

                field("Grievance ID"; Rec."Grievance ID")
                {
                    ApplicationArea = All;
                    Editable = blnReqFieldEditable;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("Date of Incident"; Rec."Date of Incident")
                {
                    ApplicationArea = All;
                }
                field("Date of Submission"; Rec."Date of Submission")
                {
                    ApplicationArea = All;
                }
                field(Company; Rec.Company)
                {
                    ApplicationArea = All;
                }
                field("HR Verification"; Rec."HR Verification")
                {
                    ApplicationArea = All;
                    Editable = blnReqHRHFieldEditable;
                }
                field("HR Verification Date"; Rec."HR Verification Date")
                {
                    ApplicationArea = All;

                }
                // field(Closed; Rec.Closed)
                // {
                //     ApplicationArea = All;
                //     Editable = blnReqHRHFieldEditable;
                // }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = All;
                }
                field("Closed Date"; Rec."Closed Date")
                {
                    ApplicationArea = All;
                }
                field("Submit Date"; Rec."Submit Date")
                {
                    ApplicationArea = All;
                }
                // field(Status; Rec.Status)
                // {
                //     ApplicationArea = All;

                //     trigger OnValidate()
                //     var
                //         myInt: Integer;
                //     begin
                //         CurrPage.Update();
                //     end;
                // }
            }
            part(Line; "Employee Grievance Subform")
            {
                SubPageLink = "Grievance ID" = field("Grievance ID");
                // Editable = rec.Status <> Rec.Status::Closed;


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(print)
            {
                ApplicationArea = all;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    recGriev: Record "Employee Grievance Header";
                begin
                    recGriev.SetRange("Grievance ID", rec."Grievance ID");
                    if recGriev.FindSet() then
                        Report.RunModal(Report::"Employee Grievance Report", true, false, recGriev);
                end;
            }
        }
    }
    // trigger OnAfterGetRecord()
    // var
    //     myInt: Integer;
    // begin
    //     if rec.Status = rec.Status::Submitted then
    //         blnReqHRHFieldEditable := true
    //     else
    //         blnReqHRHFieldEditable := false;

    // end;

    // trigger OnOpenPage()
    // var
    //     myInt: Integer;
    // begin
    //     if rec.Status <> rec.Status::" " then
    //         blnReqFieldEditable := false
    //     else
    //         blnReqFieldEditable := true;
    // end;

    var
        blnReqFieldEditable: Boolean;
        blnReqHRHFieldEditable: Boolean;

}
