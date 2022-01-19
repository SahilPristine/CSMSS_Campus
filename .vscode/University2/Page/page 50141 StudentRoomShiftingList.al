page 50141 StudentRoomShiftingList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentRoomShifting;
    CardPageId = 50126;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(RegistrationNo; rec.RegistrationNo)
                {
                    ApplicationArea = All;
                    Caption = 'Registration No';

                }
                field(ShiftingNo; rec.ShiftingNo)
                {
                    ApplicationArea = All;
                    Caption = 'Shifting No';
                }
                field(StudentName; rec.StudentName)
                {
                    ApplicationArea = All;
                    Caption = 'Student Name';
                }
                field(HostelCode; rec.HostelCode)
                {
                    ApplicationArea = All;
                    Caption = 'Hostel Code';
                }
                field(HostelName; rec.HostelName)
                {
                    ApplicationArea = All;
                    Caption = 'Hostel Name';
                }
                field(RoomNo; rec.RoomNo)
                {
                    ApplicationArea = All;
                    Caption = 'Room No';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}