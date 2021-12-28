pageextension 50130 ReverseEntriesExt extends 179
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        modify(Reverse)
        {
            trigger OnAfterAction()
            begin
                // ReverseEntriesBoolean(recCLE, recStfees);
            end;
        }
        // Add changes to page actions here
    }

    var
        recStfees: Record StudentFeeStructure;
        recCLE: Record "Cust. Ledger Entry";

    local procedure ReverseEntriesBoolean(recCLE: Record "Cust. Ledger Entry"; recStfess: Record StudentFeeStructure)
    begin
        // recCLE.SetRange("Customer No.", recStfees.StudentEnrollmentNo);
        // recCLE.SetRange("Customer No.", recStfees.GovtCode);
        // recCLE.SetRange(Reversed, true);
        // if recCLE.FindFirst() then begin
        //     recStfees.EntryReversed := true;
        //     recStfees.Modify(true);
        //     CurrPage.Update();
        // end;
    end;
}