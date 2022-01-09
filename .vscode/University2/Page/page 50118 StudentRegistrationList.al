page 50118 StudentRegistrationList
{
    PageType = List;
    CardPageId = 50117;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentRegistration;
    Caption = 'Student Registration';

    layout
    {
        area(Content)
        {
            repeater(StudentList)
            {
                Caption = 'Students';
                field(EnrollStudent; rec.EnrollStudent)
                {
                    ApplicationArea = All;
                    Caption = 'Enroll Student';
                }
                field(StudentCode; rec."Registration No")
                {
                    ApplicationArea = All;
                    Caption = 'Student Code';

                }
                field("First Name"; rec."First Name")
                {
                    ApplicationArea = All;
                    Caption = 'First Name';
                }
                field("Last Name"; rec."Last Name")
                {
                    ApplicationArea = All;
                    Caption = 'Last Name';
                }
                field(AcademicYear; rec.AcademicYear)
                {
                    ApplicationArea = All;
                    Caption = 'Academic Year';

                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Enroll)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Enroll Students';
                Image = Entry;

                trigger OnAction()
                begin
                    // Rec.Reset();
                    // Rec.SetRange(EnrollStudent, true);
                    // Rec.SetRange("Enrollment No", ' ');
                    // if recStudReg.FindSet() then begin
                    //     repeat
                    // rec.TestField("Batch Code");
                    // rec.TestField(Class);
                    // rec.TestField("Course Code");
                    CreateStudentMaster();
                    CreateFeesStructure();
                    CurrPage.Update(true);
                    //     until Rec.Next() = 0;
                    // end;
                end;

            }
        }
    }

    var
        recStudReg: Record StudentRegistration;
        recSalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        recFees: Record CourseWiseFeeStructure;
        recStudent: Record Customer;
        recStFees: Record StudentFeeStructure;
        CustRec: Record Customer;


    procedure CreateFeesStructure()
    begin
        Rec.Reset();
        Rec.SetRange(EnrollStudent, true);
        if Rec.FindFirst() then begin
            repeat
                // Message('Hellloo');
                recStudent.Reset();
                recStudent.SetRange("No.", Rec."Enrollment No");
                if recStudent.FindFirst() then begin
                    repeat
                        // Message('Hi');
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
                                recStFees.AcademicYear := recStudent.AcademicYear;
                                recStFees.Class := recStudent.Class;
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
                        Message('Fees Structure Created');
                    until recStudent.Next() = 0;
                end;
            until Rec.Next() = 0;
        end;
    end;

    procedure CreateStudentMaster()
    var
        Question: Text;
        Answer: Boolean;
        Text000: Label 'Do you want to confirm enrollment?';
    begin
        // recFees.Reset();
        // recFees.Setrange(BatchCode, recStudReg."Batch Code");
        // recFees.SetRange(AcademicYear, recStudReg.AcademicYear);
        // recFees.SetRange(CourseCode, recStudReg."Course Code");
        // recFees.SetRange(StreamCode, recStudReg."Stream Code");
        // recFees.SetRange(SemesterCode, recStudReg."Semester Code");
        // recFees.SetRange(CategoryCode, recStudReg.Category);
        // recFees.SetRange("Caste Code", recStudReg.Cast);
        // if recFees.FindFirst() then begin
        Rec.Reset();
        Rec.SetRange(EnrollStudent, true);
        if Rec.FindFirst() then begin
            repeat
                // Message('Hello');
                recStudReg.SetRange("Batch Code", recFees.BatchCode);
                recStudReg.SetRange(AcademicYear, recFees.AcademicYear);
                recStudReg.SetRange("Course Code", recFees.CourseCode);
                recStudReg.SetRange("Stream Code", recFees.StreamCode);
                recStudReg.SetRange("Semester Code", recFees.SemesterCode);
                recStudReg.SetRange(Category, recFees.CategoryCode);
                recStudReg.SetRange(Cast, recFees."Caste Code");
                if recStudReg.FindFirst() then begin
                    // Message('Hello2');
                    Question := Text000;
                    Answer := Dialog.Confirm(Question, true);
                    if Answer = true then begin
                        recSalesSetup.get();
                        Rec."Enrollment No" := NoSeriesMgt.GetNextNo(recSalesSetup."Customer Nos.", Today, true);
                        rec.Modify(true);

                        // CustRec.Init();
                        CustRec."No." := Rec."Enrollment No";
                        CustRec.Name := Rec."First Name";
                        CustRec."Name 2" := Rec."Last Name";
                        CustRec.DOB := Rec.DOB;
                        CustRec."Birth Place" := Rec."Birth Place";
                        CustRec.Gender := Rec.Gender;
                        CustRec.Category := Rec.Category;
                        CustRec.Cast := Rec.Cast;
                        CustRec.Religion := Rec.Religion;
                        CustRec.Nationality := Rec.Nationality;
                        CustRec."Aadhar No" := Rec."Aadhar No";
                        CustRec."Admission Quota" := Rec."Admission Quota";
                        CustRec."Qualifying Exam Details" := Rec."Qualifying Exam Details";
                        CustRec.Address := Rec."Permanent Address 1";
                        CustRec."Address 2" := Rec."Permanent Address 2";
                        CustRec.State := Rec.State;
                        CustRec."Pin Code" := Rec."Pin Code";
                        CustRec."Country/Region Code" := Rec."Country Code";
                        CustRec."Local Address 1" := Rec."Local Address 1";
                        CustRec."Local Address 2" := Rec."Local Address 2";
                        CustRec.State2 := Rec.State2;
                        CustRec."Post Code" := Rec."Pin Code2";
                        CustRec."Country Code" := Rec."Country Code2";
                        CustRec."Phone No." := Rec."Phone No";
                        CustRec."E-Mail" := Rec."Email ID";
                        CustRec."Father's First Name" := Rec."Father's First Name";
                        CustRec."Father's Last Name" := Rec."Father's Last Name";
                        CustRec."Father's Contact No" := Rec."Father's Contact No";
                        CustRec."Father's Email ID" := Rec."Father's Email ID";
                        CustRec."Mother's First Name" := Rec."Mother's First Name";
                        CustRec."Mother's Last Name" := Rec."Mother's Last Name";
                        CustRec."Mother's Contact No" := Rec."Mother's Contact No";
                        CustRec."Mother's Email ID" := Rec."Mother's Email ID";
                        CustRec."Batch Code" := Rec."Batch Code";
                        Custrec.AcademicYear := Rec.AcademicYear;
                        CustRec."Course Code" := Rec."Course Code";
                        CustRec."Semester Code" := Rec."Semester Code";
                        CustRec."Stream Code" := Rec."Stream Code";
                        CustRec.Class := Rec.Class;
                        CustRec."Bank Name" := Rec."Bank Name";
                        CustRec."Branch Name" := Rec."Branch Name";
                        CustRec."IFSC Code" := Rec."IFSC Code";
                        CustRec."Bank Account No" := Rec."Bank Account No";
                        CustRec."Application Method" := Rec."Application Method"::"Apply to Oldest";
                        CustRec.Type := Rec.Type::Student;
                        CustRec.Hostel := Rec.Hostel;
                        CustRec.RoomType := Rec.RoomType;
                        CustRec.BedType := Rec.BedType;
                        CustRec.HostelCode := Rec.HostelCode;
                        CustRec.RoomNo := Rec.RoomNo;
                        CustRec.Transport := Rec.Transport;
                        CustRec.RouteNo := Rec.RoomNo;
                        CustRec.Charge := Rec.Charge;

                        CustRec.Insert(true);

                    end;
                end
                else
                    Message('Create Fees Structure First');
            until Rec.Next() = 0;
        end;
    end;

}