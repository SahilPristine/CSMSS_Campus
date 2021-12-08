page 50125 StudentClassAllotment
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 50125;
    Caption = 'Student Promotion';

    layout
    {
        area(Content)
        {
            group(ClassAllotment)
            {
                field(StudentCode; rec.StudentCode)
                {
                    ApplicationArea = All;
                    Caption = 'Student Code';

                }
                field(AcademicYear; rec.AcademicYear)
                {
                    ApplicationArea = All;
                    Caption = 'Academic Year';

                }
                field(YearBegin; rec.YearBegin)
                {
                    ApplicationArea = All;
                    Caption = 'Year Begin';

                }
                field(YearEnd; rec.YearEnd)
                {
                    ApplicationArea = All;
                    Caption = 'Year End';

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