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
        }
        // Add changes to page layout here
    }

    actions
    {
        modify(Post)
        {
            trigger OnAfterAction()
            begin

            end;


        }

    }

    var

        recCLE: Record "Cust. Ledger Entry";
        recStFees: Record StudentFeeStructure;
        recGJL: Record "Gen. Journal Line";

}