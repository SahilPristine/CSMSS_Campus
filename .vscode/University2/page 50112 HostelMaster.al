page 50112 HostelList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = HostelMaster;
    AccessByPermission = page HostelList = X;

    layout
    {
        area(Content)
        {
            repeater(HostelMaster)
            {
                field(HostelCode; Rec.HostelCode)
                {
                    ApplicationArea = All;

                }
                field(HostelName; Rec.HostelName)
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