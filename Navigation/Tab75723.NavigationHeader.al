table 80143 "Navigation Header"
{
    Caption = 'Navigation Header';
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            OptimizeForTextSearch = true;

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Name)) or ("Search Name" = '') then
                    "Search Name" := Name;
            end;
        }
        field(3; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
            OptimizeForTextSearch = true;
        }
        field(4; Blocked; Enum "Vendor Blocked")
        {
            Caption = 'Blocked';
        }
        field(5; "Privacy Blocked"; Boolean)
        {
            Caption = 'Privacy Blocked';

            trigger OnValidate()
            begin
                if "Privacy Blocked" then
                    Blocked := Blocked::All
                else
                    Blocked := Blocked::" ";
            end;
        }
        field(6; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(7; "Balance (LCY)"; Decimal)
        {
            Caption = 'Balance (LCY)';
            Editable = false;
        }

        field(8; "Balance Due (LCY)"; Decimal)
        {
            Caption = 'Balance Due (LCY)';
            Editable = false;
        }
        field(9; "Document Sending Profile"; Code[20])
        {
            Caption = 'Document Sending Profile';
            TableRelation = "Document Sending Profile".Code;
        }
        field(10; "Search Name"; Code[100])
        {
            Caption = 'Search Name';
        }
        field(11; "IC Partner Code"; Code[20])
        {
            Caption = 'IC Partner Code';
            TableRelation = "IC Partner";
        }
        field(12; "Purchaser Code"; Code[20])
        {
            Caption = 'Purchaser Code';
            TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
        }
        field(13; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(14; "Disable Search by Name"; Boolean)
        {
            Caption = 'Disable Search by Name';
            DataClassification = SystemMetadata;
        }
        field(15; "Company Size Code"; Code[20])
        {
            Caption = 'Company Size Code';
            TableRelation = "Company Size";
        }
        field(16; Address; Text[100])
        {
            Caption = 'Address';
            OptimizeForTextSearch = true;
        }
        field(17; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            OptimizeForTextSearch = true;
        }
        field(18; City; Text[30])
        {
            Caption = 'City';
            OptimizeForTextSearch = true;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City;

        }
        field(19; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(20; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            OptimizeForTextSearch = true;
        }
        field(21; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            ValidateTableRelation = false;
        }
        field(22; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            OptimizeForTextSearch = true;
            ExtendedDatatype = PhoneNo;
        }
        field(23; "Mobile Phone No."; Text[30])
        {
            Caption = 'Mobile Phone No.';
            OptimizeForTextSearch = true;
            ExtendedDatatype = PhoneNo;
        }
        field(24; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            OptimizeForTextSearch = true;
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                if "E-Mail" = '' then
                    exit;
                MailManagement.CheckValidEmailAddresses("E-Mail");
            end;
        }
        field(25; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
            OptimizeForTextSearch = true;
        }
        field(26; "Home Page"; Text[80])
        {
            Caption = 'Home Page';
            OptimizeForTextSearch = true;
            ExtendedDatatype = URL;
            ObsoleteReason = 'Field length will be increased to 255.';
            ObsoleteState = Pending;
            ObsoleteTag = '24.0';
        }
        field(27; "Our Account No."; Text[20])
        {
            Caption = 'Our Account No.';
            OptimizeForTextSearch = true;
        }
        field(28; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(29; "Format Region"; Text[80])
        {
            Caption = 'Format Region';
            OptimizeForTextSearch = true;
            TableRelation = "Language Selection"."Language Tag";
        }
        field(30; "Primary Contact No."; Code[20])
        {
            Caption = 'Primary Contact No.';
            TableRelation = Contact;

            trigger OnLookup()
            var
                Cont: Record Contact;
                ContBusRel: Record "Contact Business Relation";
                TempVend: Record Vendor temporary;
            begin
                Cont.FilterGroup(2);
                ContBusRel.SetCurrentKey("Link to Table", "No.");
                ContBusRel.SetRange("Link to Table", ContBusRel."Link to Table"::Vendor);
                ContBusRel.SetRange("No.", "No.");
                if ContBusRel.FindFirst() then
                    Cont.SetRange("Company No.", ContBusRel."Contact No.")
                else
                    Cont.SetRange("No.", '');

                if "Primary Contact No." <> '' then
                    if Cont.Get("Primary Contact No.") then;
                if PAGE.RunModal(0, Cont) = ACTION::LookupOK then begin
                    TempVend.Copy(Rec);
                    Find();
                    TransferFields(TempVend, false);
                    Validate("Primary Contact No.", Cont."No.");
                end;
            end;
        }
        field(31; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';
            OptimizeForTextSearch = true;


        }
        field(32; "EORI Number"; Text[40])
        {
            Caption = 'EORI Number';
            OptimizeForTextSearch = true;
        }
        field(33; GLN; Code[13])
        {
            Caption = 'GLN';
            Numeric = true;

            trigger OnValidate()
            var
                GLNCalculator: Codeunit "GLN Calculator";
            begin
                if GLN <> '' then
                    GLNCalculator.AssertValidCheckDigit13(GLN);
            end;
        }

        field(34; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
        }
        field(35; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";
        }
        field(36; "Pay-to Vendor No."; Code[20])
        {
            Caption = 'Pay-to Vendor No.';
            TableRelation = Vendor;
        }
        field(37; "Invoice Disc. Code"; Code[20])
        {
            Caption = 'Invoice Disc. Code';
            TableRelation = Vendor;
            ValidateTableRelation = false;
        }
        field(38; "Prices Including VAT"; Boolean)
        {
            Caption = 'Prices Including VAT';
        }
        field(39; "Price Calculation Method"; Enum "Price Calculation Method")
        {
            Caption = 'Price Calculation Method';

            trigger OnValidate()
            var
                PriceCalculationMgt: Codeunit "Price Calculation Mgt.";
                PriceType: Enum "Price Type";
            begin
                if "Price Calculation Method" <> "Price Calculation Method"::" " then
                    PriceCalculationMgt.VerifyMethodImplemented("Price Calculation Method", PriceType::Purchase);
            end;
        }
        field(40; "Registration Number"; Text[50])
        {
            Caption = 'Registration No.';
            OptimizeForTextSearch = true;
        }
        field(41; "Prepayment %"; Decimal)
        {
            Caption = 'Prepayment %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(42; "Application Method"; Enum "Application Method")
        {
            Caption = 'Application Method';
        }
        field(43; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
        }
        field(44; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
        }
        field(45; Priority; Integer)
        {
            Caption = 'Priority';
        }
        field(46; "Block Payment Tolerance"; Boolean)
        {
            Caption = 'Block Payment Tolerance';
        }
        field(47; "Preferred Bank Account Code"; Code[20])
        {
            Caption = 'Preferred Bank Account Code';
            TableRelation = "Vendor Bank Account".Code where("Vendor No." = field("No."));
        }
        field(48; "Partner Type"; Enum "Partner Type")
        {
            Caption = 'Partner Type';
        }
        field(49; "Intrastat Partner Type"; Enum "Partner Type")
        {
            Caption = 'Intrastat Partner Type';
        }
        field(50; "Cash Flow Payment Terms Code"; Code[10])
        {
            Caption = 'Cash Flow Payment Terms Code';
            TableRelation = "Payment Terms";
        }

        field(51; "Creditor No."; Code[20])
        {
            Caption = 'Creditor No.';
        }
        field(52; "Exclude from Pmt. Practices"; Boolean)
        {
            Caption = 'Exclude from Payment Practices';
        }
        field(53; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(54; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            TableRelation = "Shipment Method";
        }
        field(55; "Lead Time Calculation"; DateFormula)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            Caption = 'Lead Time Calculation';
        }
        field(56; "Base Calendar Code"; Code[10])
        {
            Caption = 'Base Calendar Code';
            TableRelation = "Base Calendar";
        }
        field(57; "Over-Receipt Code"; Code[20])
        {
            Caption = 'Over-Receipt Code';
            TableRelation = "Over-Receipt Code";
        }
        field(58; "No. Series"; code[20])
        {
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }


    // trigger OnInsert()
    // var
    //     myInt: Integer;
    // begin
    //     if "No." = '' then begin
    //         recManfSet.Get();
    //         recManfSet.TestField("Employee Grivance Nos");
    //         NoSeriesMgt.InitSeries(recManfSet."Employee Grivance Nos", xRec."No. Series", 0D, rec."No.", "No. Series");
    //     end
    // end;

    var
        recManfSet: Record "Manufacturing Setup";
        // NoSeriesMgt: Codeunit NoSeriesManagement;
}
