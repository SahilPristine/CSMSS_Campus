pageextension 50125 GenLedgerSetup extends 459
{
    layout
    {
        addlast(content)
        {
            group(University)
            {
                field(RegisterationNo; rec.RegisterationNo)
                {
                    ApplicationArea = All;
                }
                field(RoomShistRegNo; rec.RoomShistRegNo)
                {
                    ApplicationArea = All;
                }
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}