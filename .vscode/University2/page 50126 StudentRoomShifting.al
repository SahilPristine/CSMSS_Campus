page 50126 StudentRoomShifting
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 50126;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(RegistrationNo; Rec.RegistrationNo)
                {
                    ApplicationArea = All;

                }
                field(ShiftingNo; rec.ShiftingNo)
                {
                    ApplicationArea = All;
                }
                field(StudentCode; Rec.StudentCode)
                {
                    ApplicationArea = All;

                }
                field(RegistrationDate; Rec.RegistrationDate)
                {
                    ApplicationArea = All;

                }
                field(CollegeName; Rec.CollegeName)
                {
                    ApplicationArea = All;

                }
            }
            group(StudentDetails)
            {
                field(StudentName; Rec.StudentName)
                {
                    ApplicationArea = All;

                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;

                }
                field(Address2; rec.Address2)
                {
                    ApplicationArea = All;
                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = All;

                }
                field(ContactNo; Rec.ContactNo)
                {
                    ApplicationArea = All;

                }
                field(HostelName; Rec.HostelName)
                {
                    ApplicationArea = All;

                }
                field(RoomNo; Rec.RoomNo)
                {
                    ApplicationArea = All;

                }

            }
            group(NewHostel)
            {
                field(NewHostelName; rec.NewHostelName)
                {
                    ApplicationArea = All;
                }
                field(NewRoomNo; rec.NewRoomNo)
                {
                    ApplicationArea = All;
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