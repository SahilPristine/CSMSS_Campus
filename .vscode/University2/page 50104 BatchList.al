page 50104 BatchList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BatchMasterTable;
    SaveValues = true;

    layout
    {
        area(Content)
        {
            Repeater(BatchList)
            {
                field("CODE"; Rec.CODE)
                {
                    ApplicationArea = All;
                    NotBlank = true;

                }

                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    NotBlank = true;
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