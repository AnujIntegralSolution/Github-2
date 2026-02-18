page 80178 "Customer Excel Buffer Card"
{
    ApplicationArea = All;
    Caption = 'Customer Card';
    PageType = Card;
    SourceTable = "Customer Excel Buffer";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;
                    Importance = Additional;

                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                }

                field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;

                }
                field("Credit Limit (LCY)"; Rec."Credit Limit (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    trigger OnValidate()
                    begin
                        if (rec."Credit Limit (LCY)" < 1000) then
                            Error('You have entered a wrong credit limit(LCY)');

                    end;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                }

                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;

                }

                field("Document Sending Profile"; Rec."Document Sending Profile")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                }


                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;

                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = All;
                }

                field(Tot; Rec.Tot)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin
                        if rec.Tot < 5000 then
                            Message('You will get 5% discount')
                        else
                            if (rec.Tot > 5000) and
                            (rec.Tot < 10000) and
                            (rec.Tot <> 9999) then
                                Message('You will get 10% discount')
                            else
                                if (rec.Tot > 10000) and
                                (rec.Tot < 15000) then
                                    Message('You will get 15% discount');
                    end;
                }
            }
            group("Address & Contact")
            {
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;

                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;

                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;

                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                }

                field("State Code"; Rec."State Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                }

                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic, Suite;
                    ExtendedDatatype = EMail;
                    Importance = Additional;
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                }

                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                }
                field("Format Region"; Rec."Format Region")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bill-to Customer';
                    Importance = Promoted;
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = VAT;
                    Importance = Promoted;
                }
                field("EORI Number"; Rec."EORI Number")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                }
                field(GLN; Rec.GLN)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                }
                field("Use GLN in Electronic Document"; Rec."Use GLN in Electronic Document")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                }

                field("Registration Number"; Rec."Registration Number")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                }
                group(PostingDetails)
                {
                    Caption = 'Posting Details';
                    field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Promoted;
                        ShowMandatory = true;
                    }

                    field("Customer Posting Group"; Rec."Customer Posting Group")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Promoted;
                        ShowMandatory = true;
                    }

                }
                group(PricesandDiscounts)
                {
                    Caption = 'Prices and Discounts';
                    field("Currency Id"; Rec."Currency Id")
                    {
                        ApplicationArea = Suite;
                        Importance = Additional;
                    }
                    field("Currency Code"; Rec."Currency Code")
                    {
                        ApplicationArea = Suite;
                        Importance = Additional;
                    }


                    field("Customer Price Group"; Rec."Customer Price Group")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Promoted;
                    }
                    field("Customer Disc. Group"; Rec."Customer Disc. Group")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Promoted;
                    }

                    field("Invoice Disc. Code"; Rec."Invoice Disc. Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        NotBlank = true;

                    }
                    field("Prices Including VAT"; Rec."Prices Including VAT")
                    {
                        ApplicationArea = VAT;
                        Importance = Additional;
                    }
                }
            }
            group(Payment)
            {
                field("Application Method"; Rec."Application Method")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                }
                field("Fin. Charge Terms Code"; Rec."Fin. Charge Terms Code")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                }

                field("Print Statements"; Rec."Print Statements")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                }
                field("Last Statement No."; Rec."Last Statement No.")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                }

            }
            group(Ship)
            {
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Location;
                    Importance = Promoted;
                }
                field("Location Name"; Rec."Location Name")
                {
                    ApplicationArea = All;
                }
                field("Combine Shipments"; Rec."Combine Shipments")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                }

                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Shipment Method Code';
                    Importance = Promoted;
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = Suite;
                    Caption = 'Shipping Agent Code';
                    Importance = Additional;
                }

                field(Age; Rec.Age)
                {
                    trigger OnValidate()
                    var
                        Text001: Label 'Eligible';
                        Text002: Label 'Not eligible';
                        Age: Integer;

                    begin
                        if age >= 21 then
                            Message(Text001)
                        else
                            Error(Text002);
                    end;
                }

            }

            group(Input)

            {
                Caption = 'Input';
                field(Initialamount; Initialamount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Initial Amount';
                    Caption = 'Initial Amount';

                }
                field(NoOfYears; NoOfYears)
                {
                    ApplicationArea = All;

                }
                field(RateOfInterest; RateOfInterest)
                {
                    ApplicationArea = All;

                }
            }

            group(Output)

            {
                Caption = 'Output';
                field(FinalAmount; FinalAmount)
                {
                    ApplicationArea = All;
                    Editable = false;

                }
            }

        }
        area(FactBoxes)
        {
            part(Picture; "Item Picture")
            {
                ApplicationArea = all;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = all;
            }
            systempart(Links; Links)
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(print)
            {
                ApplicationArea = all;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    recCE: Record "Customer Excel Buffer";
                begin
                    recCE.SetRange("No.", rec."No.");
                    if recCE.FindSet() then
                        Report.RunModal(Report::"Customer Excel Buffer Report", true, false, recCE);
                end;
            }
            group("&Get")
            {
                Caption = '&Get';
                Image = Action;
                action("Customer")
                {
                    ApplicationArea = Basic, Suite;
                    AboutText = 'The customer Card view';
                    Caption = 'Customer Details';
                    RunObject = page "Customer Card";
                    Image = ViewDetails;

                }
                action("Sales")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Details';
                    Image = GetSourceDoc;
                    RunObject = page "Sales Analysis View Card";
                }

                action("Calculate Simple Interest")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Calculate the Interest';
                    Image = ExecuteBatch;
                    ToolTip = 'Interest Calculation';

                    trigger OnAction()
                    begin

                        FinalAmount := Initialamount * (RateOfInterest * NoOfYears);
                    end;
                }

                action("modify")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Change;
                    trigger OnAction()
                    var
                        recCustEx: Record "Customer Excel Buffer";
                    begin
                        if recCustEx.Get(rec."No.") then begin
                            recCustEx.Name := '3S SOLUTIONS';
                            recCustEx.Modify();
                        end;
                    end;

                }
            }
        }
    }




    trigger OnClosePage()
    begin
        Message('Customer is %1', Rec."No.");

    end;


    var

        Initialamount: Decimal;
        NoOfYears: Integer;
        RateOfInterest: Decimal;
        FinalAmount: Decimal;
        IsOfficeAddin: Boolean;
}