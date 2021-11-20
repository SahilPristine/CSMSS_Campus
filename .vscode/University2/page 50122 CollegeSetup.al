page 50122 CollegeSetup
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 50122;

    layout
    {
        area(Content)
        {
            Repeater(CollegeSetup)
            {
                field(College; Rec.College)
                {
                    ApplicationArea = All;

                }
                field(HostelRegistrationNo; rec.HostelRegistrationNo)
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