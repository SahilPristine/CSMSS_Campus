codeunit 50100 GenJnlPostCustom
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitCustLedgEntry', '', true, true)]
    local procedure SubscribeToOnAfterInitCustLedgEntry(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        CustLedgerEntry.ElementCode := GenJournalLine.ElementCode;
        CustLedgerEntry.ElementDesc := GenJournalLine.ElementDesc;
        CustLedgerEntry.Batch := GenJournalLine.Batch;
        CustLedgerEntry.AcademicYear := GenJournalLine.AcademicYear;
        CustLedgerEntry.Class := GenJournalLine.Class;
        CustLedgerEntry.AcademicYear := GenJournalLine.AcademicYear;
        CustLedgerEntry."Course Code" := GenJournalLine."Course Code";
        CustLedgerEntry."Semester Code" := GenJournalLine."Semester Code";
        CustLedgerEntry."Stream Code" := GenJournalLine."Stream Code";

        // recStFees.Reset();
        // recStFees.SetRange(StudentEnrollmentNo, CustLedgerEntry."Customer No.");
        // recStFees.SetRange(ElementCode, CustLedgerEntry.ElementCode);
        // recStFees.SetRange(AcademicYear, CustLedgerEntry.AcademicYear);
        // recStFees.SetRange(CourseCode, CustLedgerEntry."Course Code");
        // recStFees.SetRange(Semester, CustLedgerEntry."Semester Code");
        // recStFees.SetRange(Stream, CustLedgerEntry."Stream Code");
        // recStFees.SetRange(Class, CustLedgerEntry.Class);
        // if recStFees.FindSet() then begin
        //     repeat
        //         // recStFees.Init();
        //         recStFees.PostedEntryNo := CustLedgerEntry."Entry No.";
        //         recStFees.Insert(true);
        //     until CustLedgerEntry.Next() = 0;
        // end;

    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitCustLedgEntry', '', true, true)]
    // local procedure InsertEntryNoToStudentFeesStructure(CustLedgerEntry: Record "Cust. Ledger Entry"; recStFees: Record StudentFeeStructure; recGJL: Record "Gen. Journal Line")
    // begin
    // recStFees.Reset();
    // recStFees.SetRange(StudentEnrollmentNo, CustLedgerEntry."Customer No.");
    // recStFees.SetRange(ElementCode, CustLedgerEntry.ElementCode);
    // recStFees.SetRange(AcademicYear, CustLedgerEntry.AcademicYear);
    // recStFees.SetRange(CourseCode, CustLedgerEntry."Course Code");
    // recStFees.SetRange(Semester, CustLedgerEntry."Semester Code");
    // recStFees.SetRange(Stream, CustLedgerEntry."Stream Code");
    // recStFees.SetRange(Class, CustLedgerEntry.Class);
    // if recStFees.FindFirst() then begin
    //     repeat
    //         // recStFees.Init();
    //         recStFees.PostedEntryNo := CustLedgerEntry."Entry No.";
    //         recStFees.Insert(true);
    //     until CustLedgerEntry.Next() = 0;
    // end;
    // end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitGLEntry', '', true, true)]

    local procedure SubscribeToOnAfterInitGLEntry(var GLEntry: Record "G/L Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        GLEntry.ElementCode := GenJournalLine.ElementCode;
        GLEntry.ElementDesc := GenJournalLine.ElementDesc;
        GLEntry.Btach := GenJournalLine.Batch;
        GLEntry.AcademicYear := GenJournalLine.AcademicYear;
        GLEntry.Class := GenJournalLine.Class;
        GLEntry."Course Code" := GenJournalLine."Course Code";
        GLEntry."Semester Code" := GenJournalLine."Semester Code";
        GLEntry."Stream Code" := GenJournalLine."Stream Code";
    end;


    // [EventSubscriber(ObjectType::Table, 21, 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
    // local procedure OnAfterCopyCustLedgerEntryFromGenJnlLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    // begin
    //     CustLedgerEntry.Reset();
    //     CustLedgerEntry.SetRange("Customer No.", recStFees.StudentEnrollmentNo);
    //     CustLedgerEntry.SetRange(ElementCode, recStFees.ElementCode);
    //     CustLedgerEntry.SetRange(AcademicYear, recStFees.AcademicYear);
    //     CustLedgerEntry.SetRange("Course Code", recStFees.CourseCode);
    //     CustLedgerEntry.SetRange("Semester Code", recStFees.Semester);
    //     CustLedgerEntry.SetRange("Stream Code", recStFees.Stream);
    //     CustLedgerEntry.SetRange(Class, recStFees.Class);
    //     if CustLedgerEntry.FindFirst() then begin
    //         Message('Hello2');
    //         repeat
    //             recStFees.Init();
    //             recStFees.PostedEntryNo := CustLedgerEntry."Entry No.";
    //             recStFees.Insert(true);
    //         until CustLedgerEntry.Next() = 0;
    //         Message('Hello3');
    //     end;
    // end;

    // [EventSubscriber(ObjectType::Table, 21,'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
    // local procedure OnAfterCopyCustLedgerEntryFromGenJnlLine(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    // begin

    // end;

    var
        StudentFees: Record StudentFeeReceiptHeader;
        recStFees: Record StudentFeeStructure;
}