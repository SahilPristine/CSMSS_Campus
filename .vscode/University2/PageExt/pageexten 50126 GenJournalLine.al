pageextension 50126 GenJournalLine extends 39
{
    layout
    {
        addafter("Account No.")
        {
            field(ElementCode; rec.ElementCode)
            {
                ApplicationArea = all;
                Caption = 'Element Code';
            }
            field(ElementDesc; rec.ElementDesc)
            {
                ApplicationArea = All;
                Caption = 'Element Desc';
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        modify(Post)
        {
            trigger OnAfterAction()
            begin
                // recCLE.Reset();
                // recCLE.SetRange("Customer No.", recGJL."Account No.");
                // if recCLE.FindFirst() then
                //     Message('Hello');
                // recCLE.Reset();
                // recCLE.SetRange("Customer No.", recStFees.StudentEnrollmentNo);
                // recCLE.SetRange(ElementCode, recStFees.ElementCode);
                // recCLE.SetRange(AcademicYear, recStFees.AcademicYear);
                // recCLE.SetRange("Course Code", recStFees.CourseCode);
                // recCLE.SetRange("Semester Code", recStFees.Semester);
                // recCLE.SetRange("Stream Code", recStFees.Stream);
                // recCLE.SetRange(Class, recStFees.Class);
                // if recCLE.FindFirst() then begin
                //     Message('Hello2');
                //     repeat
                //         recStFees.Init();
                //         recStFees.PostedEntryNo := recCLE."Entry No.";
                //         recStFees.Insert(true);
                //     until recCLE.Next() = 0;
                //     Message('Hello3');
                // end;
            end;


        }

    }

    var

        recCLE: Record "Cust. Ledger Entry";
        recStFees: Record StudentFeeStructure;
        recGJL: Record "Gen. Journal Line";

}