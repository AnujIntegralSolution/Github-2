page 80155 Employee
{
    ApplicationArea = All;
    Caption = 'Employee';
    PageType = Card;
    SourceTable = "GS Excel Import Buffer";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Emp No."; Rec."Emp No.")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Pattern := '[A-Z]{3}[0-9]{4}';
                        if regex.IsMatch(Rec."Emp No.", Pattern, 0) then
                            Message('Match')
                        else
                            Error('Please enter the valid input');
                    end;
                }
                field("Emp E-mail"; Rec."Emp E-mail")
                {
                    trigger OnValidate()
                    begin
                        Pattern := ' [a-zA-Z0-9+_.-]+ @[a-zA-Z0-9+.-]+$';
                        if Regex.IsMatch(Input, Pattern, 0) then
                            Message('Match')
                        else
                            Error('Please enter a valid input');
                    end;
                }
            }
        }
    }


    var

        Pattern: Text;
        Input: Text;
        Regex: Codeunit Regex;
}
