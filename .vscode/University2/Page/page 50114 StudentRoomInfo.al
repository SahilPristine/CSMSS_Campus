page 50114 StudentRoomInfo
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = RoomStudentinfo;
    AccessByPermission = page StudentRoomInfo = X;

    layout
    {
        area(Content)
        {
            group(RoomStudentInfo)
            {
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = All;

                }
                field(StudentCode; Rec.StudentCode)
                {
                    ApplicationArea = All;

                }
                field(HostelCode; Rec.HostelCode)
                {
                    ApplicationArea = All;

                }
                field(RoomCode; Rec.RoomCode)
                {
                    ApplicationArea = All;

                }
                field(AssignmentDate; Rec.AssignmentDate)
                {
                    ApplicationArea = All;

                }
                field(LeftDate; Rec.LeftDate)
                {
                    ApplicationArea = All;

                }
                field(Active; Rec.Active)
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