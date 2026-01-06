codeunit 80147 MyPublisher
{
    [IntegrationEvent(false, false)]

    procedure OnAddressLineChange(Line: text[100])
    begin

    end;
}



pageextension 80144 CustomerExt1 extends "Customer Card"
{
    layout
    {
        modify(Address)
        {
            trigger OnBeforeValidate();
            var
                Publisher: Codeunit MyPublisher;
            begin
                Publisher.OnAddressLineChange(Rec.Address);
            end;
        }
    }

    var
        MyInit: Integer;
}

codeunit 80148 MySubscriberss
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"MyPublisher", 'OnAddressLineChange', '', true, true)]
    procedure CheckAddressLine(line: Text[100]);
    begin
        if (STRPOS(line, '+') > 0) then begin
            MESSAGE('Can''t use a plus sign (+) in the address [' + line + ']');
        end;
    end;
}
