table 80146 "GS CSV Import Buffer"
{
    Caption = 'GS CSV Import Buffer';
    fields
    {

        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            OptimizeForTextSearch = true;
        }
        field(2; Name; Text[120])
        {
            Caption = 'Name';

        }
        field(3; "Search Name"; Code[120])
        {
            Caption = 'Search Name';
        }
        field(4; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }

        field(5; Address; Text[120])
        {
            Caption = 'Address';
            OptimizeForTextSearch = true;
        }
        field(6; "Address 2"; Text[120])
        {
            Caption = 'Address 2';
            OptimizeForTextSearch = true;
        }
        field(7; "Country/Region Code"; Code[50])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }

        field(8; City; Text[50])
        {
            Caption = 'City';
        }
        field(9; "State Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = "Post Code";
        }

        field(11; "Ship-to Code"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Customer Posting Group"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Gen. Bus. Posting Group"; code[20])
        {
            DataClassification = ToBeClassified;
        }


    }
    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

}