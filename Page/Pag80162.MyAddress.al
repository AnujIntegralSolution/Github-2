page 80162 MyAddress
{
    ApplicationArea = All;
    Caption = 'MyAddress';
    PageType = Card;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

            }
        }
    }

    Actions
    {
        area(Processing)
        {
            action(WhatsTheAddress)
            {
                ApplicationArea = All;
                Caption = 'whats''s'' the Address ?';
                ToolTip = 'Select The Address.';
                Image = Addresses;

                trigger OnAction()
                var
                    iAddressProvider: Interface IAdressProvider;
                begin
                    Addressproviderfectory(iAddressProvider);
                    Message(iAddressProvider.GetAddress());
                end;
            }

            action(SendToHome)
            {
                ApplicationArea = All;
                Caption = 'Send To Home.';
                ToolTip = 'Set the interface implement to Home.';
                Image = Home;

                trigger OnAction()
                begin
                    SendTo := SendTo::Private;
                end;
            }

            action(SendToWork)
            {
                ApplicationArea = All;
                Caption = 'Send To Work.';
                ToolTip = 'Set the interface implement to Work.';
                Image = WorkCenter;

                trigger OnAction()
                begin
                    SendTo := SendTo::Company;
                end;
            }
        }
    }

    local procedure AddressProviderFectory(var iAddressProvider: Interface IAdressProvider)
    var
        CompanyAddressProvider: Codeunit CompAddressProvider;
        privateAddressProvider: Codeunit PrivateAddressProvider;
    begin

        if SendTo = SendTo::Company then
            iAddressProvider := CompanyAddressProvider;

        if SendTo = SendTo::Private then
            iAddressProvider := privateAddressProvider;

    end;


    var
        SendTo: Enum SendTo;
}
