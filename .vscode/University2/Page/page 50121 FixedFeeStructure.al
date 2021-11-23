page 50121 FixedFeeStructure
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 50121;

    layout
    {
        area(Content)
        {
            group(FeesStructure)
            {
                field(CourseCode; rec.CourseCode)
                {
                    ApplicationArea = All;

                }
                field(SemesterCode; rec.SemesterCode)
                {
                    ApplicationArea = All;

                }
                field(StreamCode; rec.StreamCode)
                {
                    ApplicationArea = All;

                }
                field(Element; rec.Element)
                {
                    ApplicationArea = All;

                }
                field(TotalFeesAmount; rec.TotalFeesAmount)
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