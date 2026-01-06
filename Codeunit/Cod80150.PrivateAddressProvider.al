codeunit 80150 PrivateAddressProvider implements IAdressProvider
{

    procedure GetAddress(): Text
    begin
        exit('My Home Address \ INDIA')
    end;

}
