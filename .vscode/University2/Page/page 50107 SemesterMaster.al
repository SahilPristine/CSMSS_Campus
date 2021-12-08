page 50107 SemesterList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = SemesterMasterTable;
    AccessByPermission = page SemesterList = X;
    Caption = 'Semester Master';

    layout
    {
        area(Content)
        {
            repeater(SemesterMaster)
            {
                Caption = 'Semester Master';
                field(CourseCode; Rec.CourseCode)
                {
                    ApplicationArea = All;
                    caption = 'Course Code';

                }
                field(StreamCode; Rec.StreamCode)
                {
                    ApplicationArea = All;
                    Caption = 'Stream Code';

                }
                field(SemesterCode; Rec.SemesterCode)
                {
                    ApplicationArea = All;
                    Caption = 'Semester Code';

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';

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