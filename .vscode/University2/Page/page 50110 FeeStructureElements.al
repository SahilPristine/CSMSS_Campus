page 50110 FeeStructureElements
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = FeeStructureElements;
    AccessByPermission = page FeeStructureElements = X;

    layout
    {
        area(Content)
        {
            repeater(FeeStructure)
            {
                field(Elements; rec.ElementCode)
                {
                    ApplicationArea = All;

                }
                field(Description; rec.Description)
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