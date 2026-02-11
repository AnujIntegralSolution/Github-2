page 80167 "Lending Card"
{
    ApplicationArea = All;
    Caption = 'Lending Card';
    PageType = Card;
    SourceTable = Lending;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Leanding ID"; Rec."Leanding ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = ReqFieldEditable;
                }
                field("Book ID"; Rec."Book ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    TableRelation = book."Book ID";
                    Editable = ReqFieldEditable;
                }
                field("Member ID"; Rec."Member ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = ReqFieldEditable;
                }
                field("Leanding Date"; Rec."Leanding Date")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = ReqFieldEditable;

                    trigger OnValidate()
                    begin
                        if Rec."Leanding Date" <> today then
                            Error('Invalid Leanding Date');
                        Rec."Return Date" := rec."Leanding Date" + 30;
                        rec."Due Date" := rec."Leanding Date" + 30 + 7;
                    end;


                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
                }
                field("Fine Amount"; Rec."Fine Amount")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = ReqFieldEditable;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        if rec.Status = rec.Status::Issued then begin
                            ReqFieldEditable := false;
                            OverdueEditable := true
                        end else begin
                            ReqFieldEditable := true;
                            OverdueEditable := true;
                        end;

                        if rec.Status = rec.Status::Returned then
                            rec.Delete();
                    end;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = ReqFieldEditable;
                }

                field("OverDue Date"; Rec."OverDue Date")
                {
                    ApplicationArea = All;
                    Editable = OverdueEditable;

                    trigger OnValidate()
                    begin
                        if Rec."OverDue Date" <> 0D then
                            if Rec."Due Date" < rec."OverDue Date" then
                                rec."Fine Amount" += 100;

                        if Rec."Due Date" < rec."OverDue Date" then
                            rec.Status := rec.Status::Overdue;
                    end;
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Get")
            {
                action(Insert)
                {
                    ApplicationArea = All;
                    Promoted = true;
                    Image = Insert;


                    trigger OnAction()
                    begin
                        rec."Member ID" := 'MI001';
                        rec."Customer Name" := 'Shubh';


                    end;
                }
            }
        }
    }

    trigger OnOpenPage()

    begin
        if Rec.Status = rec.Status::New then begin
            ReqFieldEditable := true;
            OverdueEditable := false;
        end;
    end;

    var

        ReqFieldEditable: Boolean;
        OverdueEditable: Boolean;

}















