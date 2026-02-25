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
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = ReqFieldEditable;
                }
                field("Book ID"; Rec."Book ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    TableRelation = Book."Book ID";
                    Editable = ReqFieldEditable;

                    trigger OnValidate()
                    var
                        RecBK: Record Book;
                    begin
                        if RecBK.get(rec."Book ID") then
                            rec."Rent Price" := RecBK."Rent Price";
                    end;
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
                        Rec."Return Date" := rec."Leanding Date" + 10;
                        rec."Due Date" := rec."Return Date" + 5;
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
                field("Rent Price"; Rec."Rent Price")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("OverDue Date"; Rec."OverDue Date")
                {
                    ApplicationArea = All;
                    Editable = OverdueEditable;

                    trigger OnValidate()
                    var
                        Total: Decimal;
                        Counts: Decimal;
                    begin
                        if Rec."OverDue Date" <> 0D then
                            if Rec."Due Date" < rec."OverDue Date" then begin
                                Total := rec."OverDue Date" - rec."Due Date";
                                rec."Bill Amount" := Total * rec."Rent Price";

                            end;
                        if Rec."Due Date" < rec."OverDue Date" then
                            rec.Status := rec.Status::Overdue;
                    end;
                }
                field("Bill Amount"; Rec."Bill Amount")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Editable = false;
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
                    var
                        recLD: Record Lending;
                    begin
                        rec.Init();
                        rec."Leanding ID" := 'LD0001';
                        rec."Member ID" := 'MB0001';
                        rec."Customer Name" := 'Test';
                        rec.Insert();
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
        Pattern: Text;
        Input: Text;
        Regex: Codeunit Regex;

}















