page 50127 AdmissionCategory
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 50127;
    Caption = 'Admission Category';

    layout
    {
        area(Content)
        {
            repeater(AdmissionCategory)
            {
                Caption = 'Admission Category';
                field(CategCode; rec.CategCode)
                {
                    ApplicationArea = All;
                    Caption = 'Category Code';

                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;

                }
                field(Caste; rec.Caste)
                {
                    ApplicationArea = All;
                    LookupPageId = 50134;
                }
                field(College; rec.College)
                {
                    ApplicationArea = All;

                }
                field(Batch; rec.Batch)
                {
                    ApplicationArea = All;

                }
                field(Course; rec.Course)
                {
                    ApplicationArea = All;

                }
                field(GovtCode; rec.GovtCode)
                {
                    ApplicationArea = All;
                    Caption = 'Govt Code';
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