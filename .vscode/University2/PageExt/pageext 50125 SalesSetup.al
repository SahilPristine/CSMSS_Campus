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