page 50137 ChangeCategory
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(EnrollmentNo; rec."No.")
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
                field(OldCategory; rec.Category)
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
                field(OldCast; rec.Cast)
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
                    recStudent.SetRange("No.", rec."No.");
                    recStudent.SetRange(Category, rec.Category);
                    recStudent.SetRange(Cast, rec.Cast);
                    if recStudent.FindFirst() then begin
                        Message('Student found');
                        recFees.Reset();
                        recFees.SetRange(CategoryCode, rec.NewCategory);
                        recFees.SetRange("Caste Code", rec.NewCast);
                        if recFees.FindFirst() then begin
                            recStudent.Category := rec.NewCategory;
                            recStudent.Cast := rec.NewCast;
                            recStudent.Modify(true);
                            Message('Category changed Successfully');
                        end
                        else
                            Message('Create Fees Structure for new category first');
                    end
                    else
                        Message('Create Fees Structure');

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
        recStFees.SetRange(StudentEnrollmentNo, rec."No.");
        recStFees.SetRange(CategoryCode, rec.Category);
        recStFees.SetRange(CasteCode, rec.Cast);
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
        recStudent.SetRange("No.", rec."No.");
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