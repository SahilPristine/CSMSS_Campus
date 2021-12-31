page 50128 CourseWiseFeeStructure
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = 50128;
    Caption = 'Course Wise Fees Structure';

    layout
    {
        area(Content)
        {
            repeater(FeeStructure)
            {
                Caption = 'Fees Structure';

                field(BatchCode; rec.BatchCode)
                {
                    ApplicationArea = All;
                    Caption = 'Batch Code';
                }
                field(AcademicYear; rec.AcademicYear)
                {
                    ApplicationArea = All;
                }
                field(CourseCode; rec.CourseCode)
                {
                    ApplicationArea = All;
                    Caption = 'Course Code';

                }
                field(StreamCode; rec.StreamCode)
                {
                    ApplicationArea = All;
                    Caption = 'Stream Code';

                }
                field(SemesterCode; rec.SemesterCode)
                {
                    ApplicationArea = All;
                    Caption = 'Semester Code';

                }
                field(ElementCode; rec.ElementCode)
                {
                    ApplicationArea = All;
                    Caption = 'Element Code';

                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Element Desc';
                }

                field(Period; rec.Period)
                {
                    ApplicationArea = All;

                }

                field(CategoryCode; rec.CategoryCode)
                {
                    ApplicationArea = All;
                    Caption = 'Category Code';
                }
                field("Caste Code"; rec."Caste Code")
                {
                    ApplicationArea = All;
                }
                field("Govt Code"; rec."Govt Code")
                {
                    ApplicationArea = All;
                    Caption = 'Govt Code';
                    trigger OnValidate()
                    begin
                        If rec."Govt Code" <> '' then
                            Enable := true
                        else
                            Enable := false;
                        CurrPage.Update(true);
                    end;
                }
                field(AmountByStudent; rec.AmountByStudent)
                {
                    ApplicationArea = All;
                }
                field(AmountByGovt; rec.AmountByGovt)
                {
                    ApplicationArea = All;
                    Enabled = Enable;
                    trigger OnValidate()
                    begin
                        If rec."Govt Code" <> '' then
                            Enable := true
                        else
                            Enable := false;
                        CurrPage.Update(true);
                    end;
                }
                field(TotalAmount; rec.TotalAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Total Amount';
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
                field(DueDate; rec.DueDate)
                {
                    ApplicationArea = All;
                    Caption = 'Due Date';
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
    var
        Enable: Boolean;

    trigger OnAfterGetRecord()
    begin
        If rec."Govt Code" <> '' then
            Enable := true
        else
            Enable := false;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        If rec."Govt Code" <> '' then
            Enable := true
        else
            Enable := false;

        CurrPage.Update(true);
    end;
}