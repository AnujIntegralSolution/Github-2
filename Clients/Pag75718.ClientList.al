// page 75718 "Client List"
// {
//     ApplicationArea = All;
//     Caption = 'Client List';
//     PageType = List;
//     SourceTable = "Client Header";
//     UsageCategory = Lists;
//     CardPageId = "Client Card";
//     Editable = false;

//     layout
//     {
//         area(Content)
//         {
//             repeater(General)
//             {
//                 field(Name; Rec.Name)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Serch Name"; Rec."Serch Name")
//                 {
//                     ApplicationArea = All;
//                 }

//                 field(Address; Rec.Address)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Address 2"; Rec."Address 2")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Customer Posting Group"; Rec."Customer Posting Group")
//                 {
//                     ApplicationArea = All;
//                 }

//                 field("Last Date Modified"; Rec."Last Date Modified")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Item No."; Rec."Item No.")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Unit Cost"; Rec."Unit Cost")
//                 {
//                     ApplicationArea = All;
//                 }
//             }
//         }
//     }
//     actions
//     {
//         area(Processing)
//         {
//             action(GetCust)
//             {
//                 trigger OnAction()
//                 var
//                     recCust: Record Customer;
//                     recID: RecordId;
//                 begin
//                     recCust.FindFirst();
//                     RecID := recCust.RecordId;
//                     if recCust.get(recID) then begin
//                         rec.Init();
//                         rec."No." := recID;
//                         rec."Name" := recCust.Name;
//                         rec."Serch Name" := recCust."Search Name";
//                         rec.Address := recCust.Address;
//                         rec."Address 2" := recCust."Address 2";
//                         rec."Customer Posting Group" := recCust."Customer Posting Group";
//                         rec."Last Date Modified" := recCust."Last Date Modified";
//                         rec.Insert(true);
//                     end;
//                 end;
//             }
//         }
//     }
// }