codeunit 80153 "Change Color"
{

    procedure GetColor(CLHead: Record "Clients Header"): text[50]
    begin
        with CLHead do
            case Rank of
                Rank::Blue:
                    exit('StrongAccent');
                Rank::Red:
                    exit('Attention');
                Rank::Green:
                    exit('Favorable');
                Rank::Yellow:
                    exit('Ambiguous');
            end;

    end;
}
