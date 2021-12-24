codeunit 50101 "Reversal-Post Custom"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Reversal-Post", 'OnRunOnAfterConfirm', '', true, true)]
    local procedure SubscribeToOnRunOnAfterConfirm(var ReversalEntry: Record "Reversal Entry"; var Handled: Boolean)

    begin
        recCLE.Reset();
        recCLE.SetRange("Entry No.", recStFees.PostedEntryNo);
        // recCLE.SetRange("Entry No.", recStFees.GovtEntryNo);
        recCLE.Setrange(Reversed, true);
        if recCLE.FindFirst() then begin
            recStFees.EntryReversed := true;
            recStFees.Modify(true);

        end;

    end;

    var
        recStFees: Record StudentFeeStructure;
        recCLE: Record "Cust. Ledger Entry";
}