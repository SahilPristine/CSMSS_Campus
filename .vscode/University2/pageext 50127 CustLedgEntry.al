pageextension 50127 CustLedgEntry extends 25
{
    layout
    {
        addafter("Amount (LCY)")
        {
            field(ElementCode; rec.ElementCode)
            {
                ApplicationArea = all;
            }
            field(ElementDesc; rec.ElementDesc)
            {
                ApplicationArea = All;
            }
            field(ElementType; rec.ElementType)
            {
                ApplicationArea = All;
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