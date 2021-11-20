page 50128 CourseWiseFeeStructure
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = 50128;

    layout
    {
        area(Content)
        {
            repeater(FeeStructure)
            {
                field(CourseCode; rec.CourseCode)
                {
                    ApplicationArea = All;

                }
                field(StreamCode; rec.StreamCode)
                {
                    ApplicationArea = All;

                }
                field(SemesterCode; rec.SemesterCode)
                {
                    ApplicationArea = All;

                }
                field(ElementCode; rec.ElementCode)
                {
                    ApplicationArea = All;

                }
                field(Description; rec.Description)
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
                field(DebitAcc; rec.DebitAcc)
                {
                    ApplicationArea = All;

                }
                field(CreditAcc; rec.CreditAcc)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}