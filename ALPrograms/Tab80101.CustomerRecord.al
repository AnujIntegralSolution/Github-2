table 80140 "Customer Record"
{
    Caption = 'Customer Record';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            OptimizeForTextSearch = true;
            trigger OnValidate()
            var
                recCust: Record Customer;
                regex: Codeunit Regex;
                Pattern: Text;
            begin
                if recCust.get("No.") then begin
                    rec.Name := recCust.Name;
                    rec."Name 2" := recCust."Name 2";
                    rec."Search Name" := recCust."Search Name";
                end;

                Pattern := '[A-Z,0-9]{7}';
                if regex.IsMatch("No.", Pattern, 0) then
                    Message('Ragistred : %1', rec."No.")
                else
                    Error('Please enter the valid No.');
            end;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Name)) or ("Search Name" = '') then
                    "Search Name" := Name;
            end;
        }
        field(3; "Search Name"; Code[100])
        {
            Caption = 'Search Name';
        }
        field(4; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
            OptimizeForTextSearch = true;
        }
        field(5; "Balance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Balance (LCY)';
            Editable = false;
        }
        field(6; "Balance Due (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Balance Due (LCY)';
            Editable = false;
        }

        field(7; "Credit Limit (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Credit Limit (LCY)';
            trigger OnValidate()

            begin
                if rec."Credit Limit (LCY)" < 10000 then
                    Error('OOPS! you entered wrong Credit Limit (LCY)')
                else
                    Message('Credit Limit (LCY) Posted');
            end;
        }
        field(8; Blocked; Enum "Customer Blocked")
        {
            Caption = 'Blocked';
        }
        field(9; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
        }
        field(10; "Document Sending Profile"; Code[20])
        {
            Caption = 'Document Sending Profile';
            TableRelation = "Document Sending Profile".Code;
        }
        field(11; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(12; Priority; Integer)
        {
            Caption = 'Priority';
        }
        field(13; Tot; Decimal)
        {
            Caption = 'Tot';
        }
        field(14; Address; Text[100])
        {
            Caption = 'Address';
            OptimizeForTextSearch = true;
        }
        field(15; "Address 2"; Text[100])
        {
            Caption = 'Address 2';
            OptimizeForTextSearch = true;
        }
        field(16; "Country/Region Code"; Code[50])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }

        field(17; City; Text[50])
        {
            Caption = 'City';
            Editable = false;
            OptimizeForTextSearch = true;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            ValidateTableRelation = false;

        }
        field(18; "State Code"; Code[20])
        {
            caption = 'State Code';
        }
        field(19; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = "Post Code";

            trigger OnLookup()
            var
                cust: Record customer;
                xRec: Record Customer;
            begin
                OnBeforeLookupPostCode(cust, PostCode);
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
                OnAfterLookupPostCode(cust, xRec, PostCode);
            end;
        }
        field(20; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            OptimizeForTextSearch = true;
            ExtendedDatatype = PhoneNo;
        }
        field(21; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            OptimizeForTextSearch = true;
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                regex: Codeunit Regex;
                Pattern: Text;
            begin
                Pattern := '^[a-zA-Z0-9+_.-]+@[gmail]';
                if regex.IsMatch(rec."E-Mail", Pattern, 0)
                then
                    Message('Matched')
                else
                    Error('Invalid input');
            end;
        }
        field(22; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
            OptimizeForTextSearch = true;
        }
        field(23; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(24; "Format Region"; Text[80])
        {
            Caption = 'Format Region';
            OptimizeForTextSearch = true;
            TableRelation = "Language Selection"."Language Tag";
        }
        field(25; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            TableRelation = Customer;
        }
        field(26; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';
            OptimizeForTextSearch = true;
        }
        field(27; "EORI Number"; Text[40])
        {
            Caption = 'EORI Number';
            OptimizeForTextSearch = true;
        }
        field(28; GLN; Code[13])
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
        field(29; "Use GLN in Electronic Document"; Boolean)
        {
            Caption = 'Use GLN in Electronic Documents';
        }
        field(30; "Registration Number"; Text[50])
        {
            Caption = 'Registration No.';
            OptimizeForTextSearch = true;
        }
        field(31; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(32; "Customer Posting Group"; Code[30])
        {
            Caption = 'Customer Posting Group';
            TableRelation = "Customer Posting Group";
        }
        field(33; "Currency Description"; text[50])
        {
            Caption = 'Currency Description';
        }
        field(34; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
            trigger OnValidate()
            var
                recCurr: Record Currency;
            begin
                if recCurr.get(rec."Currency Code") then begin
                    rec.Symbol := recCurr.GetCurrencySymbol();
                    rec."Currency Description" := recCurr.Description;
                end;
            end;
        }
        field(35; "Customer Price Group"; Code[10])
        {
            Caption = 'Customer Price Group';
            TableRelation = "Customer Price Group";
        }
        field(36; "Customer Disc. Group"; Code[20])
        {
            Caption = 'Customer Disc. Group';
            TableRelation = "Customer Discount Group";
        }
        field(37; "Invoice Disc. Code"; Code[20])
        {
            Caption = 'Invoice Disc. Code';
            TableRelation = Customer;
            ValidateTableRelation = false;
        }
        field(38; "Prices Including VAT"; Boolean)
        {
            Caption = 'Prices Including VAT';
        }
        field(39; "Application Method"; Enum "Application Method")
        {
            Caption = 'Application Method';
        }
        field(40; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
        }
        field(41; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
        }
        field(42; "Fin. Charge Terms Code"; Code[10])
        {
            Caption = 'Fin. Charge Terms Code';
            TableRelation = "Finance Charge Terms";
        }
        field(43; "Print Statements"; Boolean)
        {
            Caption = 'Print Statements';
        }
        field(44; "Last Statement No."; Integer)
        {
            Caption = 'Last Statement No.';
        }
        field(45; "Ship-to Code"; Code[30])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address".Code where("Customer No." = field("No."));
        }
        field(46; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
            trigger OnValidate()
            var
                recLOC: Record Location;
                reccustEX: Record "Customer Record";
            begin
                if recLOC.get(rec."Location Code") then begin
                    rec."Location Name" := recLOC.Name;
                    reccustEX."Location Name" := recLOC.Name;
                end else
                    rec."Location Name" := '';
            end;
        }
        field(47; "Location Name"; text[100])
        {
            Caption = 'Location Name';
        }
        field(48; "Combine Shipments"; Boolean)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'Combine Shipments';
        }
        field(49; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            TableRelation = "Shipment Method";
        }
        field(50; "Shipping Agent Code"; Code[10])
        {
            AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
        }
        field(51; "Age"; Integer)
        {
            Caption = 'Age';
            trigger OnValidate()
            begin
                Hyperlink('https://go.microsoft.com/fwlink/?linkid=867580');
            end;
        }
        field(52; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            OptimizeForTextSearch = true;
        }
        field(53; Salary; Decimal)
        {
            Caption = 'Salary';
            trigger OnValidate()
            begin
                if Rec.Salary > 10000 then
                    rec.FieldError(Salary, 'Unit Price cannot be greater than 10000');
            end;
        }
        field(54; "Budgeted Amount"; Decimal)
        {
            AutoFormatExpression = Rec."Currency Code";
            AutoFormatType = 1;
        }
        field(55; Symbol; Text[10])
        {
            Caption = 'Symbol';
        }
        field(56; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(57; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(58; "New Balance"; Decimal)
        {
            Caption = 'New Balance';
        }
        field(59; "Credit Limit"; Decimal)
        {
            Caption = 'Credit Limit';
        }






    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }



    procedure ResolveCurrencySymbol(CurrencyCode: Code[10]): Text[10]
    var
        Currency: Record Currency;
        PoundChar: Char;
        EuroChar: Char;
        YenChar: Char;
    begin
        OnBeforeResolveCurrencySymbol(Currency, CurrencyCode);
        if Currency.Get(CurrencyCode) then
            if Currency.Symbol <> '' then
                exit(Currency.Symbol);

        PoundChar := 163;
        YenChar := 165;
        EuroChar := 8364;

        case CurrencyCode of
            'AUD', 'BND', 'CAD', 'FJD', 'HKD', 'MXN', 'NZD', 'SBD', 'SGD', 'USD':
                exit('$');
            'GBP':
                exit(Format(PoundChar));
            'DKK', 'ISK', 'NOK', 'SEK':
                exit('kr');
            'EUR':
                exit(Format(EuroChar));
            'CNY', 'JPY':
                exit(Format(YenChar));
        end;

        exit('');
    end;


    [IntegrationEvent(false, false)]
    local procedure OnBeforeResolveCurrencySymbol(var Currency: Record Currency; var CurrencyCode: Code[10])
    begin
    end;


    [IntegrationEvent(false, false)]
    local procedure OnBeforeLookupPostCode(var Customer: Record Customer; var PostCodeRec: Record "Post Code")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterLookupPostCode(var Customer: Record Customer; xCustomer: Record Customer; var PostCodeRec: Record "Post Code")
    begin
    end;

    // Table Triggers
    trigger OnInsert()
    begin
        Message('%1 Customer No. and Name Inserted', rec."No.");
    end;

    trigger OnModify()
    begin
        Message('%1 Customer Name Modified', rec."No.");
    end;

    trigger OnDelete()
    begin
        Message('%1 Record Deleted', rec."No.");
    end;






    var
        PostCode: Record "Post Code";
}

