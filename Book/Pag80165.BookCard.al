page 80165 "Book Card"
{
    ApplicationArea = All;
    Caption = 'Book Card';
    PageType = Card;
    SourceTable = Book;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Book ID"; Rec."Book ID")
                {
                    ApplicationArea = All;
                }
                field("ISBN Number"; Rec."ISBN Number")
                {
                    ApplicationArea = All;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                }
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;
                }
                field("Book Price"; Rec."Book Price")
                {
                    ApplicationArea = All;
                }
                field("Publication Date"; Rec."Publication Date")
                {
                    ApplicationArea = All;
                }
                field(Language; Rec.Language)
                {
                    ApplicationArea = All;
                }
                field("Book Category`"; Rec."Book Category`")
                {
                    ApplicationArea = All;
                }
                field("Publish Date"; Rec."Publish Date")
                {
                    ApplicationArea = All;
                }
                field("Rent Price"; Rec."Rent Price")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Get")
            {
                action(strmenu)
                {
                    ApplicationArea = All;
                    Caption = 'String';
                    Image = SubcontractingWorksheet;

                    trigger OnAction()
                    var
                        Options: Text[30];
                        Selected: Integer;
                        Text000: Label 'Save,Delete,Exit,Find';
                        Text001: Label 'You selected option %1.';
                        Text002: Label 'Choose one of the following options:';
                    begin
                        Options := Text000;
                        Selected := Dialog.StrMenu(Options, 3, Text002);
                        Message(Text001, Selected);
                    end;


                    // trigger OnAction()
                    // begin
                    //     Days := 'Monday,Tuesday,Wednesday,Thursday,Friday';
                    //     Selection := StrMenu(Days, 1, 'Which day is today ?');
                    //     Message('You selected %1.', Selection);
                    // end;
                }

                action("Open String")
                {
                    ApplicationArea = All;
                    Caption = 'Open String';
                    Image = SubcontractingWorksheet;
                    trigger OnAction()
                    var
                        MyDialog: Dialog;
                        MyNext: Integer;
                        Text000: Label 'Counting to 4 #1:';
                    begin
                        MyNext := 0;
                        MyDialog.Open(Text000, MyNext);
                        repeat
                            Sleep(1000);
                            MyNext := MyNext + 1;
                            MyDialog.Update();
                        until MyNext = 4;
                        Sleep(1000);
                        MyDialog.Close();
                    end;
                }

                action("Duration Date Time")
                {
                    ApplicationArea = All;
                    Caption = 'Duration Date Time';
                    Image = SubcontractingWorksheet;


                    trigger OnAction()
                    var
                        DateTime1: DateTime;
                        DateTime2: DateTime;
                        Duration: Duration;
                    begin
                        DateTime1 := CreateDateTime(20090101D, 080000T);
                        DateTime2 := CreateDateTime(20090505D, 133001T);
                        Duration := DateTime2 - DateTime1;
                        Message(Format(Duration));
                    end;
                }

            }
        }
    }
}
