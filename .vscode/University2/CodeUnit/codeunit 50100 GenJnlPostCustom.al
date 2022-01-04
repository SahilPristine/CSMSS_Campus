codeunit 50100 GenJnlPostCustom
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitCustLedgEntry', '', true, true)]
    local procedure SubscribeToOnAfterInitCustLedgEntry(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        CustLedgerEntry.ElementCode := GenJournalLine.ElementCode;
        // CustLedgerEntry.ElementDesc := GenJournalLine.ElementDesc;
        CustLedgerEntry.Batch := GenJournalLine.Batch;
        CustLedgerEntry.AcademicYear := GenJournalLine.AcademicYear;
        CustLedgerEntry.Class := GenJournalLine.Class;
        CustLedgerEntry.AcademicYear := GenJournalLine.AcademicYear;
        CustLedgerEntry."Course Code" := GenJournalLine."Course Code";
        CustLedgerEntry."Semester Code" := GenJournalLine."Semester Code";
        CustLedgerEntry."Stream Code" := GenJournalLine."Stream Code";
        CustLedgerEntry.StudentCode := GenJournalLine.StudentNo;

        recStFees.Reset();
        recStFees.SetRange(StudentEnrollmentNo, CustLedgerEntry."Customer No.");
        // recStFees.SetRange(GovtCode, CustLedgerEntry."Customer No.");
        recStFees.SetRange(ElementCode, CustLedgerEntry.ElementCode);
        recStFees.SetRange(AcademicYear, CustLedgerEntry.AcademicYear);
        recStFees.SetRange(CourseCode, CustLedgerEntry."Course Code");
        recStFees.SetRange(Semester, CustLedgerEntry."Semester Code");
        recStFees.SetRange(Stream, CustLedgerEntry."Stream Code");
        recStFees.SetRange(Class, CustLedgerEntry.Class);
        if recStFees.FindFirst() then begin
            recStFees.PostedEntryNo := CustLedgerEntry."Entry No.";
            recStFees.Modify();
        end;

        recStFees.Reset();
        recStFees.SetRange(StudentEnrollmentNo, CustLedgerEntry.StudentCode);
        recStFees.SetRange(GovtCode, CustLedgerEntry."Customer No.");
        recStFees.SetRange(ElementCode, CustLedgerEntry.ElementCode);
        recStFees.SetRange(AcademicYear, CustLedgerEntry.AcademicYear);
        recStFees.SetRange(CourseCode, CustLedgerEntry."Course Code");
        recStFees.SetRange(Semester, CustLedgerEntry."Semester Code");
        recStFees.SetRange(Stream, CustLedgerEntry."Stream Code");
        recStFees.SetRange(Class, CustLedgerEntry.Class);
        if recStFees.FindFirst() then begin
            recStFees.GovtEntryNo := CustLedgerEntry."Entry No.";
            recStFees.Modify();
        end;

    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitGLEntry', '', true, true)]

    local procedure SubscribeToOnAfterInitGLEntry(var GLEntry: Record "G/L Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        GLEntry.ElementCode := GenJournalLine.ElementCode;
        // GLEntry.ElementDesc := GenJournalLine.ElementDesc;
        GLEntry.Btach := GenJournalLine.Batch;
        GLEntry.AcademicYear := GenJournalLine.AcademicYear;
        GLEntry.Class := GenJournalLine.Class;
        GLEntry."Course Code" := GenJournalLine."Course Code";
        GLEntry."Semester Code" := GenJournalLine."Semester Code";
        GLEntry."Stream Code" := GenJournalLine."Stream Code";
    end;

    var
        StudentFees: Record StudentFeeReceiptHeader;
        recStFees: Record StudentFeeStructure;
}