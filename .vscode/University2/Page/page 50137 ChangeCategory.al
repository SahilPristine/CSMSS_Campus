page 50137 ChangeCategory
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 50134;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(EnrollmentNo; rec.EnrollmentNo)
                {
                    ApplicationArea = All;
                    Caption = 'Enrollment No';

                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                }
            }
            group(Category)
            {
                field(OldCategory; rec.OldCategory)
                {
                    ApplicationArea = All;
                    Caption = 'Old Category';

                }
                field(NewCategory; rec.NewCategory)
                {
                    ApplicationArea = All;
                    Caption = 'New Category';

                }
            }
            group(Cast)
            {
                field(OldCast; rec.OldCast)
                {
                    ApplicationArea = All;
                    Caption = 'Old Cast';

                }
                field(NewCast; rec.NewCast)
                {
                    ApplicationArea = All;
                    Caption = 'New Cast';

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Change)
            {
                ApplicationArea = All;
                Image = Change;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Change';

                trigger OnAction()
                begin
                    recStudent.Reset();
                    recStudent.SetRange("No.", rec.EnrollmentNo);
                    recStudent.SetRange(Category, rec.OldCategory);
                    recStudent.SetRange(Cast, rec.OldCast);
                    if recStudent.FindFirst() then begin
                        Message('Student found');
                        recStudent.Category := rec.NewCategory;
                        recStudent.Cast := rec.NewCast;
                        recStudent.Modify(true);
                        Message('Category changed Successfully');
                    end;

                    CreateNewFeesStructure(recStFees, recFees, recChangeCat)

                end;
            }
        }
    }

    var
        recStudent: Record Customer;
        recChangeCat: Record Change_Category_Cast;
        recStFees: Record StudentFeeStructure;
        recFees: Record CourseWiseFeeStructure;

    procedure CreateNewFeesStructure(recStFees: Record StudentFeeStructure; recFees: Record CourseWiseFeeStructure; recChangeCat: Record Change_Category_Cast)
    begin
        recStFees.Reset();
        recStFees.SetRange(StudentEnrollmentNo, rec.EnrollmentNo);
        recStFees.SetRange(CategoryCode, rec.OldCategory);
        recStFees.SetRange(CasteCode, rec.OldCast);
        if recStFees.FindFirst() then begin
            repeat
                recStFees.Blocked := true;
                recStFees.Modify(true);
                CurrPage.Update(true);
            until recStFees.Next() = 0

        end
        else
            recStFees.Blocked := false;
        CurrPage.Update(true);

        recStudent.Reset();
        recStudent.SetRange("No.", rec.EnrollmentNo);
        if recStudent.FindFirst() then begin
            recFees.Reset();
            recFees.Setrange(BatchCode, recStudent."Batch Code");
            recFees.SetRange(AcademicYear, recStudent.AcademicYear);
            recFees.SetRange(CourseCode, recStudent."Course Code");
            recFees.SetRange(StreamCode, recStudent."Stream Code");
            recFees.SetRange(SemesterCode, recStudent."Semester Code");
            recFees.SetRange(CategoryCode, recStudent.Category);
            recFees.SetRange("Caste Code", recStudent.Cast);
            if recFees.FindFirst() then begin
                repeat
                    recStFees.Init();
                    recStFees.StudentEnrollmentNo := recStudent."No.";
                    recStFees.StudentName := recStudent.Name + ' ' + recStudent."Name 2";
                    recStFees.CourseCode := recStudent."Course Code";
                    recStFees.Stream := recStudent."Stream Code";
                    recStFees.Semester := recStudent."Semester Code";
                    recStFees.BatchCode := recStudent."Batch Code";
                    recStFees.CategoryCode := recStudent.Category;
                    recStFees.CasteCode := recStudent.Cast;
                    recStFees.ElementCode := recFees.ElementCode;
                    recStFees.GovtCode := recFees."Govt Code";
                    recStFees.AmountByStudent := recFees.AmountByStudent;
                    recStFees.GovtAmount := recFees.AmountByGovt;
                    recStFees.TotalAmount := recFees.TotalAmount;
                    recStFees.DebitAcc := recFees.DebitAcc;
                    recStFees.CreditAcc := recFees.CreditAcc;
                    recStFees.Insert(true);
                until
                recFees.Next() = 0;
            end;
        end;
    end;

}