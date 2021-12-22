pageextension 50127 CustLedgEntry extends 25
{
    layout
    {

        addafter("Amount (LCY)")
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
            field(AcademicYear; rec.AcademicYear)
            {
                ApplicationArea = All;
            }
            field("Course Code"; rec."Course Code")
            {
                ApplicationArea = All;
            }
            field("Semester Code"; rec."Semester Code")
            {
                ApplicationArea = All;
            }
            field("Stream Code"; rec."Stream Code")
            {
                ApplicationArea = All;
            }
            field(Class; rec.Class)
            {
                ApplicationArea = All;
            }

        }
        addlast(Control1)
        {
            field(PaymentReceived; rec.PaymentReceived)
            {
                ApplicationArea = All;
                Caption = 'Payment Received';
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        addafter("Ent&ry")
        {
            action(ExportToExcel)
            {
                ApplicationArea = All;
                Promoted = true;
                Caption = 'Export To Excel';
                PromotedCategory = Process;

                trigger OnAction()
                begin

                end;

            }


        }
    }
    // trigger OnAfterGetRecord()
    // begin
    //     if CustLedgerEntry.Open = true then
    //         CustLedgerEntry.PaymentReceived := true
    //     else
    //         CustLedgerEntry.PaymentReceived := false;
    // end;

    // var
    //     CustLedgerEntry: Record "Cust. Ledger Entry";

}