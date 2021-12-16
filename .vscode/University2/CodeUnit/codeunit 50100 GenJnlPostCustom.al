codeunit 50100 GenJnlPostCustom
{


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitCustLedgEntry', '', true, true)]
    local procedure SubscribeToOnAfterInitCustLedgEntry(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        CustLedgerEntry.ElementCode := GenJournalLine.ElementCode;
        CustLedgerEntry.ElementDesc := GenJournalLine.ElementDesc;
        CustLedgerEntry.ElementType := GenJournalLine.ElementType;

        // if CustLedgerEntry.Open = true then
        //     CustLedgerEntry.PaymentReceived := true
        // else
        //     CustLedgerEntry.PaymentReceived := false;

        // OnAfterInitCustLedgEntry(CustLedgerEntry, GenJournalLine);

    end;

    // [IntegrationEvent(false, false)]
    // local procedure OnAfterInitCustLedgEntry(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    // begin
    // end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitGLEntry', '', true, true)]

    local procedure SubscribeToOnAfterInitGLEntry(var GLEntry: Record "G/L Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        GLEntry.ElementCode := GenJournalLine.ElementCode;
        GLEntry.ElementDesc := GenJournalLine.ElementDesc;
        GLEntry.ElementType := GenJournalLine.ElementType;
    end;

    var
        StudentFees: Record StudentFeeReceiptHeader;
}