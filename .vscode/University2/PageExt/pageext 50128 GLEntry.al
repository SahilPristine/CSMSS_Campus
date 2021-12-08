pageextension 50128 GLEntry extends 20
{
    layout
    {
        addafter("Entry No.")
        {
            field(ElementCode; rec.ElementCode)
            {
                ApplicationArea = All;
                Caption = 'Element Code';
            }
            field(ElementDesc; rec.ElementDesc)
            {
                ApplicationArea = All;
                Caption = 'Element Desc';
            }
            field(ElementType; rec.ElementType)
            {
                ApplicationArea = All;
                Caption = 'Element Type';
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