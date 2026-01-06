codeunit 80149 CompAddressProvider implements IAdressProvider
{

    procedure GetAddress(): text;
    begin
        exit('Company Address \ NEW YORK')
    end;
}
