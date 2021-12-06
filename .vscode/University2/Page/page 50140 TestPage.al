page 50140 TestPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 50130;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(CustomerName; rec.CustomerName)
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
            action(TestButton)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    // Codeunit.Run(Codeunit::TestFunction)
                end;
            }
        }
    }

    var
        myInt: Integer;

}