page 50112 HostelList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = HostelMaster;
    AccessByPermission = page HostelList = X;
    Caption = 'Hostel Master';

    layout
    {
        area(Content)
        {
            repeater(HostelMaster)
            {
                Caption = 'Hostel Master';
                field(HostelCode; Rec.HostelCode)
                {
                    ApplicationArea = All;
                    Caption = 'Hostel Code';

                }
                field(HostelName; Rec.HostelName)
                {
                    ApplicationArea = All;

                    Caption = 'Hostel Name';

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