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
            field(ElementType; rec.ElementType)
            {
                ApplicationArea = All;
                Caption = 'Element Type';
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

            action(TestExport)
            {
                ApplicationArea = All;

            }
        }
    }

}