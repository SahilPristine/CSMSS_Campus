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
                    Caption = 'Registeration No';
                }
                field(RoomShistRegNo; rec.RoomShistRegNo)
                {
                    ApplicationArea = All;
                    Caption = 'Room Shifting Reg No';
                }
                field(RegistrationNo; rec.RegistrationNo)
                {
                    ApplicationArea = All;
                    Caption = 'Enrollment No';
                }
                field(FeesDocNo; rec.FeesDocNo)
                {
                    ApplicationArea = All;
                    Caption = 'Fees Receipt No';
                }
                field(FeesReceipt; rec.FeesReceipt)
                {
                    ApplicationArea = All;
                    Caption = 'Fees Receipt';
                }
                field(GovtCode; rec.GovtCode)
                {
                    ApplicationArea = All;
                    Caption = 'Government Code';
                }
                field(VisitorNo; rec.VisitorNo)
                {
                    ApplicationArea = All;
                    Caption = 'Visitor No';
                }
                field(TransportSlipNO; rec.TransportSlipNO)
                {
                    ApplicationArea = All;
                    Caption = 'Transport Slip No';
                }
                field(DefaultHostelElement; rec.DefaultHostelElement)
                {
                    ApplicationArea = All;
                    Caption = 'Default Hostel Elements';

                }
                field(DefaultDepositElement; rec.DefaultDepositElement)
                {
                    ApplicationArea = All;
                    Caption = 'Default Deposit Elements';
                }
                field(DefaultTransportElement; rec.DefaultTransportElement)
                {
                    ApplicationArea = All;
                    Caption = ' Default Transport Element';
                }
                field(TransportBalAccType; rec.TransportBalAccType)
                {
                    ApplicationArea = All;
                    Caption = 'Transport Bal Acc Type';
                }


            }
        }
    }

    actions
    {
    }

    var
        myInt: Integer;
}