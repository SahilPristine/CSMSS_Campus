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
                    trigger OnValidate()
                    begin
                        rec.TestField(Rec.StudentEnrollmentNo);
                    end;

                }
                field(HostelName; Rec.HostelName)
                {
                    ApplicationArea = All;
                    Caption = 'Hostel Name';
                    trigger OnValidate()
                    begin
                        rec.TestField(Rec.StudentEnrollmentNo);
                    end;
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

                        rec.TestField(Rec.StudentEnrollmentNo);


                    end;

                }
                field(RoomDesc; rec.RoomDesc)
                {
                    ApplicationArea = All;
                    Caption = 'Room Desc';

                }
                field(RoomType; rec.RoomType)
                {
                    ApplicationArea = All;
                    Caption = 'Room Type';
                }
                field(HostelFees; Rec.HostelFees)
                {
                    ApplicationArea = All;
                    Caption = 'Hostel Fees';

                }
                field(PerMonthFees; rec.PerMonthFees)
                {
                    ApplicationArea = All;
                }
                field(DepositFees; Rec.DepositFees)
                {
                    ApplicationArea = All;
                    Caption = 'Deposit Fees';

                }
            }
            group(LeftHostel)
            {
                Caption = 'Left Hostel';
                // field(Left; rec.Left)
                // {
                //     ApplicationArea = All;
                //     Caption = 'Left';
                // }
                field(LeftDate; Rec.LeftDate)
                {
                    ApplicationArea = All;
                    Caption = 'Left Date';

                }
                field(Balance; rec.Balance)
                {
                    ApplicationArea = All;
                    Caption = 'Balance';
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
                    if rec.RegType = rec.RegType::Student then
                        CreateHostelFees(recRoom, recStFees, recStudent, recFees)
                    else
                        CreateVisitorHostelFees(recRoom, recStFees, recStudent);

                    Clear(lineno);
                    RecGenJoun.Reset();
                    RecGenJoun.SetRange("Journal Template Name", 'GENERAL1');
                    RecGenJoun.SetRange("Journal Batch Name", 'HOSTELFEE');
                    RecGenJoun.DeleteAll();

                    RecGenJoun.Reset();
                    RecGenJoun.SetRange("Journal Template Name", 'GENERAL1');
                    RecGenJoun.SetRange("Journal Batch Name", 'HOSTELFEE');
                    if RecGenJoun.FindLast() then
                        lineno := RecGenJoun."Line No."
                    else
                        lineno := 10000;

                    recStFees.Reset();
                    recStFees.SetRange(StudentEnrollmentNo, Rec.StudentEnrollmentNo);
                    recStFees.SetRange(DebitCreated, false);
                    recStFees.SetRange(Blocked, false);
                    if recStFees.FindSet() then begin
                        // runlines := 0;
                        repeat
                            LineNo := LineNo + 10000;
                            recGnJnl.Init();

                            recGnJnl."Journal Template Name" := 'GENERAL1';
                            recGnJnl."Journal Batch Name" := 'HOSTELFEE';
                            recGnJnl."Line No." := LineNo;
                            recGnJnl.Insert(true);
                            recGnJnl.Validate("Posting Date", rec.RegistrationDate);
                            recGnJnl.Validate("Document Type", recGnJnl."Document Type"::" ");
                            recGnJnl.Validate("Document No.", rec.RegistrationNo);
                            recGnJnl.Validate("Account Type", recGnJnl."Account Type"::Customer);
                            recGnJnl.validate("Account No.", recStFees.StudentEnrollmentNo);
                            recGnJnl.validate(ElementCode, recStFees.ElementCode);
                            // recGnJnl.validate(ElementDesc, recStFees.ElementDesc);
                            recGnJnl.Validate(Batch, recStFees.BatchCode);
                            recGnJnl.Validate(AcademicYear, recStFees.AcademicYear);
                            // recGnJnl.Validate(Class, recStFees.Class);
                            recGnJnl.Validate("Course Code", recStFees.CourseCode);
                            // recGnJnl.Validate("Semester Code", recStFees.Semester);
                            // recGnJnl.Validate("Stream Code", recStFees.Stream);
                            recGnJnl.validate(Amount, recStFees.AmountByStudent);
                            recGnJnl.validate("Bal. Account No.", recStFees.CreditAcc);
                            recGnJnl.Modify(true);
                        until recStFees.Next() = 0;

                    end;
                end;
            }
            action(EditJournal)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Edit Journal';
                Image = OpenJournal;
                Promoted = true;
                PromotedCategory = Process;
                ShortCutKey = 'Return';
                ToolTip = 'Open a journal based on the journal batch.';

                trigger OnAction()
                begin
                    RecGenJoun.Reset();
                    RecGenJoun.SetRange("Journal Template Name", 'GENERAL1');
                    RecGenJoun.SetRange("Journal Batch Name", 'HOSTELFEE');
                    RecGenJoun.SetRange("Document No.", rec.RegistrationNo);
                    if RecGenJoun.FindFirst() then
                        Page.Run(39, RecGenJoun);
                end;
            }
            action(Left)
            {

                ApplicationArea = All;
                Caption = 'Left Hostel';
                Promoted = true;
                PromotedCategory = Process;
                Image = RemoveLine;

                trigger OnAction()
                begin

                    Clear(lineno);
                    RecGenJoun.Reset();
                    RecGenJoun.SetRange("Journal Template Name", 'GENERAL1');
                    RecGenJoun.SetRange("Journal Batch Name", 'HOSTELFEE');
                    RecGenJoun.DeleteAll();

                    RecGenJoun.Reset();
                    RecGenJoun.SetRange("Journal Template Name", 'GENERAL1');
                    RecGenJoun.SetRange("Journal Batch Name", 'HOSTELFEE');
                    if RecGenJoun.FindLast() then
                        lineno := RecGenJoun."Line No."
                    else
                        lineno := 10000;

                    GJL.Init();
                    GJL.Validate("Journal Template Name", 'GENERAL1');
                    GJL.Validate("Journal Batch Name", 'HOSTElFEE');
                    GJL."Line No." := lineno + 10000;
                    GJL.Insert(true);
                    GJL.Validate("Posting Date", Rec.LeftDate);
                    GJL.validate("Document No.", Rec.RegistrationNo);
                    GJL.validate("Document Type", GJL."Document Type"::" ");
                    // IF Rec."Mode Of Payment" = Rec."Mode Of Payment"::Cash then begin
                    //     GJL.validate("Account Type", GJL."Account Type"::"G/L Account");
                    //     GJL.Validate("Account No.", Rec.GLAccNo)
                    // end;
                    // if Rec."Mode Of Payment" = Rec."Mode Of Payment"::BankTransfer then begin
                    //     GJL.validate("Account Type", gjl."Account Type"::"Bank Account");
                    //     GJL.Validate("Account No.", rec.BankAccNo);
                    // end;

                    GJL.Validate(Amount, Rec.Balance);
                    GJL.validate("Account Type", GJL."Account Type"::Customer);
                    GJL.Validate("Account No.", Rec.StudentEnrollmentNo);
                    SalesSetup.Get();
                    GJl.Validate("Bal. Account No.", SalesSetup.HostelFeesCreditAcc);
                    GJL.Validate(ElementCode, SalesSetup.DefaultHostelElement);
                    // gjl.Validate(ElementDesc, RecPostedLine.ElementDesc);
                    GJL.Modify(true);
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
        GJL: Record "Gen. Journal Line";
        RecGenJoun: record "Gen. Journal Line";
        lineno: Integer;
        Company: Text;
        HostelCode: Code[20];
        RoomCode: Code[20];
        recGnJnl: Record "Gen. Journal Line";
        GenJnlManagement: Codeunit GenJnlManagement;
        GenJnlBatch: Record "Gen. Journal Batch";


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


    procedure CreateHostelFees(recRoom: Record RoomMaster; recStFees: Record StudentFeeStructure; recStudent: record Customer; recFees: record CourseWiseFeeStructure)
    begin

        recRoom.Reset();
        recRoom.SetRange(RoomCode, Rec.RoomNo);
        if recRoom.FindFirst() then begin
            recStudent.SetRange("No.", Rec.StudentEnrollmentNo);
            recStudent.SetFilter(HostelCode, '');
            if recStudent.FindFirst() then begin
                recStFees.Init();
                recStFees.StudentEnrollmentNo := Rec.StudentEnrollmentNo;
                recStFees.StudentName := Rec.Name;
                recStFees.CourseCode := recStudent."Course Code";
                // recStFees.Stream := recStudent."Stream Code";
                // recStFees.Semester := recStudent."Semester Code";
                recStFees.BatchCode := recStudent."Batch Code";
                recStFees.AcademicYear := recStudent.AcademicYear;
                // recStFees.Class := recStudent.Class;
                recStFees.CategoryCode := recStudent.Category;
                recStFees.CasteCode := recStudent.Cast;
                SalesSetup.Get();
                recStFees.ElementCode := SalesSetup.DefaultHostelElement;
                recStFees.AmountByStudent := rec.HostelFees;
                recStFees.TotalAmount := recStFees.AmountByStudent;
                recStFees.DebitAcc := SalesSetup.HostelFeesDebitAcc;
                recStFees.CreditAcc := SalesSetup.HostelFeesCreditAcc;
                recStFees.Insert(true);
                recStudent.HostelCode := rec.HostelCode;
                recStudent.HostelName := rec.HostelName;
                recStudent.RoomNo := rec.RoomNo;
                recStudent.RoomDesc := rec.RoomDesc;
                recStudent.RoomType := rec.RoomType;
                recStudent.Modify(true);
                Message('Student registered in Hostel %1 and fees structure created', rec.HostelCode);
            end
            else
                Error('Student already registered in Hostel');
        end;

        recRoom.Reset();
        recRoom.SetRange(RoomCode, Rec.RoomNo);
        if recRoom.FindFirst() then begin
            recStudent.SetRange("No.", Rec.StudentEnrollmentNo);
            if recStudent.FindFirst() then begin
                recStFees.Init();
                recStFees.StudentEnrollmentNo := Rec.StudentEnrollmentNo;
                recStFees.CourseCode := recStudent."Course Code";
                // recStFees.Stream := recStudent."Stream Code";
                // recStFees.Semester := recStudent."Semester Code";
                recStFees.BatchCode := recStudent."Batch Code";
                recStFees.AcademicYear := recStudent.AcademicYear;
                // recStFees.Class := recStudent.Class;
                recStFees.CategoryCode := recStudent.Category;
                recStFees.CasteCode := recStudent.Cast;
                SalesSetup.Get();
                recStFees.ElementCode := SalesSetup.DefaultDepositElement;
                recStFees.DebitAcc := SalesSetup.HostelFeesDebitAcc;
                recStFees.CreditAcc := SalesSetup.HostelFeesCreditAcc;
                recStFees.StudentName := Rec.Name;
                recStFees.AmountByStudent := rec.DepositFees;
                recStFees.TotalAmount := recStFees.AmountByStudent;
                recStFees.Insert(true);
            end;
        end;

    end;

    procedure CreateVisitorHostelFees(recRoom: Record RoomMaster; recStFees: Record StudentFeeStructure; recStudent: record Customer)
    begin

        recRoom.Reset();
        recRoom.SetRange(RoomCode, Rec.RoomNo);
        if recRoom.FindFirst() then begin
            recStudent.SetRange("No.", Rec.VisitorNo);
            if recStudent.FindFirst() then begin
                Message('Hello');
                recStFees.Init();
                recStFees.StudentEnrollmentNo := Rec.VisitorNo;
                recStFees.StudentName := Rec.Name;
                recStFees.CourseCode := recStudent."Course Code";
                // recStFees.Stream := recStudent."Stream Code";
                // recStFees.Semester := recStudent."Semester Code";
                recStFees.BatchCode := recStudent."Batch Code";
                recStFees.AcademicYear := recStudent.AcademicYear;
                // recStFees.Class := recStudent.Class;
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
                recStFees.StudentEnrollmentNo := Rec.VisitorNo;
                recStFees.CourseCode := recStudent."Course Code";
                // recStFees.Stream := recStudent."Stream Code";
                // recStFees.Semester := recStudent."Semester Code";
                recStFees.BatchCode := recStudent."Batch Code";
                recStFees.AcademicYear := recStudent.AcademicYear;
                // recStFees.Class := recStudent.Class;
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