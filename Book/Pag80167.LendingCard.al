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
                }
                field("Book ID"; Rec."Book ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    TableRelation = book."Book ID";
                }
                field("Member ID"; Rec."Member ID")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Leanding Date"; Rec."Leanding Date")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        if Rec."Leanding Date" <> today then
                            Error('Invalid Leanding Date');
                        Rec."Due Date" := rec."Leanding Date" + 30;
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

                    trigger OnValidate()
                    begin
                        if Rec."Return Date" <> 0D then
                            if Rec."Return Date" > rec."Due Date" then
                                rec."Fine Amount" := 30
                            else
                                rec."Fine Amount" := 0;
                    end;
                }
                field("Fine Amount"; Rec."Fine Amount")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }


            }
        }
    }
}
