page 50113 HostelRoomList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = RoomMaster;
    AccessByPermission = page HostelRoomList = X;
    Caption = 'Room Master';

    layout
    {
        area(Content)
        {
            repeater(HostelRoomList)
            {
                Caption = 'Room Master';
                field(HostelCode; rec.HostelCode)
                {
                    ApplicationArea = All;
                    TableRelation = HostelMaster;
                    Caption = 'Hostel Code';

                }
                field(RoomCode; rec.RoomCode)
                {
                    ApplicationArea = All;
                    Caption = 'Room Code';

                }
                field(RoomDesc; rec.RoomDesc)
                {
                    ApplicationArea = All;
                    Caption = 'Room Description';
                }
                field(RoomType; rec.RoomType)
                {
                    ApplicationArea = All;
                    Caption = 'Room Type';

                }
                field(Beds; rec.Beds)
                {
                    ApplicationArea = All;
                    Caption = 'No Of Beds';

                }
                // field(PerBedFees; rec.PerBedFees)
                // {
                //     ApplicationArea = All;
                // }
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