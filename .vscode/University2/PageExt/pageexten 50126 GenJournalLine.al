pageextension 50126 GenJournalLine extends 39
{
    layout
    {
        addafter("Account No.")
        {
            field(ElementCode; rec.ElementCode)
            {
                ApplicationArea = all;
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

    }


    var

        myInt: Integer;

}