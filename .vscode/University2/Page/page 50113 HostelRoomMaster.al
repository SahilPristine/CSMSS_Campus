page 50113 HostelRoomList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = RoomMaster;
    AccessByPermission = page HostelRoomList = X;

    layout
    {
        area(Content)
        {
            repeater(HostelRoomList)
            {
                field(HostelCode; rec.HostelCode)
                {
                    ApplicationArea = All;
                    TableRelation = HostelMaster;

                }
                field(RoomCode; rec.RoomCode)
                {
                    ApplicationArea = All;

                }
                field(RoomDesc; rec.RoomDesc)
                {
                    ApplicationArea = All;
                }
                field(RoomType; rec.RoomType)
                {
                    ApplicationArea = All;

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