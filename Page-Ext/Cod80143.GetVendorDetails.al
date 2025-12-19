codeunit 80143 "Get Vendor Details"
{

    trigger OnRun()
    var
        recVendor: Record vendor;
    begin

        if recVendor.get('50000') then
            GetVendorDetails(recVendor."No.")
    end;

    procedure GetVendorDetails(pCode: code[20])
    var
        recVendor: Record vendor;
    begin
        recVendor.Reset();
        recVendor.setrange("No.", pCode);
        if recVendor.FindFirst() then
            Message('%1', recVendor.Name);
    end;
}
