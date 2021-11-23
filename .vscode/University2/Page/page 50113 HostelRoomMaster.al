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
                field(HostelDesc; rec.HostelDesc)
                {
                    ApplicationArea = All;

                }
                field(RoomCode; rec.RoomCode)
                {
                    ApplicationArea = All;

                }
                field(Type; rec.Type)
                {
                    ApplicationArea = All;

                }
                field(Capacity; rec.Capacity)
                {
                    ApplicationArea = All;

                }
                field(Beds; rec.Beds)
                {
                    ApplicationArea = All;

                }
                field(PerBedFees; rec.PerBedFees)
                {
                    ApplicationArea = All;
                }
                field(Floor; rec.Floor)
                {
                    ApplicationArea = All;

                }
                field(Wings; rec.Wings)
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