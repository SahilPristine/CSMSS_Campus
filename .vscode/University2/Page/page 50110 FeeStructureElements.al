page 50110 FeeStructureElements
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = FeeStructureElements;
    AccessByPermission = page FeeStructureElements = X;
    Caption = 'Fees Structure Elements';

    layout
    {
        area(Content)
        {
            repeater(FeeStructure)
            {
                Caption = 'Fees Structure';
                field(Elements; rec.ElementCode)
                {
                    ApplicationArea = All;
                    Caption = 'Element Code';

                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Element Description';
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