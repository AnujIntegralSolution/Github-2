// table 75710 "Client Header"
// {
//     Caption = 'Client Header';
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "No."; RecordId)
//         {
//             Caption = 'No.';
//         }

//         field(2; Name; Text[100])
//         {
//             Caption = 'Name';
//             Editable = false;
//         }
//         field(3; "Serch Name"; text[100])
//         {
//             Caption = 'Serch Name';
//             Editable = false;
//         }

//         field(4; Address; text[100])
//         {
//             Caption = 'Address';
//             Editable = false;
//         }
//         field(5; "Address 2"; text[100])
//         {
//             Caption = 'Address 2';
//             Editable = false;
//         }
//         field(6; "Customer Posting Group"; Text[150])
//         {
//             Caption = 'Customer Posting Group';
//             Editable = false;
//         }

//         field(7; "Last Date Modified"; Date)
//         {
//             Caption = 'Last Date Modified';
//             Editable = false;
//         }
//         field(8; "Item No."; code[20])
//         {
//             Caption = 'Item No.';
//             TableRelation = Item;

//             trigger OnValidate()
//             var
//                 recItem: Record Item;
//             begin
//                 if recItem.get(rec."Item No.") then begin
//                     rec.Description := recItem.Description;
//                     rec."Unit Cost" := recItem."Unit Cost";
//                 end;

//             end;
//         }

//         field(9; "Description"; text[100])
//         {
//             Caption = 'Description';
//             Editable = false;
//         }

//         field(10; "Unit Cost"; Decimal)
//         {
//             Caption = 'Unit Cost';
//             Editable = false;

//         }

//     }
//     keys
//     {
//         key(PK; "No.")
//         {
//             Clustered = true;
//         }
//     }



// }
