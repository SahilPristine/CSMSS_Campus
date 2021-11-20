page 50120 StudentHistory
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 50120;

    layout
    {
        area(Content)
        {
            group(StudentHistory)
            {
                field(StudentID; rec.StudentID)
                {
                    ApplicationArea = All;

                }
                field(LineNo; rec.LineNo)
                {
                    ApplicationArea = All;

                }
                field("College/Board"; rec."College/Board")
                {
                    ApplicationArea = All;

                }

                field(Course; rec.Course)
                {
                    ApplicationArea = All;

                }
                field(SubCourse; rec.SubCourse)
                {
                    ApplicationArea = All;

                }
                field(Subject; rec.Subject)
                {
                    ApplicationArea = All;

                }
                field("Marks%"; rec."Marks%")
                {
                    ApplicationArea = All;

                }
                field(HistoryType; rec.HistoryType)
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