page 50115 HostelRegistration
{
    PageType = Card;
    Caption = 'Hostel Registration';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = HostelRegistration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Registeration Details';
                field(RegistrationNo; Rec.RegistrationNo)
                {
                    ApplicationArea = All;
                    Caption = 'Registeration No';

                }
                field(RegType; Rec.RegType)
                {
                    ApplicationArea = All;
                    Caption = 'Registration Type';
                    trigger OnValidate()
                    begin
                        if rec.RegType = rec.RegType::Student then
                            EditStudent := true
                        else
                            EditStudent := false;
                        if rec.RegType = rec.RegType::Others then
                            EditVisitor := true
                        else
                            EditVisitor := false;
                        CurrPage.Update(true);
                    end;
                }
                field(StudentEnrollmentNo; Rec.StudentEnrollmentNo)
                {
                    ApplicationArea = All;
                    Caption = 'Student Enrollment No';
                    LookupPageId = 50136;
                    Enabled = EditStudent;
                }
                field(VisitorNo; rec.VisitorNo)
                {
                    ApplicationArea = All;
                    Caption = 'Visitor Reg No';
                    LookupPageId = 50140;
                    Enabled = EditVisitor;
                }

                field(RegistrationDate; Rec.RegistrationDate)
                {
                    ApplicationArea = All;
                    Caption = 'Registeration Date';

                }
                field(CollegeName; Rec.CollegeName)
                {
                    ApplicationArea = All;
                    Caption = 'College Name';

                }
            }
            group(Details)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';

                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    Caption = 'Address Line 1';

                }
                field(Address2; rec.Address2)
                {
                    ApplicationArea = All;
                    Caption = 'Address Line 2';
                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = All;
                    Caption = 'Class';

                }
                field(ContactNo; Rec.ContactNo)
                {
                    ApplicationArea = All;
                    Caption = 'Contact No';

                }
            }
            group(Registration)
            {
                Caption = 'Hostel Details';

                field(HostelCode; Rec.HostelCode)
                {
                    ApplicationArea = All;
                    Caption = 'Hostel Code';
                    LookupPageId = HostelList;

                }
                field(HostelName; Rec.HostelName)
                {
                    ApplicationArea = All;
                    Caption = 'Hostel Name';
                }
                field(RoomNo; Rec.RoomNo)
                {
                    ApplicationArea = All;
                    TableRelation = RoomMaster where(HostelCode = field(HostelCode));
                    LookupPageId = HostelRoomList;
                    Caption = 'Room No';
                    trigger OnValidate()
                    begin
                        recRoom.Reset();
                        recRoom.SetRange(RoomCode, rec.RoomNo);
                        recRoom.SetRange(HostelCode, Rec.HostelCode);
                        if recRoom.FindFirst() then begin
                            rec.HostelFees := recRoom.PerBedFees;
                        end;

                    end;

                }
                field(HostelFees; Rec.HostelFees)
                {
                    ApplicationArea = All;
                    Caption = 'Hostel Fees';

                }
                field(DepositFees; Rec.DepositFees)
                {
                    ApplicationArea = All;
                    Caption = 'Deposit Fees';

                }
                field(Left; rec.Left)
                {
                    ApplicationArea = All;
                    Caption = 'Left';
                }
                field(LeftDate; Rec.LeftDate)
                {
                    ApplicationArea = All;
                    Caption = 'Left Date';

                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Confirm)
            {
                ApplicationArea = All;
                Caption = 'Confirm';
                Promoted = true;
                PromotedCategory = Process;
                Image = Confirm;

                trigger OnAction()
                begin

                    CreateHostelFees(recRoom, recStFees, recStudent);
                end;
            }
        }
    }

    var
        recRoom: Record RoomMaster;
        [InDataSet]
        EditStudent: Boolean;
        [InDataSet]
        EditVisitor: Boolean;
        recStFees: Record StudentFeeStructure;
        recFees: Record CourseWiseFeeStructure;
        recStudent: record Customer;
        SalesSetup: Record "Sales & Receivables Setup";


    trigger OnAfterGetRecord()
    begin
        if rec.RegType = rec.RegType::Student then
            EditStudent := true
        else
            EditStudent := false;
        if rec.RegType = rec.RegType::Others then
            EditVisitor := true
        else
            EditVisitor := false;
    end;

    // procedure CreateFeesStructure(recStFees: Record StudentFeeStructure; recFees: Record CourseWiseFeeStructure; recStudent: record Customer)
    // begin
    //     recStudent.Reset();
    //     recStudent.SetRange("No.", rec.StudentEnrollmentNo);
    //     if recStudent.FindFirst() then begin
    //         recFees.Reset();
    //         recFees.Setrange(BatchCode, recStudent."Batch Code");
    //         recFees.SetRange(AcademicYear, recStudent.AcademicYear);
    //         recFees.SetRange(CourseCode, recStudent."Course Code");
    //         recFees.SetRange(StreamCode, recStudent."Stream Code");
    //         // recFees.SetRange(SemesterCode, recStudent."Semester Code");
    //         // recFees.SetRange(CategoryCode, recStudent.Category);
    //         // recFees.SetRange("Caste Code", recStudent.Cast);
    //         if recFees.FindFirst() then begin
    //             repeat
    //                 recStFees.Init();
    //                 recStFees.StudentEnrollmentNo := recStudent."No.";
    // recStFees.StudentName := recStudent.Name + ' ' + recStudent."Name 2";
    // recStFees.CourseCode := recStudent."Course Code";
    // recStFees.Stream := recStudent."Stream Code";
    // recStFees.Semester := recStudent."Semester Code";
    // recStFees.BatchCode := recStudent."Batch Code";
    // recStFees.AcademicYear := recStudent.AcademicYear;
    // recStFees.Class := recStudent.Class;
    // recStFees.CategoryCode := recStudent.Category;
    // recStFees.CasteCode := recStudent.Cast;
    //                 recStFees.ElementCode := recFees.ElementCode;
    //                 // recStFees.GovtCode := recFees."Govt Code";
    //                 recStFees.AmountByStudent := recFees.AmountByStudent;
    //                 // recStFees.GovtAmount := recFees.AmountByGovt;
    //                 recStFees.TotalAmount := recFees.TotalAmount;
    //                 recStFees.DebitAcc := recFees.DebitAcc;
    //                 recStFees.CreditAcc := recFees.CreditAcc;
    //                 recStFees.Insert(true);
    //             until
    //             recFees.Next() = 0;

    //         end;
    //         Message('Fees Structure Created');
    //     end;

    //     recStudent.Reset();
    //     recStudent.SetRange("No.", rec.VisitorNo);
    //     if recStudent.FindFirst() then begin
    //         recFees.Reset();
    //         recFees.Setrange(BatchCode, recStudent."Batch Code");
    //         recFees.SetRange(AcademicYear, recStudent.AcademicYear);
    //         recFees.SetRange(CourseCode, recStudent."Course Code");
    //         recFees.SetRange(StreamCode, recStudent."Stream Code");
    //         recFees.SetRange(SemesterCode, recStudent."Semester Code");
    //         recFees.SetRange(CategoryCode, recStudent.Category);
    //         recFees.SetRange("Caste Code", recStudent.Cast);
    //         if recFees.FindFirst() then begin
    //             repeat
    //                 recStFees.Init();
    //                 recStFees.StudentEnrollmentNo := recStudent."No.";
    //                 recStFees.StudentName := recStudent.Name + ' ' + recStudent."Name 2";
    //                 recStFees.CourseCode := recStudent."Course Code";
    //                 recStFees.Stream := recStudent."Stream Code";
    //                 recStFees.Semester := recStudent."Semester Code";
    //                 recStFees.BatchCode := recStudent."Batch Code";
    //                 recStFees.AcademicYear := recStudent.AcademicYear;
    //                 recStFees.Class := recStudent.Class;
    //                 recStFees.CategoryCode := recStudent.Category;
    //                 recStFees.CasteCode := recStudent.Cast;
    //                 recStFees.ElementCode := recFees.ElementCode;
    //                 recStFees.GovtCode := recFees."Govt Code";
    //                 recStFees.AmountByStudent := recFees.AmountByStudent;
    //                 recStFees.GovtAmount := recFees.AmountByGovt;
    //                 recStFees.TotalAmount := recFees.TotalAmount;
    //                 recStFees.DebitAcc := recFees.DebitAcc;
    //                 recStFees.CreditAcc := recFees.CreditAcc;
    //                 recStFees.Insert(true);
    //             until
    //             recFees.Next() = 0;

    //         end;
    //         Message('Fees Structure Created');
    //     end;
    // end;

    procedure CreateHostelFees(recRoom: Record RoomMaster; recStFees: Record StudentFeeStructure; recStudent: record Customer)
    begin

        recRoom.Reset();
        recRoom.SetRange(RoomCode, Rec.RoomNo);
        if recRoom.FindFirst() then begin
            recStudent.SetRange("No.", Rec.StudentEnrollmentNo);
            if recStudent.FindFirst() then begin
                Message('Hello');
                recStFees.Init();
                recStFees.StudentEnrollmentNo := Rec.StudentEnrollmentNo;
                recStFees.StudentName := Rec.Name;
                recStFees.CourseCode := recStudent."Course Code";
                recStFees.Stream := recStudent."Stream Code";
                recStFees.Semester := recStudent."Semester Code";
                recStFees.BatchCode := recStudent."Batch Code";
                recStFees.AcademicYear := recStudent.AcademicYear;
                recStFees.Class := recStudent.Class;
                recStFees.CategoryCode := recStudent.Category;
                recStFees.CasteCode := recStudent.Cast;
                SalesSetup.Get();
                recStFees.ElementCode := SalesSetup.DefaultHostelElement;
                recStFees.AmountByStudent := rec.HostelFees;
                recStFees.TotalAmount := recStFees.AmountByStudent;
                recStFees.Insert(true);
            end;
        end;

        recRoom.Reset();
        recRoom.SetRange(RoomCode, Rec.RoomNo);
        if recRoom.FindFirst() then begin
            recStudent.SetRange("No.", Rec.StudentEnrollmentNo);
            if recStudent.FindFirst() then begin
                recStFees.Init();
                recStFees.StudentEnrollmentNo := Rec.StudentEnrollmentNo;
                recStFees.CourseCode := recStudent."Course Code";
                recStFees.Stream := recStudent."Stream Code";
                recStFees.Semester := recStudent."Semester Code";
                recStFees.BatchCode := recStudent."Batch Code";
                recStFees.AcademicYear := recStudent.AcademicYear;
                recStFees.Class := recStudent.Class;
                recStFees.CategoryCode := recStudent.Category;
                recStFees.CasteCode := recStudent.Cast;
                SalesSetup.Get();
                recStFees.ElementCode := SalesSetup.DefaultDepositElement;
                recStFees.StudentName := Rec.Name;
                recStFees.AmountByStudent := rec.DepositFees;
                recStFees.TotalAmount := recStFees.AmountByStudent;
                recStFees.Insert(true);
            end;
        end;
    end;


}