page 50125 StudentClassAllotment
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 50125;

    layout
    {
        area(Content)
        {
            group(ClassAllotment)
            {
                field(StudentCode; rec.StudentCode)
                {
                    ApplicationArea = All;

                }
                field(AcademicYear; rec.AcademicYear)
                {
                    ApplicationArea = All;

                }
                field(YearBegin; rec.YearBegin)
                {
                    ApplicationArea = All;

                }
                field(YearEnd; rec.YearEnd)
                {
                    ApplicationArea = All;

                }
                field(Class; rec.Class)
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