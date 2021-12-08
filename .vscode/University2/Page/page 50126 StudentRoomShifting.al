page 50126 StudentRoomShifting
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 50126;
    Caption = 'Room Shifting';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Registeration Details';
                field(RegistrationNo; Rec.RegistrationNo)
                {
                    ApplicationArea = All;
                    Caption = 'Registration No';

                }
                field(ShiftingNo; rec.ShiftingNo)
                {
                    ApplicationArea = All;
                    Caption = 'Shifting No';
                }
                field(StudentCode; Rec.StudentCode)
                {
                    ApplicationArea = All;
                    Caption = 'Student Code';

                }
                field(RegistrationDate; Rec.RegistrationDate)
                {
                    ApplicationArea = All;
                    Caption = 'Registration Date';

                }
                field(CollegeName; Rec.CollegeName)
                {
                    ApplicationArea = All;
                    Caption = 'College Name';

                }
            }
            group(StudentDetails)
            {
                Caption = 'Student Details';
                field(StudentName; Rec.StudentName)
                {
                    ApplicationArea = All;
                    Caption = 'Student Name';

                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    Caption = 'Address Line 1';

                }
                field(Address2; rec.Address2)
                {
                    ApplicationArea = All;
                    Caption = 'Address Line 2';
                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = All;

                }
                field(ContactNo; Rec.ContactNo)
                {
                    ApplicationArea = All;
                    Caption = 'Contact No';
                }
                field(HostelName; Rec.HostelName)
                {
                    ApplicationArea = All;
                    Caption = 'Hostel Name';

                }
                field(RoomNo; Rec.RoomNo)
                {
                    ApplicationArea = All;
                    Caption = 'Room No';

                }

            }
            group(NewHostel)
            {
                Caption = 'New Hostel Details';
                field(NewHostelName; rec.NewHostelName)
                {
                    ApplicationArea = All;
                    Caption = 'New Hostel Name';
                }
                field(NewRoomNo; rec.NewRoomNo)
                {
                    ApplicationArea = All;
                    Caption = 'New Room No';
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