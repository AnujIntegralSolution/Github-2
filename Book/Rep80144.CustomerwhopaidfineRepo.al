report 80144 CustomerwhopaidfineRepo
{
    Caption = 'CustomerwhopaidfineRepo';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = layoutName;



    dataset
    {
        dataitem(Lending; Lending)
        {
            column(Customer_Name; "Customer Name")
            { }
            column(Fine_Amount; "Fine Amount")
            { }
            column(Book_ID; "Book ID")
            { }
            column(Leanding_Date; "Leanding Date")
            { }
            column(Return_Date; "Return Date")
            { }
            column(Status; Status)
            { }
            column(Due_Date; "Due Date")
            { }
        }
    }
    requestpage
    {
        AboutTitle = 'Teaching tip Title';
        AboutText = 'Specify the date range for the report.';
        layout
        {
            area(Content)
            {
                group(FilterGroup)
                {
                    field(StartDate; StartDate)
                    {

                    }
                    field(EndDate; EndDate)
                    {

                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
                action(GenerateReport)
                {
                    ApplicationArea = All;
                    Caption = 'Generate Report';
                    trigger OnAction()
                    begin

                    end;
                }
            }
        }
    }




    rendering
    {
        layout(layoutName)
        {
            Type = Word;
            LayoutFile = 'myCustomerpaidReport.docx';
        }

    }

    var
        StartDate: Date;
        EndDate: Date;
        LenderRec: Record Lending;
}
