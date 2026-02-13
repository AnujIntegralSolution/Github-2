pageextension 80146 "Manufacturing Setup" extends "Manufacturing Setup"
{
    layout
    {
        addafter("Routing Nos.")
        {
            field("Nevigation Nos"; Rec."Nevigation Nos")
            {
                ApplicationArea = All;
            }
        }

    }
}
