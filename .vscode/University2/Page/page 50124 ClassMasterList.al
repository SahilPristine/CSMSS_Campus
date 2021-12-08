page 50124 ClassMasterList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 50124;
    Caption = 'Class Master';

    layout
    {
        area(Content)
        {
            Repeater(ClassList)
            {
                Caption = 'Class Master';
                field(CODE; rec.CODE)
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