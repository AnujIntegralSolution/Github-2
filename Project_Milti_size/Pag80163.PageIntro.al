page 80163 PageIntro
{
    ApplicationArea = All;
    Caption = 'PageIntro';
    PageType = Card;
    SourceTable = Employeee;
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(Empcode; Rec.Empcode)
                {
                    ApplicationArea = All;
                }
                field(EmpName; Rec.EmpName)
                {
                    ApplicationArea = All;
                }
                field(EmpDepartment; Rec.EmpDepartment)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
