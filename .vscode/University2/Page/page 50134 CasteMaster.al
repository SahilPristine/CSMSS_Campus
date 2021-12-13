page 50134 CasteMaster
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CasteMaster;
    Caption = 'Caste Master';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Caste Code"; rec."Caste Code")
                {
                    ApplicationArea = All;

                }
                field(Description; rec.Description)
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