page 80145 "Navigation Card"
{
    Caption = 'Navigation Card';
    PageType = NavigatePage;
    SourceTable = Vendor;

    layout
    {
        area(content)
        {
            group(Step1)
            {
                Visible = Step1Visible;
                group(General)
                {
                    Caption = 'General';

                    field("No."; Rec."No.")
                    {
                        ApplicationArea = All;
                        Importance = Standard;

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
                        Visible = false;
                    }
                    field(Blocked; Rec.Blocked)
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Privacy Blocked"; Rec."Privacy Blocked")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                    }
                    field("Last Date Modified"; Rec."Last Date Modified")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                    }
                    field("Balance (LCY)"; Rec."Balance (LCY)")
                    {
                        ApplicationArea = Basic, Suite;
                    }

                    field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Document Sending Profile"; Rec."Document Sending Profile")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                    }
                    field("Search Name"; Rec."Search Name")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                    }
                    field("IC Partner Code"; Rec."IC Partner Code")
                    {
                        ApplicationArea = Intercompany;
                        Importance = Additional;
                    }
                    field("Purchaser Code"; Rec."Purchaser Code")
                    {
                        ApplicationArea = Suite;
                        Importance = Additional;
                    }
                    field("Responsibility Center"; Rec."Responsibility Center")
                    {
                        ApplicationArea = Suite;
                        Importance = Additional;
                    }
                    field("Disable Search by Name"; Rec."Disable Search by Name")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                    }
                    field("Company Size Code"; Rec."Company Size Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                    }
                }

            }
            group(Step2)
            {
                Visible = Step2Visible;
                Caption = 'Address & Contact';
                group(AddressDetails)
                {
                    Caption = 'Address';
                    field(Address; Rec.Address)
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Country/Region Code"; Rec."Country/Region Code")
                    {
                        ApplicationArea = Basic, Suite;


                    }
                    field(City; Rec.City)
                    {
                        ApplicationArea = Basic, Suite;
                    }

                    field(County; Rec.County)
                    {
                        ApplicationArea = Basic, Suite;
                    }

                    field("Post Code"; Rec."Post Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Promoted;
                    }

                    field("Phone No."; Rec."Phone No.")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field(MobilePhoneNo; Rec."Mobile Phone No.")
                    {
                        Caption = 'Mobile Phone No.';
                        ApplicationArea = Basic, Suite;
                        ExtendedDatatype = PhoneNo;
                    }
                    field("E-Mail"; Rec."E-Mail")
                    {
                        ApplicationArea = Basic, Suite;
                        ExtendedDatatype = EMail;
                        Importance = Promoted;
                    }
                    field("Fax No."; Rec."Fax No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                    }
                    field("Home Page"; Rec."Home Page")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Our Account No."; Rec."Our Account No.")
                    {
                        ApplicationArea = Basic, Suite;
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
                    field("Primary Contact No."; Rec."Primary Contact No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Primary Contact Code';
                    }

                }
            }
            group(Step3)
            {
                Visible = Step3Visible;
                group(Invoicing)
                {
                    Caption = 'Invoicing';
                    field("VAT Registration No."; Rec."VAT Registration No.")
                    {
                        ApplicationArea = VAT;
                    }
                    field("EORI Number"; Rec."EORI Number")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the Economic Operators Registration and Identification number that is used when you exchange information with the customs authorities due to trade into or out of the European Union.';
                        Visible = false;
                    }
                    field(GLN; Rec.GLN)
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                    }
                    field("Tax Liable"; Rec."Tax Liable")
                    {
                        ApplicationArea = SalesTax;
                        ToolTip = 'Specifies if the customer is liable for sales tax.';
                    }
                    field("Tax Area Code"; Rec."Tax Area Code")
                    {
                        ApplicationArea = SalesTax;
                    }
                    field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        ToolTip = 'Specifies the number of a different vendor whom you pay for products delivered by the vendor on the vendor card.';
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
                    }
                    field("Price Calculation Method"; Rec."Price Calculation Method")
                    {

                        ApplicationArea = Basic, Suite;
                        Importance = Promoted;
                    }
                    field("Registration Number"; Rec."Registration Number")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                    }

                }
            }
            group(Step4)
            {
                Visible = Step4Visible;
                group(Payments)
                {
                    Caption = 'Payments';
                    field("Prepayment %"; Rec."Prepayment %")
                    {
                        ApplicationArea = Prepayments;
                        Importance = Additional;
                    }
                    field("Application Method"; Rec."Application Method")
                    {
                        ApplicationArea = Basic, Suite;
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
                    field(Priority; Rec.Priority)
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Block Payment Tolerance"; Rec."Block Payment Tolerance")
                    {
                        ApplicationArea = Basic, Suite;


                    }
                    field("Preferred Bank Account Code"; Rec."Preferred Bank Account Code")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Partner Type"; Rec."Partner Type")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Intrastat Partner Type"; Rec."Intrastat Partner Type")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                    }
                    field("Cash Flow Payment Terms Code"; Rec."Cash Flow Payment Terms Code")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Creditor No."; Rec."Creditor No.")
                    {
                        ApplicationArea = Basic, Suite;
                    }
                    field("Exclude from Pmt. Practices"; Rec."Exclude from Pmt. Practices")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                    }

                }

            }
            group(Step5)
            {
                Visible = Step5Visible;

                group(Receiving)
                {
                    Caption = 'Receiving';
                    field("Location Code"; Rec."Location Code")
                    {
                        ApplicationArea = Location;
                        Importance = Promoted;
                    }
                    field("Shipment Method Code"; Rec."Shipment Method Code")
                    {
                        ApplicationArea = Suite;
                        Importance = Promoted;
                    }
                    field("Lead Time Calculation"; Rec."Lead Time Calculation")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Promoted;
                    }
                    field("Base Calendar Code"; Rec."Base Calendar Code")
                    {
                        ApplicationArea = Basic, Suite;
                        DrillDown = false;
                    }
                    field("Over-Receipt Code"; Rec."Over-Receipt Code")
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(ActionBack)
            {
                ApplicationArea = All;
                Caption = 'Back';
                Enabled = BackActionEnabled;
                Image = PreviousRecord;
                InFooterBar = true;
                trigger OnAction();
                begin
                    NextStep(true);
                end;
            }
            action(ActionNext)
            {
                ApplicationArea = All;
                Caption = 'Next';
                Enabled = NextActionEnabled;
                Image = NextRecord;
                InFooterBar = true;
                trigger OnAction();
                begin
                    NextStep(false);
                end;
            }
            action(ActionFinish)
            {
                ApplicationArea = All;
                Caption = 'Finish';
                Enabled = FinishActionEnabled;
                Image = Approve;
                InFooterBar = true;
                trigger OnAction();
                begin
                    FinishAction();
                    Message('Navigation Posted');
                end;

            }
        }
    }


    trigger OnOpenPage();

    begin
        Step := Step::Start;
        EnableControls();
    end;

    local procedure EnableControls();
    begin
        ResetControls();

        case Step of
            Step::Start:
                ShowStep1();
            Step::Step2:
                ShowStep2();
            Step::Step3:
                ShowStep3();
            Step::Step4:
                ShowStep4();
            Step::Finish:
                ShowStep5();
        end;
    end;

    local procedure FinishAction();
    begin

        CurrPage.Close();
    end;

    local procedure NextStep(Backwards: Boolean);
    begin
        if Backwards then
            Step := Step - 1
        ELSE
            Step := Step + 1;

        EnableControls();
    end;

    local procedure ShowStep1();
    begin
        Step1Visible := true;
        FinishActionEnabled := false;
        BackActionEnabled := false;
    end;

    local procedure ShowStep2();
    begin
        Step1Visible := false;
        Step2Visible := true;

        FinishActionEnabled := false;
        BackActionEnabled := true;
        NextActionEnabled := true;
    end;

    local procedure ShowStep3();
    begin
        Step1Visible := false;
        Step2Visible := false;
        Step3Visible := true;

        FinishActionEnabled := false;
        BackActionEnabled := true;
        NextActionEnabled := true;
    end;

    local procedure ShowStep4();
    begin
        Step1Visible := false;
        Step2Visible := false;
        Step3Visible := false;
        Step4Visible := true;


        FinishActionEnabled := false;
        BackActionEnabled := true;
        NextActionEnabled := true;
    end;

    local procedure ShowStep5();
    begin
        Step1Visible := false;
        Step2Visible := false;
        Step3Visible := false;
        Step4Visible := false;
        Step5Visible := true;

        NextActionEnabled := false;
        FinishActionEnabled := true;
        BackActionEnabled := false;
    end;

    local procedure ResetControls();
    begin
        FinishActionEnabled := false;
        BackActionEnabled := true;
        NextActionEnabled := true;

        Step1Visible := false;
        Step5Visible := false;
    end;

    var
        Step1Visible: Boolean;
        Step2Visible: Boolean;
        Step3Visible: Boolean;
        Step4Visible: Boolean;
        Step5Visible: Boolean;
        Step: Option Start,Step2,Step3,Step4,Finish;
        BackActionEnabled: Boolean;
        FinishActionEnabled: Boolean;
        NextActionEnabled: Boolean;


}