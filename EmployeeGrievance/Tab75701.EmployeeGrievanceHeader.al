table 80141 "Employee Grievance Header"
{
    Caption = 'Employee Grievance Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Grievance ID"; Code[20])
        {
            Caption = 'Grievance ID';



        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee;


        }
        field(3; "Employee Name"; Text[30])
        {
            Caption = 'Employee Name';
            Editable = false;
        }

        field(4; "Date of Incident"; Date)
        {
            Caption = 'Date of Incident';
            Editable = false;
        }

        field(5; "Company"; Text[50])
        {
            Caption = 'Company';
            Editable = false;
        }
        field(6; "Date of Submission"; Date)
        {
            Caption = 'Date of Submission';
            Editable = false;
        }
        field(7; "HR Verification"; Boolean)
        {
            Caption = 'HR Verification';
            trigger OnValidate()
            begin
                if rec."HR Verification" then
                    rec."HR Verification Date" := Today
                else
                    rec."HR Verification Date" := 0D;
            end;
        }
        field(8; "HR Verification Date"; Date)
        {
            Caption = 'HR Verification Date';
            Editable = false;
        }
        // field(9; "Closed"; Boolean)
        // {
        //     Caption = 'Closed';
        //     trigger OnValidate()
        //     var
        //         recUser: Record User;
        //         recEmp: Record Employee;
        //     begin
        //         if Closed then begin
        //             recEmp.SetRange("HR Manager Code", UserSecurityId());
        //             if recEmp.FindFirst() then begin
        //                 if recUser.get(UserSecurityId()) then begin
        //                     rec."Closed By" := recUser."Full Name";
        //                     rec."Closed Date" := Today;
        //                 end;
        //             end else begin
        //                 Error('You are not valid person.');
        //             end;
        //         end else begin
        //             rec."Closed By" := '';
        //             rec."Closed Date" := 0D;
        //         end;

        //     end;
        // }
        field(10; "Closed By"; text[80])
        {
            Caption = 'Closed By';
            Editable = false;
        }
        field(11; "Closed Date"; date)
        {
            Caption = 'Closed Date';
            Editable = false;
        }
        field(12; "Submit Date"; Date)
        {
            Editable = false;
        }
        // field(13; Status; enum "Grievance Status")
        // {
        //     trigger OnValidate()
        //     var
        //         recEmpGrLine: Record "Employee Grievance Lines";
        //         recGN: Record "Employee Grievance Header";
        //         recEmp: Record Employee;
        //     begin
        //         case rec.Status of
        //             rec.Status::" ":
        //                 begin
        //                     if rec."Submit Date" <> 0D then
        //                         Error('You cannot modify on this stage.');
        //                 end;
        //             rec.Status::Submitted:
        //                 begin
        //                     recEmp.SetRange("HR Manager Code", UserSecurityId());
        //                     if recEmp.FindFirst() then
        //                         Error('HR manager cannot submit the document.')
        //                     else
        //                         if not Dialog.Confirm('Do you want to submit your request.') then begin
        //                             rec.Status := Rec.Status::" ";
        //                             exit;
        //                         end;
        //                     rec."Submit Date" := Today;
        //                 end;
        //             rec.Status::"In Progress":
        //                 begin
        //                     recEmpGrLine.Reset();
        //                     recEmpGrLine.SetRange("Grievance ID", rec."Grievance ID");
        //                     if recEmpGrLine.FindSet() then begin
        //                         repeat
        //                             recEmpGrLine.TestField("HR Initial Comment");
        //                         until recEmpGrLine.next = 0;
        //                     end else
        //                         Error('Line Not Found');
        //                 end;
        //             rec.Status::Awaiting:
        //                 begin
        //                     recEmpGrLine.TestField(Investigation);
        //                 end;
        //             rec.Status::Action:
        //                 begin
        //                     if recGN."Closed By" = recEmpGrLine."Investigated By" then
        //                         Dialog.Message('Sure to submit your action');

        //                 end;
        //             rec.Status::Closed:
        //                 begin
        //                     recEmpGrLine.Reset();
        //                     recEmpGrLine.SetRange("Grievance ID", rec."Grievance ID");
        //                     if recEmpGrLine.FindSet() then begin
        //                         repeat
        //                             recEmpGrLine.TestField("HR Final Comment");
        //                             recEmpGrLine.TestField(Investigation);
        //                         until recEmpGrLine.Next() = 0;
        //                     end else
        //                         Error('No lines found.');
        //                     rec."Closed Date" := Today;

        //                 end;
        //             rec.Status::Cancelled:
        //                 begin
        //                     Error('Not Now');
        //                 end;
        //         end;
        // //     end;
        // }
        field(14; "No. Series"; code[20])
        {
        }

        field(15; Count; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Grievance ID")
        {
            Clustered = true;
        }
    }

    // trigger OnInsert()
    // var
    //     recEMP: Record Employee;
    //     recUser: Record User;
    // begin
    //     recEMP.Reset();
    //     recUser.SetRange("User Security ID", recEMP."HR Manager Code");
    //     if recEMP.FindFirst() then begin
    //         rec.Company := recEMP.Company;
    //         Rec."Date of Submission" := Today;
    //         rec."Date of Incident" := Today;
    //     end else begin
    //         rec.Company := '';
    //         Rec."Date of Submission" := 0D;
    //         rec."Date of Incident" := 0D;
    //     end;

    //     // if "Grievance ID" = '' then begin
    //     //     recManfSet.Get();
    //     //     recManfSet.TestField("Employee Grivance Nos");
    //     //     NoSeriesMgt.InitSeries(recManfSet."Employee Grivance Nos", xRec."No. Series", 0D, rec."Grievance ID", "No. Series");
    //     // end;

    // end;

    var
        recManfSet: Record "Manufacturing Setup";
    // NoSeriesMgt: Codeunit NoSeriesManagement;
}
