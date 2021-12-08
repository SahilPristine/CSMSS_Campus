page 50129 RouteMaster
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = RouteMaster;
    Caption = 'Route Master';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                Caption = 'Route Master';
                field(RouteNo; rec.RouteNo)
                {
                    ApplicationArea = All;
                    Caption = 'Route No';

                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Charge; rec.Charge)
                {
                    ApplicationArea = All;
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}