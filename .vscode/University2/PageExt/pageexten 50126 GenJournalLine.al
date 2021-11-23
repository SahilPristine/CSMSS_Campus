pageextension 50126 GenJournalLine extends 39
{
    layout
    {
        addafter("Account No.")
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

    }


    var

        myInt: Integer;

}