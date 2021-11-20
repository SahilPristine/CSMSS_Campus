codeunit 50100 GenJnlPostCustom
{
    trigger OnRun()
    begin

    end;

    local procedure InitCustLedgEntry(GenJnlLine: Record "Gen. Journal Line"; var CustLedgEntry: Record "Cust. Ledger Entry")
    begin
        OnBeforeInitCustLedgEntry(CustLedgEntry, GenJnlLine);

        CustLedgEntry.Init();
        CustLedgEntry.CopyFromGenJnlLine(GenJnlLine);


        OnAfterInitCustLedgEntry(CustLedgEntry, GenJnlLine);
    end;

    var
        myInt: Integer;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInitCustLedgEntry(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInitCustLedgEntry(var CustLedgerEntry: Record "Cust. Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
    end;
}