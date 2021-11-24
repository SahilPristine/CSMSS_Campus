pageextension 50127 CustLedgEntry extends 25
{
    layout
    {
        addafter("Amount (LCY)")
        {
            field(ElementCode; rec.ElementCode)
            {
                ApplicationArea = all;
            }
            field(ElementDesc; rec.ElementDesc)
            {
                ApplicationArea = All;
            }
            field(ElementType; rec.ElementType)
            {
                ApplicationArea = All;
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        addafter("Ent&ry")
        {
            action(ExportToExcel)
            {
                ApplicationArea = All;
                Promoted = true;
                Caption = 'Export To Excel';
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    ExportCustLedgEntry(Rec);
                end;

            }

            action(TestExport)
            {
                ApplicationArea = All;

            }
        }
        // Add changes to page actions here
    }

    var
        myInt: Integer;

    local procedure ExportCustLedgEntry(var CustLedgEntry: Record "Cust. Ledger Entry")
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        CustLedgEntryLbl: Label 'Customer Ledger Entry';
        ExcelFileName: Label 'Customer Ledger Entry Excel';
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(CustLedgEntry.FieldCaption("Posting Date"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn(CustLedgEntry.FieldCaption("Document No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgEntry.FieldCaption("Document Type"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgEntry.FieldCaption("Customer No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgEntry.FieldCaption(ElementCode), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgEntry.FieldCaption(ElementDesc), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgEntry.FieldCaption(ElementType), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgEntry.FieldCaption(Amount), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustLedgEntry.FieldCaption("Bal. Account No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        if CustLedgEntry.FindSet() then
            repeat
                TempExcelBuffer.NewRow();
                TempExcelBuffer.AddColumn(CustLedgEntry."Posting Date", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
                TempExcelBuffer.AddColumn(CustLedgEntry."Document No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(CustLedgEntry."Document Type", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(CustLedgEntry."Customer No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(CustLedgEntry."ElementCode", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(CustLedgEntry.ElementDesc, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(CustLedgEntry.ElementType, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(CustLedgEntry.Amount, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(CustLedgEntry."Bal. Account No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
            until CustLedgEntry.Next() = 0;
        TempExcelBuffer.CreateNewBook(CustLedgEntryLbl);
        TempExcelBuffer.WriteSheet(CustLedgEntryLbl, CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.OpenExcel();
    end;




}