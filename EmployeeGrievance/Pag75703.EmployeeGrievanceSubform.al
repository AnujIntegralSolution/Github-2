page 80143 "Employee Grievance Subform"
{
    ApplicationArea = All;
    Caption = 'Lines';
    PageType = ListPart;
    SourceTable = "Employee Grievance Lines";


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Accused Employee Code"; Rec."Accused Employee Code")
                {
                    // Editable = blnReqFieldEditable;
                }
                field("Accused Employee Name "; Rec."Accused Employee Name")
                {
                    // Editable = blnReqFieldEditable;
                }
                field("Grievance Description 1"; Rec."Grievance Description 1")
                {
                    // Editable = blnReqFieldEditable;
                }
                field("Grievance Description 2"; Rec."Grievance Description 2")
                {
                    // Editable = blnReqFieldEditable;
                }
                // field(Status; Rec.Status)
                // {

                // }
                field("HR Initial Comment";
                Rec."HR Initial Comment")
                {
                    Editable = blnReqHRFieldEditable;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        CurrPage.Update();
                    end;
                }
                field("HR Final Comment";
                Rec."HR Final Comment")
                {
                    Editable = blnReqHRFieldEditable;
                }
                field(Investigation;
                Rec.Investigation)
                {
                    Editable = blnReqHRFieldEditable;
                }
                field("Investigation Completed On";
                Rec."Investigation Completed On")
                {
                    Editable = blnReqHRFieldEditable;
                }
                field("Investigated By";
                Rec."Investigated By")
                {
                    Editable = blnReqHRFieldEditable;
                }
                field("Remarks ";
                Rec."Remarks")
                {
                    Editable = blnReqHRFieldEditable;
                }
            }
        }
    }

    // trigger OnAfterGetRecord()
    // var
    //     recEmpGr: Record "Employee Grievance Header";
    //     recEmp:
    //                             Record Employee;
    // begin
    //     recEmpGr.Reset();
    //     recEmpGr.SetRange("Grievance ID", rec."Grievance ID");
    //     if recEmpGr.FindFirst() then begin
    //         // Rec.Status := recEmpGr.Status;
    //         rec."Investigated By" := recEmpGr."Closed By";
    //     end;

    //     if rec.Status = rec.Status::Submitted then
    //         recEmp.SetRange("HR Manager Code", UserSecurityId());
    //     if recEmp.FindFirst() then
    //         blnReqHRFieldEditable := true;

    // end;

    var
        blnReqHRFieldEditable: Boolean;

        blnReqFieldEditable: Boolean;

}
