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
                field(EnrollmentNo; rec.EnrollmentNo)
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
                }
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