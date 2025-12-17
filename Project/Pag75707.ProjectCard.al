page 80147 "Project Card"
{
    ApplicationArea = All;
    Caption = 'Project Card';
    PageType = Card;
    SourceTable = Project;


    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }

                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Customer E-Mail"; Rec."Customer E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Location Name"; GetLocation(Rec."Document No."))
                {
                    ApplicationArea = All;
                }

                field("Ship To Code"; getShipToCode(rec."Sell-to Customer No."))
                {
                    ApplicationArea = All;
                }

                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Employee ID"; Rec."Employee ID")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field(Amount; getAmount(rec."Document No."))
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                // field(Status; Rec.Status)
                // {
                //     ApplicationArea = All;
                // }
                field(Post; Rec.Post)
                {
                    ApplicationArea = All;
                }
                field("Company Name"; companyDetails[1])
                {
                    ApplicationArea = All;
                }
                field("Company Address"; companyDetails[2])
                {
                    ApplicationArea = All;
                }
                field("Company Address2"; companyDetails[3])
                {
                    ApplicationArea = All;
                }
                field("Company City"; companyDetails[4])
                {
                    ApplicationArea = All;
                }
                field("Company PostCode"; companyDetails[5])
                {
                    ApplicationArea = All;
                }
                field("Company StateCode"; companyDetails[6])
                {
                    ApplicationArea = All;
                }
                field("Company Country"; companyDetails[7])
                {
                    ApplicationArea = All;
                }
                field("Company ContactName"; companyDetails[8])
                {
                    ApplicationArea = All;
                }
                field("Company Email"; companyDetails[9])
                {
                    ApplicationArea = All;
                }
                field("Company PhoneNo"; companyDetails[10])
                {
                    ApplicationArea = All;
                }
            }

            part(line; "Project Subform")
            {
                SubPageLink = "Document No" = field("Document No.");
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
                    recProject: Record Project;
                begin
                    recProject.SetRange("Document No.", rec."Document No.");
                    if recProject.FindSet() then
                        Report.RunModal(Report::"Project Report", true, false, recProject);
                end;
            }

            action("Get Location")
            {
                trigger OnAction()
                var
                    recLoc: Record Location;
                    recSH: Record "Sales Header";
                begin
                    if recSH.get(recSH."Document Type"::Order, rec."Document No.") then begin
                        if recLoc.get(recSH."Location Code") then
                            rec."Location Name" := recLoc.Name;
                    end
                end;
            }


            action("Get Customer")
            {
                ApplicationArea = All;
                Image = GetSourceDoc;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    recCust: Record Customer;
                begin
                    if recCust.get(Rec."Sell-to Customer No.") then begin
                        rec."Customer E-Mail" := recCust."E-Mail";
                        Message('Customer E-Mail %1', recCust."E-Mail");
                        rec.Modify();
                    end;

                    // recCust.SetRange("No.", rec."Customer No.");
                    // if recCust.FindFirst() then
                    //     Message('Customer E-Mail %1', recCust."E-Mail");
                end;
            }

            action("Uppdate Email")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    recCust: Record Customer;
                begin
                    if Dialog.Confirm('Sure to Change Customer E-Mail', false) then
                        if recCust.get(rec."Sell-to Customer No.") then begin
                            recCust."E-Mail" := rec."Customer E-Mail";
                            recCust.Modify();
                        end;
                end;
            }

            action(posted)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    if rec.Quantity < 1000 then
                        Error('Quantity is less then 1000') else
                        Message('Quantity is Posted');
                    rec.Post := true;
                    Rec.Modify();
                end;
            }


            // action(Release)
            // {
            //     ApplicationArea = all;
            //     trigger OnAction()
            //     var
            //         recProj: Record Project;
            //     begin
            //         recProj.TestField(recProj."Sell-to Customer No.", 'CUS0001');
            //         recProj.TestField(recProj."Quantity", 1000);
            //         if Dialog.Confirm('Release', true) then begin
            //             recProj.Status := recProj.Status::Release;
            //             recProj.Modify();
            //         end;
            //     end;
            // }




            action("Get Ship to code")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    recCust: Record Customer;
                begin
                    if recCust.get(rec."Sell-to Customer No.") then
                        rec."Ship To Code" := recCust."Ship-to Code";
                end;
            }
        }
    }

    local procedure getAmount(pcode: Code[20]): Decimal
    var
        recSH: Record "Sales Header";
    begin
        if recSH.get(recSH."Document Type"::Order, rec."Document No.") then begin
            exit(recSH.Amount);
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        GetCompanyInfo();
    end;


    // local procedure GetName(pCode: Code[20]): text
    // var
    //     recSH: Record "Sales Header";
    //     recsalpurc: Record "Salesperson/Purchaser";
    // begin
    //     if recSH.get(recSH."Document Type"::Order, pCode) then begin
    //         if recsalpurc.Get(recSH."Salesperson Code") then
    //             exit(recsalpurc.Name);
    //     end;
    // end;




    local procedure GetLocation(pCode: Code[20]): text
    var
        recLoc: Record Location;
        recSH: Record "Sales Header";
    begin
        if recSH.get(recSH."Document Type"::Order, rec."Document No.") then begin
            if recLoc.get(recSH."Location Code") then
                exit(recLoc.Name);
        end;
    end;



    local procedure getShipToCode(pCode: code[20]): Code[10]
    var
        recCust: Record Customer;
    begin
        if recCust.get(rec."Sell-to Customer No.") then
            exit(recCust."Ship-to Code");
    end;



    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        Message('Date : %1', Today);
    end;

    // trigger OnClosePage()
    // var
    //     myInt: Integer;
    // begin
    //     Rec.Reset();
    //     if rec.Quantity < 1000 then
    //         Error('Quantity is Less then 1000') else
    //         Message('Quantity is Release');
    //     Rec.Status := rec.Status::Release;
    //     rec.Modify();

    // end;

    local procedure GetCompanyInfo()
    begin
        if recCompany.get() then
            recCompany.CalcFields(Picture);
        companyDetails[1] := recCompany.Name;
        companyDetails[2] := recCompany.Address;
        companyDetails[3] := recCompany."Address 2";
        companyDetails[4] := recCompany.City;
        // companyDetails[5] := recCompany."State Code";
        companyDetails[6] := recCompany."Post Code";
        companyDetails[7] := recCompany."Country/Region Code";
        companyDetails[8] := recCompany."Contact Person";
        companyDetails[9] := recCompany."E-Mail";
        companyDetails[10] := recCompany."Phone No.";
    end;


    var
        recCompany: Record "Company Information";
        companyDetails: array[10] of text;
}


