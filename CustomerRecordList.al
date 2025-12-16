page 80140 "Customer Record List"
{
    ApplicationArea = All;
    Caption = 'Customer Record List';
    SourceTable = "Customer Record";
    PageType = List;
    UsageCategory = Tasks;
    AutoSplitKey = true;
    DelayedInsert = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    SaveValues = true;
    SourceTableView = sorting("No.");
    // CardPageId = "Customer Record Card";
    // CardPageId = "Email Accounts";
    // CardPageId = "Sent Emails";


    layout
    {

        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }

                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                }


                field("State Code"; Rec."State Code")
                {
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                }

                field(salary; rec.salary)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if rec.salary < 10000 then
                            Error('OOPS! you entered wrong salary')
                        else
                            Message('Good to go');
                    end;

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
                Caption = '&Get';
                Image = Action;

                action("Import to BC")
                {
                    Caption = 'Import to BC';
                    ApplicationArea = Basic, Suite;
                    Image = Statistics;
                    ShortCutKey = 'F7';

                    trigger OnAction()
                    begin
                        ReadExcelSheet();
                        ImportExcelData();
                    end;
                }
                action("Get Customer")
                {
                    ApplicationArea = Suite;
                    Image = GetSourceDoc;

                    trigger OnAction()
                    var
                        recCust: Record Customer;
                    begin
                        if recCust.get(Rec."No.") then begin
                            rec.Name := recCust.Name;
                            rec.Address := recCust.Address;
                            rec.City := recCust.City;
                            rec."Last Date Modified" := recCust."Last Date Modified";
                            rec."Post Code" := recCust."Post Code";
                            rec.Modify();
                            Message('%1 Customer Record Geted', recCust."No.");
                        end;
                    end;
                }
                action(GetDetails)
                {
                    ApplicationArea = Basic, Suite;
                    Image = ViewDetails;
                    trigger OnAction()
                    var
                        recCustEx: Record "Customer Record";
                    begin
                        recCustEx.Reset();
                        recCustEx.SetRange(recCustEx."No.");
                        Message('Customer Record No. %1', rec."No.");
                        Message('Customer Record Name %1', rec.Name);
                        Message('Customer Record Search Name %1', rec."Search Name");
                        Message('Customer Record Address %1', rec.Address);
                        Message('Customer Record Address 2 %1', rec."Address 2");
                        Message('Customer Record Customer City %1', rec.City);
                        Message('Customer Record State Code %1', rec."State Code");
                        Message('Customer Record Last Date Modified %1', rec."Last Date Modified");
                        Message('Customer Record Post %1', rec."Post Code");
                    end;
                }

                action(message)
                {
                    ApplicationArea = Suite;
                    Caption = 'message';
                    Image = ExportMessage;
                    trigger OnAction()
                    var
                        recCustExl: Record "Customer Record";
                    begin
                        recCustExl.Reset();
                        recCustExl.SetRange("No.", 'CUS0010');
                        if recCustExl.FindSet() then
                            repeat
                                Message('Customer Record %1', recCustExl."No.");
                            until recCustExl.Next() = 0;
                    end;
                }
            }
            group(Ranges)
            {
                Caption = 'Ranges';
                Image = Ranges;

                action("SetRange")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'SetRange';
                    Image = Ranges;
                    trigger OnAction()
                    var
                        recCustExl: Record "Customer Record";
                    begin
                        recCustExl.Reset();
                        Rec.SetRange("Last Date Modified", 20250701D, 20250731D);
                    end;
                }
                action(SetFilter)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'SetFilter';
                    Image = Filter;

                    trigger OnAction()
                    var
                        recCustExl: Record "Customer Record";
                    begin
                        rec.Reset();
                        rec.SetFilter("No.", '%1..%2', 'CUS0023', 'CUS0043');
                    end;
                }
                action("Find funtion")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Find;
                    trigger OnAction()
                    begin
                        Customer."No." := rec."No.";
                        if Customer.Find('=') then
                            Message(Text003, Customer."No.", Customer.Name, Customer.Address)
                        else
                            Message(Text002);
                    end;
                }
                action("Find First")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Find;
                    trigger OnAction()
                    begin
                        Customer."No." := rec."No.";
                        if Customer.FindFirst() then
                            Message(Text003, Customer."No.", Customer.Name, Customer.Address)
                        else
                            Message(Text002);
                    end;
                }

                action("Find Last")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Find;
                    trigger OnAction()
                    begin
                        Customer."No." := rec."No.";
                        if Customer.FindLast() then
                            Message(Text003, Customer."No.", Customer.Name, Customer.Address)
                        else
                            Message(Text002);
                    end;
                }

                action("Next Function")
                {
                    ApplicationArea = Basic, Suite;
                    Image = NextRecord;

                    trigger OnAction()
                    begin
                        count := 0;
                        Customer."No." := 'CUS0001';
                        if Customer.Find('-') then begin
                            repeat
                                count := count + 1
                            until Customer.Next = 0;
                            Message(Text001, Customer.Count);
                        end
                        else
                            Message(Text002);
                    end;
                }

                action(Insert)
                {
                    ApplicationArea = Basic, Suite;
                    Image = Insert;

                    trigger OnAction()
                    var
                        recCEB: Record "Customer Record";
                    begin
                        recCEB.Init();
                        recCEB."No." := 'CUS0001';
                        recCEB.Name := '3S SOLUTIONS';
                        recCEB.Insert(true);
                    end;
                }
                action("Modify")
                {
                    ApplicationArea = Basic, Suite;
                    Image = UpdateDescription;
                    trigger OnAction()
                    var
                        recCEB: Record "Customer Record";
                    begin
                        recCEB.Get(rec."No.");
                        recCEB.Name := 'SOLUTIONS';
                        recCEB."Name 2" := 'SOLUTIONS';
                        recCEB.Address := 'Plot No.77,Subodaya Colony,Jashua Soc.';
                        recCEB.City := 'Hyderabad';
                        recCEB."Post Code" := '500072';
                        recCEB.Modify();
                    end;
                }
                action(Modifyall)
                {
                    ApplicationArea = Basic, Suite;
                    Image = UpdateDescription;

                    trigger OnAction()
                    var
                        recCEB: Record "Customer Record";
                    begin
                        recCEB.Reset();
                        recCEB.SetRange("Salesperson Code", 'JO');
                        recCEB.ModifyAll("Salesperson Code", 'JR');
                        recCEB.Modify();
                    end;
                }
                action(Rename)
                {
                    trigger OnAction()
                    var
                        CustRec: Record "Customer Record";
                    begin
                        CustRec.Get(rec."No.");
                        CustRec.Rename('CUS2954');
                    end;
                }

                action(Delete)
                {
                    ApplicationArea = Basic, Suite;
                    Image = Delete;
                    trigger OnAction()
                    var
                        recCEB: Record "Customer Record";
                    begin
                        recCEB.Get(rec."No.");
                        recCEB.Delete(true);
                    end;
                }
                action(DeleteAll)
                {
                    ApplicationArea = Basic, Suite;
                    Image = Delete;
                    trigger OnAction()
                    var
                        recCEB: Record "Customer Record";
                    begin
                        recCEB.Reset();
                        recCEB.SetRange(Priority, 0);
                        recCEB.DeleteAll();
                    end;
                }
                action("Confirm method")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Dailog';
                    Image = Confirm;

                    trigger OnAction()
                    var
                        cust: Record customer;
                    begin
                        if Dialog.Confirm('you wont to change it') then begin
                            rec.Name := cust.Name;
                            rec."Name 2" := cust."Name 2";
                            rec.Address := cust.Address;
                            rec."Address 2" := cust."Address 2";
                            rec."Post Code" := cust."Post Code";
                        end;
                    end;
                }

                action(strmenu)
                {
                    ApplicationArea = All;
                    Caption = 'String Menu';
                    Image = SubcontractingWorksheet;

                    trigger OnAction()
                    begin
                        Days := 'Monday,Tuesday,Wednesday,Thursday,Friday';
                        Selection := StrMenu(Days, 1, 'Which day is today ?');
                        Message('You selected %1.', Selection);
                    end;
                }

            }
            group(Filtering)
            {
                Caption = 'FIltering';
                Image = FilterLines;
                action("Equal to")
                {
                    ApplicationArea = all;
                    Image = EditFilter;
                    trigger OnAction()
                    begin
                        rec.Reset();
                        Rec.SetFilter(City, '=%1', 'Surat');
                    end;
                }
                action("Not equal to")
                {
                    ApplicationArea = all;
                    Image = Account;
                    trigger OnAction()
                    begin
                        rec.Reset();
                        Rec.SetFilter("Post Code", '<>%1', '122102');
                    end;
                }
                action("Greater than")
                {
                    ApplicationArea = all;
                    Image = AddAction;
                    trigger OnAction()
                    begin
                        rec.Reset();
                        Rec.SetFilter("No.", '>%1', 'CUS0166');
                    end;
                }
                action("Greater than or equal to")
                {
                    ApplicationArea = all;
                    Image = Allocate;
                    trigger OnAction()
                    begin
                        rec.Reset();
                        Rec.SetFilter("No.", '>=%1', 'CUS0134');
                    end;
                }
                action("Less than")
                {
                    ApplicationArea = all;
                    Image = BarChart;
                    trigger OnAction()
                    begin
                        rec.Reset();
                        Rec.SetFilter("No.", '<%1', 'CUS0022');
                    end;
                }
                action("Less than or equal to")
                {
                    ApplicationArea = all;
                    Image = ChangeTo;
                    trigger OnAction()
                    begin
                        rec.Reset();
                        Rec.SetFilter("No.", '<=%1', 'CUS0010');
                    end;
                }
            }
            group("Record ID")
            {
                Caption = 'Record ID';
                Image = NextRecord;

                action(GetRecord)
                {
                    ApplicationArea = all;
                    Image = GetSourceDoc;
                    trigger OnAction()
                    var
                        RecRef: RecordRef;
                        RecID: RecordID;
                    begin
                        RecRef.Open(18);
                        RecRef.FindFirst();
                        RecID := RecRef.RecordId;
                        RecRef := RecID.GetRecord;
                        Message('%1', RecID);
                    end;
                }

                action(GetTableRecord)
                {
                    ApplicationArea = all;
                    Image = Table;
                    trigger OnAction()
                    var
                        RecRef: RecordRef;
                        RecID: RecordID;
                        varTableNumber: Integer;
                    begin
                        RecRef.Open(Database::Customer);
                        if RecRef.Find('-') then begin
                            RecID := RecRef.RecordId;
                            varTableNumber := RecID.TableNo;
                            Message('The Customer table is number: %1', varTableNumber);
                        end else begin
                            Message('No records found in the table');
                        end;
                    end;
                }
            }
            group("System Functions")
            {
                Caption = 'System Functions';
                Image = Info;

                action("Record Ref")
                {
                    ApplicationArea = All;
                    Image = ReferenceData;
                    trigger OnAction()
                    Var
                        recref: RecordRef;
                    begin
                        recref.Open(Database::"Customer Record");
                        recref.FindFirst();
                        Message(Format(recref.Field(1).Caption));
                    end;
                }

                action("GUIDD")
                {
                    ApplicationArea = All;
                    Image = Group;
                    trigger OnAction()
                    begin
                        gid := CreateGuid();
                        Message(gid);
                    end;
                }






                action(userid)
                {
                    ApplicationArea = All;
                    Image = User;
                    trigger OnAction()
                    begin
                        Message(Msg, UserId);
                    end;
                }
                action(usersecurityid)
                {
                    ApplicationArea = All;
                    Image = UserSetup;
                    trigger OnAction()
                    begin
                        Message(Msg1, UserSecurityId());
                    end;
                }

                action(Today)
                {
                    ApplicationArea = All;
                    Image = DueDate;
                    trigger OnAction()
                    begin
                        Message(todayda, Today);
                    end;
                }
                action(workdate)
                {
                    ApplicationArea = All;
                    Image = DataEntry;

                    trigger OnAction()
                    begin
                        Message(wdate, WorkDate());
                    end;
                }
                action("time")
                {
                    ApplicationArea = All;
                    Image = Timesheet;
                    trigger OnAction()
                    begin
                        Message(timee, Time);
                    end;
                }



            }
            group("String functions")
            {
                Image = SortAscending;
                action(LowerCase)
                {
                    ApplicationArea = All;
                    Image = MoveDown;
                    ToolTip = 'Conver to Lower Case';
                    trigger OnAction()
                    begin
                        Rec.Name := LowerCase(Rec.Name);
                        Rec.City := UpperCase(Rec.City);
                        rec.Modify(true);

                    end;

                }
                action(UpperCase)
                {
                    ApplicationArea = All;
                    Image = MoveUp;
                    ToolTip = 'Conver to Lower Case';
                    trigger OnAction()
                    begin
                        Rec.Name := UpperCase(Rec.Name);
                        Rec.City := LowerCase(Rec.City);
                        rec.Modify(true);
                    end;
                }

            }
            group("Type")
            {
                action(Duration)
                {
                    Image = DateRange;
                    ApplicationArea = all;
                    trigger OnAction()
                    var
                        DateTime1: DateTime;
                        DateTime2: DateTime;
                        Duration: Duration;
                    begin
                        DateTime1 := CreateDateTime(rec."Last Date Modified", 080000T); // January 1, 2009 at 08:00:00 AM  
                        DateTime2 := CreateDateTime(Today, 133001T); // May 5, 2009 at 1:30:01 PM  
                        Duration := DateTime2 - DateTime1;
                        Message(Format(Duration));
                    end;
                }
            }
            group(Currentkey)
            {
                Image = EncryptionKeys;

                action(SetCurrentKey)
                {
                    ApplicationArea = All;
                    Image = StepInto;
                    trigger OnAction()
                    var
                        Cust: Record customer;
                        text001: Label 'Key selected sucessfully';
                        text002: Label 'Key not found';
                    begin
                        if Cust.SetCurrentKey("Salesperson Code") then
                            Message(text001, Cust."Salesperson Code") else
                            Message(text002);
                    end;
                }

                action(SetPosition)
                {
                    ApplicationArea = All;
                    Image = StepOut;
                    trigger OnAction()
                    begin
                        inputstring := 'No.=const(20001)';
                        MyFieldRef := RecRef.Field(1);
                        MyFieldref.SetFilter('10000..20000');
                        RecRef.FindLast();
                        Message(text005, RecRef.RecordId, RecRef.Field(2));
                        RecRef.SetPosition(Inputstring);
                        Message(text006, RecRef.RecordId, RecRef.Field(2));
                        Inputstring := RecRef.GetPosition(true);
                        Message(text004, Inputstring);
                    end;
                }

            }
        }













        area(Processing)
        {
            group("Page Link")
            {
                Caption = 'Run Page Link';
                Image = Link;

                action(Vendors)
                {
                    Image = Vendor;
                    RunObject = page "Vendor List";
                }

                action("Customer Balance")
                {
                    Image = Customer;
                    RunObject = page "Customer List";
                    RunPageMode = Edit;
                    RunPageLink = "Balance (LCY)" = filter(<= 10000);
                }

            }
        }
    }
    local procedure ReadExcelSheet()
    var
        FileManagent: Codeunit "File Management";
        Istream: InStream;
        FromFile: Text[100];
    begin
        UploadIntoStream(UploadMsg, '', '', FromFile, Istream);
        if FromFile <> '' then begin
            FileName := FileManagent.GetFileName(FromFile);
            SheetName := TempExcelBuffer.SelectSheetsNameStream(Istream);
        end else
            Error(NoFileMsg);
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(Istream, SheetName);
        TempExcelBuffer.ReadSheet();
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin
        TempExcelBuffer.Reset();
        if TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;

    local procedure ImportExcelData()
    var
        GSImportBuffer: Record "Customer Record";
        RowNo: Integer;
        ColNo: Integer;
        LineNO: Integer;
        MaxRow: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        MaxRow := 0;
        LineNO := 0;
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then begin
            MaxRow := TempExcelBuffer."Row No.";
        end;
        for RowNo := 2 to MaxRow do begin
            LineNO := LineNO + 10000;
            GSImportBuffer.Init();
            Evaluate(GSImportBuffer."No.", GetValueAtCell(RowNo, 1));
            Evaluate(GSImportBuffer.Name, GetValueAtCell(RowNo, 2));
            Evaluate(GSImportBuffer."Search Name", GetValueAtCell(RowNo, 3));
            Evaluate(GSImportBuffer.Address, GetValueAtCell(RowNo, 4));
            Evaluate(GSImportBuffer."Address 2", GetValueAtCell(RowNo, 5));
            Evaluate(GSImportBuffer.City, GetValueAtCell(RowNo, 6));
            Evaluate(GSImportBuffer."State Code", GetValueAtCell(RowNo, 7));
            Evaluate(GSImportBuffer."Last Date Modified", GetValueAtCell(RowNo, 8));
            Evaluate(GSImportBuffer."Post Code", GetValueAtCell(RowNo, 9));
            GSImportBuffer.Insert();
        end;
        Message(ExcelImportSuccess);
    end;

    var
        TransName: Code[10];
        FileName: Text[100];
        SheetName: Text[100];
        TempExcelBuffer: Record "Excel Buffer" temporary;
        UploadMsg: Label 'Please choose the Excel file';
        NoFileMsg: Label 'No Excel file found';
        BatchIsblankmsg: Label 'Trasaction name is blank';
        ExcelImportSuccess: Label 'Excel imported successfully';
        count: Integer;
        Customer: Record Customer;
        Text001: Label 'Record Found';
        Text002: Label 'Record Not found';
        Text003: Label 'Record Found: Customer Number: %1, \Customer Name: %2 and \Customer Address: %3';
        compInfo: Record "Company Information";
        Msg: Label 'User ID is ''%1''';
        Msg1: Label ' User Security ID is ''%1''';
        wdate: Label ' Workdate is ''%1''';
        todayda: Label ' Todays date is ''%1''';
        timee: Label ' Time is ''%1''';
        gid: Guid;
        Days: Text[50];
        Selection: Integer;
        Inputstring: text;
        RecRef: RecordRef;
        varPrimarykey: text;
        MyFieldref: FieldRef;
        text004: Label 'The Primary Key Is : %1';
        text005: Label 'The record No. before the primary key change is %1 // The vendor name before the primary key was changed : %2 ';
        text006: Label 'The record No. after the primary key change is %1 // The vendor name after the primary key was changed : %2 ';

}
