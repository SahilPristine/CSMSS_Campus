pageextension 50128 GLEntry extends 20
{
    layout
    {
        addafter("Entry No.")
        {
            field(ElementCode; rec.ElementCode)
            {
                ApplicationArea = All;
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