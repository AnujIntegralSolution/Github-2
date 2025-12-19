codeunit 80143 "Get Vendor Details"
{
    TableNo = Vendor;

    trigger OnRun()
    var
        recVendor: Record vendor;
    begin
        GetVendorDetails(rec."No.")
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
