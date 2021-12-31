codeunit 50101 "Reversal-Post Custom"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Reversal-Post", 'OnRunOnAfterConfirm', '', true, true)]
    local procedure OnRunOnAfterConfirm(var ReversalEntry: Record "Reversal Entry"; var Handled: Boolean)

    begin
        recStFees.Reset();
        recStFees.SetRange(PostedEntryNo, ReversalEntry."Entry No.");
        if recStFees.FindFirst then begin
            recStFees.StudentEntryReversed := true;
            recStFees.Modify(true);
        end;

        recStFees.Reset();
        recStFees.SetRange(GovtEntryNo, ReversalEntry."Entry No.");
        if recStFees.FindFirst then begin
            recStFees.GovtEntryReversed := true;
            recStFees.Modify(true);
        end;



        // PBS SL Code to tick the reverse entry boolean in student fees structure. Code working well



    end;


    var
        recStFees: Record StudentFeeStructure;
        recCLE: Record "Cust. Ledger Entry";
}