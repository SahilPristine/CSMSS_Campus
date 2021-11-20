page 50111 StudentFeeStructure
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentFeeStructure;
    AccessByPermission = page StudentFeeStructure = X;

    layout
    {
        area(Content)
        {

            repeater(StudentFeesStructure)
            {
                field(StudentID; Rec.StudentID)
                {
                    ApplicationArea = All;

                }
                field(StudentName; rec.StudentName)
                {
                    ApplicationArea = All;
                }
                field(CourseCode; Rec.CourseCode)
                {
                    ApplicationArea = All;

                }
                field(Stream; Rec.Stream)
                {
                    ApplicationArea = All;

                }
                field(Semester; Rec.Semester)
                {
                    ApplicationArea = All;

                }
                field(ElementCode; rec.ElementCode)
                {
                    ApplicationArea = All;

                }
                field(ElementType; rec.ElementType)
                {
                    ApplicationArea = All;

                }
                field(Period; rec.Period)
                {
                    ApplicationArea = All;

                }
                field(CalculationOrder; rec.CalculationOrder)
                {
                    ApplicationArea = All;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(CalculationType; rec.CalculationType)
                {
                    ApplicationArea = All;
                }
                field(DebitAcc; rec.DebitAcc)
                {
                    ApplicationArea = All;

                }
                field(CreditAcc; rec.CreditAcc)
                {
                    ApplicationArea = All;

                }
                field(DebitCreated; rec.DebitCreated)
                {
                    ApplicationArea = All;
                }
                field(DebitAmount; rec.DebitAmount)
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