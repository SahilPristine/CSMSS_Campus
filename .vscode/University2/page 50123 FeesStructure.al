page 50123 FeesStrructure
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 50123;

    layout
    {
        area(Content)
        {
            repeater(FeesStructure)
            {
                field("CourseCode"; Rec.CourseCode)
                {
                    ApplicationArea = All;

                }
                field("Stream"; Rec.Stream)
                {
                    ApplicationArea = All;

                }
                field("Semester"; Rec.Semester)
                {
                    ApplicationArea = All;

                }
                field("Elements"; Rec.Elements)
                {
                    ApplicationArea = All;

                }
                field("AmountType"; Rec.AmountType)
                {
                    ApplicationArea = All;

                }
                field("Amount"; Rec.Amount)
                {
                    ApplicationArea = All;

                }
                field("DebitAcc"; Rec.DebitAcc)
                {
                    ApplicationArea = All;

                }
                field("CreditAcc"; Rec.CreditAcc)
                {
                    ApplicationArea = All;

                }
                field("Category"; Rec.Category)
                {
                    ApplicationArea = All;

                }
                field("AdmissionCategory"; Rec.CourseCode)
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