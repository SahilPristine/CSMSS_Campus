page 50111 StudentFeeStructure
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentFeeStructure;
    AccessByPermission = page StudentFeeStructure = X;
    Caption = 'Student Fees Sructure';

    layout
    {
        area(Content)
        {

            repeater(StudentFeesStructure)
            {
                Caption = 'Student Fees Structure';
                field(StudentID; Rec.StudentID)
                {
                    ApplicationArea = All;
                    Caption = 'Student Code';

                }
                field(StudentName; rec.StudentName)
                {
                    ApplicationArea = All;
                    Caption = 'Student Name';
                }
                field(CourseCode; Rec.CourseCode)
                {
                    ApplicationArea = All;
                    Caption = 'Course Code';

                }
                field(Stream; Rec.Stream)
                {
                    ApplicationArea = All;
                    Caption = 'Stream';

                }
                field(Semester; Rec.Semester)
                {
                    ApplicationArea = All;
                    Caption = 'Semester';

                }
                field(BatchCode; rec.BatchCode)
                {
                    ApplicationArea = All;
                    Caption = 'Batch Code';
                }
                field(CategoryCode; rec.CategoryCode)
                {
                    ApplicationArea = All;
                    Caption = 'Category Code';
                }
                field(ElementCode; rec.ElementCode)
                {
                    ApplicationArea = All;
                    Caption = 'Element Code';

                }
                field(ElementType; rec.ElementType)
                {
                    ApplicationArea = All;
                    Caption = 'Element Type';

                }
                // field(Period; rec.Period)
                // {
                //     ApplicationArea = All;

                // }
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
                    Caption = 'Debit Account';

                }
                field(CreditAcc; rec.CreditAcc)
                {
                    ApplicationArea = All;
                    Caption = 'Credit Account';

                }
                field(DebitCreated; rec.DebitCreated)
                {
                    ApplicationArea = All;
                }
                field(DebitAmount; rec.DebitAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Debit Amount';
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