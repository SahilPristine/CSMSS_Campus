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
                    LookupPageId = BatchList;
                }
                field(AcademicYear; rec.AcademicYear)
                {
                    ApplicationArea = All;
                    Caption = 'Academic Year';
                    LookupPageId = AcademicYearList;
                }
                field(CourseCode; rec.CourseCode)
                {
                    ApplicationArea = All;
                    Caption = 'Course Code';
                    LookupPageId = CourseList;

                }
                field(Class; rec.Class)
                {
                    ApplicationArea = All;
                    Caption = 'Class';
                    LookupPageId = ClassMasterList;
                }
                field(StreamCode; rec.StreamCode)
                {
                    ApplicationArea = All;
                    Caption = 'Stream Code';
                    LookupPageId = StreamList;

                }
                field(SemesterCode; rec.SemesterCode)
                {
                    ApplicationArea = All;
                    Caption = 'Semester Code';
                    LookupPageId = SemesterList;

                }
                field(ElementCode; rec.ElementCode)
                {
                    ApplicationArea = All;
                    Caption = 'Element Code';
                    LookupPageId = FeeStructureElements;

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
                    LookupPageId = AdmissionCategory;
                }
                field("Caste Code"; rec."Caste Code")
                {
                    ApplicationArea = All;
                    LookupPageId = CasteMaster;
                }
                field("Govt Code"; rec."Govt Code")
                {
                    ApplicationArea = All;
                    Caption = 'Govt Code';
                    trigger OnValidate()
                    begin
                        If rec."Govt Code" <> '' then
                            Enable := false
                        else
                            Enable := true;
                        CurrPage.Update(true);
                    end;
                }
                field(TotalAmount; rec.TotalAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Total Amount';
                }
                field(AmountByStudent; rec.AmountByStudent)
                {
                    ApplicationArea = All;
                    Caption = 'Amount By Student';
                }
                field(AmountByGovt; rec.AmountByGovt)
                {
                    ApplicationArea = All;
                    Enabled = Enable;
                    Caption = 'Amount By Govt';
                }

                field(DebitAcc; rec.DebitAcc)
                {
                    ApplicationArea = All;
                    Caption = 'Debit Account';
                    LookupPageId = "Chart of Accounts";

                }
                field(CreditAcc; rec.CreditAcc)
                {
                    ApplicationArea = All;
                    Caption = 'Credit Account';
                    LookupPageId = "Chart of Accounts";

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

        // CurrPage.Update(true);
    end;
}