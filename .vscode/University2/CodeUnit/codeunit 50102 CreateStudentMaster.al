codeunit 50102 CreateStudentMaster

{

    TableNo = StudentRegistration;
    trigger OnRun()
    begin
        CreateStudentMaster(recReg, recFees, CustRec);
        CreateFeesStructure(recStFees, recFees, recStudent, Rec);
    end;

    local procedure CreateFeesStructure(recStFees: Record StudentFeeStructure; recFees: Record CourseWiseFeeStructure; recStudent: record Customer; RecReg: Record StudentRegistration)
    begin
        recStudent.Reset();
        recStudent.SetRange("No.", RecReg."Enrollment No");
        if recStudent.FindFirst() then begin
            recFees.Reset();
            recFees.Setrange(BatchCode, recStudent."Batch Code");
            // recFees.SetRange(AcademicYear, recStudent.AcademicYear);
            recFees.SetRange(CourseCode, recStudent."Course Code");
            // recFees.SetRange(StreamCode, recStudent."Stream Code");
            // recFees.SetRange(SemesterCode, recStudent."Semester Code");
            // recFees.SetRange(CategoryCode, recStudent.Category);
            // recFees.SetRange("Caste Code", recStudent.Cast);
            if recFees.FindFirst() then begin
                repeat
                    recStFees.Init();
                    recStFees.StudentEnrollmentNo := recStudent."No.";
                    recStFees.StudentName := recStudent.Name + ' ' + recStudent."Name 2";
                    recStFees.CourseCode := recStudent."Course Code";
                    // recStFees.Stream := recStudent."Stream Code";
                    // recStFees.Semester := recStudent."Semester Code";
                    recStFees.BatchCode := recStudent."Batch Code";
                    recStFees.CategoryCode := recStudent.Category;
                    recStFees.CasteCode := recStudent.Cast;
                    recStFees.ElementCode := recFees.ElementCode;
                    // recStFees.GovtCode := recFees."Govt Code";
                    // recStFees.AmountByStudent := recFees.AmountByStudent;
                    // recStFees.GovtAmount := recFees.AmountByGovt;
                    // recStFees.TotalAmount := recFees.TotalAmount;
                    recStFees.DebitAcc := recFees.DebitAcc;
                    recStFees.CreditAcc := recFees.CreditAcc;
                    recStFees.Insert(true);
                until
                recFees.Next() = 0;
            end;
            Message('Fees Structure Created');

        end;
    end;

    local procedure CreateStudentMaster(RecReg: Record StudentRegistration; recFees: Record CourseWiseFeeStructure; CustRec: Record Customer)
    var
        Question: Text;
        Answer: Boolean;
        Text000: Label 'Do you want to confirm enrollment?';
    begin
        recFees.Reset();
        recFees.Setrange(BatchCode, RecReg."Batch Code");
        // recFees.SetRange(AcademicYear, RecReg.AcademicYear);
        recFees.SetRange(CourseCode, RecReg."Course Code");
        // recFees.SetRange(StreamCode, RecReg."Stream Code");
        // recFees.SetRange(SemesterCode, RecReg."Semester Code");
        // recFees.SetRange(CategoryCode, RecReg.Category);
        // recFees.SetRange("Caste Code", RecReg.Cast);
        if recFees.FindFirst() then begin
            Message('hello');
            Question := Text000;
            Answer := Dialog.Confirm(Question, true);
            if Answer = true then begin
                recSalesSetup.get();
                RecReg."Enrollment No" := NoSeriesMgt.GetNextNo(recSalesSetup."Customer Nos.", Today, true);

                Message('%1 Enrollment alloted to %2', RecReg."Enrollment No", RecReg."Registration No");

                CustRec.Init();
                CustRec."No." := RecReg."Enrollment No";
                CustRec.Name := RecReg."First Name";
                CustRec."Name 2" := RecReg."Last Name";
                CustRec.DOB := RecReg.DOB;
                CustRec."Birth Place" := RecReg."Birth Place";
                CustRec.Gender := RecReg.Gender;
                CustRec.Category := RecReg.Category;
                CustRec.Cast := RecReg.Cast;
                CustRec.Religion := RecReg.Religion;
                CustRec.Nationality := RecReg.Nationality;
                CustRec."Aadhar No" := RecReg."Aadhar No";
                CustRec."Admission Quota" := RecReg."Admission Quota";
                CustRec."Qualifying Exam Details" := RecReg."Qualifying Exam Details";
                CustRec.Address := RecReg."Permanent Address 1";
                CustRec."Address 2" := RecReg."Permanent Address 2";
                CustRec.State := RecReg.State;
                CustRec."Pin Code" := RecReg."Pin Code";
                CustRec."Country/Region Code" := RecReg."Country Code";
                CustRec."Local Address 1" := RecReg."Local Address 1";
                CustRec."Local Address 2" := RecReg."Local Address 2";
                CustRec.State2 := RecReg.State2;
                CustRec."Post Code" := RecReg."Pin Code2";
                CustRec."Country Code" := RecReg."Country Code2";
                CustRec."Phone No." := RecReg."Phone No";
                CustRec."E-Mail" := RecReg."Email ID";
                CustRec."Father's First Name" := RecReg."Father's First Name";
                CustRec."Father's Last Name" := RecReg."Father's Last Name";
                CustRec."Father's Contact No" := RecReg."Father's Contact No";
                CustRec."Father's Email ID" := RecReg."Father's Email ID";
                CustRec."Mother's First Name" := RecReg."Mother's First Name";
                CustRec."Mother's Last Name" := RecReg."Mother's Last Name";
                CustRec."Mother's Contact No" := RecReg."Mother's Contact No";
                CustRec."Mother's Email ID" := RecReg."Mother's Email ID";
                CustRec."Batch Code" := RecReg."Batch Code";
                Custrec.AcademicYear := RecReg.AcademicYear;
                CustRec."Course Code" := RecReg."Course Code";
                CustRec."Semester Code" := RecReg."Semester Code";
                CustRec."Stream Code" := RecReg."Stream Code";
                CustRec.Class := RecReg.Class;
                CustRec."Bank Name" := RecReg."Bank Name";
                CustRec."Branch Name" := RecReg."Branch Name";
                CustRec."IFSC Code" := RecReg."IFSC Code";
                CustRec."Bank Account No" := RecReg."Bank Account No";
                CustRec."Application Method" := RecReg."Application Method"::"Apply to Oldest";
                CustRec.Hostel := RecReg.Hostel;
                CustRec.RoomType := RecReg.RoomType;
                CustRec.BedType := RecReg.BedType;
                CustRec.HostelCode := RecReg.HostelCode;
                CustRec.RoomNo := RecReg.RoomNo;
                CustRec.Transport := RecReg.Transport;
                CustRec.RouteNo := RecReg.RoomNo;
                CustRec.Charge := RecReg.Charge;

                CustRec.Insert(true);

            end;
        end;
        // else
        //     Error('Create Fees Structure First');
    end;



    var
        recReg: Record StudentRegistration;
        recSalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        recStFees: Record StudentFeeStructure;
        recFees: Record CourseWiseFeeStructure;
        recStudent: record Customer;
        CustRec: Record Customer;

}