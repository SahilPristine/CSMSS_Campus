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
            trigger OnBeforeAction()
            begin
                recTransport.Reset();
                recTransport.SetRange(SlipNo, rec."Document No.");
                if recTransport.FindFirst() then begin
                    Message('Hello');
                    recTransport.Status := recTransport.Status::Closed;
                    recTransport.Modify();
                    // else
                    // recTransport.Status := recTransport.Status::Open;
                end;

            end;


        }

    }

    var

        recCLE: Record "Cust. Ledger Entry";
        recStFees: Record StudentFeeStructure;
        recGJL: Record "Gen. Journal Line";
        recTransport: Record TransportReg;

}