pageextension 80140 "Customer Card" extends "Customer Card"
{
    actions
    {
        addafter("Sales Journal")
        {
            action("Send Mail")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = SendTo;
                trigger OnAction()
                var
                    codejob: Codeunit "Job Cu Every Monday";
                begin
                    codejob.SendMailWithReports(rec."E-Mail", Rec."No.");
                end;
            }
        }
    }
}
