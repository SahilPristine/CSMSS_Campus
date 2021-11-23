page 50107 SemesterList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = SemesterMasterTable;
    AccessByPermission = page SemesterList = X;

    layout
    {
        area(Content)
        {
            repeater(SemesterMaster)
            {
                field(CourseCode; Rec.CourseCode)
                {
                    ApplicationArea = All;

                }
                field(StreamCode; Rec.StreamCode)
                {
                    ApplicationArea = All;

                }
                field(SemesterCode; Rec.SemesterCode)
                {
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
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