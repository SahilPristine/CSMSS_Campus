table 50130 PostedCustLedg
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CustomerNo; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
            // trigger OnValidate()
            // begin
            //     if rec.CustomerNo <> '' then
            //         if RecCustomer.Get(rec.CustomerNo) then begin
            //             CustomerName := RecCustomer.Name;

            //         end;
            //     RecCustLedgEntry.Reset();
            //     RecCustLedgEntry.SetRange("Customer No.", rec.CustomerNo);
            //     if RecCustLedgEntry.FindFirst then begin
            //         Repeat
            //             DocumentNo := RecCustLedgEntry."Document No.";
            //             PostingDate := RecCustLedgEntry."Posting Date";
            //             ElementCode := RecCustLedgEntry.ElementCode;
            //             ElementDesc := RecCustLedgEntry.ElementDesc;
            //         Until
            //         RecCustLedgEntry.Next = 0;

            //     end;
            // end;

            trigger OnValidate()
            begin
                if CustomerNo <> '' then
                    if RecCustomer.Get(CustomerNo) then begin
                        CustomerName := RecCustomer.Name + ' ' + RecCustomer."Name 2";
                        // RecPostedLine.EntryDocNo := DocumentNo;
                    end;

                // RecPostedLine.Reset();
                // RecPostedLine.SetRange(DocumentNo, DocumentNo);
                // If RecPostedLine.FindLast() then
                //     LineNo := RecPostedLine.LineNo + 10000
                // else
                //     LineNo := 10000;

                RecCustLedgEntry.Reset();
                RecCustLedgEntry.SetRange("Customer No.", CustomerNo);
                if RecCustLedgEntry.FindSet() then begin
                    repeat
                        RecPostedLine.Reset();
                        RecPostedLine.SetRange(DocumentNo, DocumentNo);
                        If RecPostedLine.FindLast() then
                            LineNo := RecPostedLine.LineNo + 10000
                        else
                            LineNo := 10000;

                        RecPostedLine.init();
                        RecPostedLine.LineNo := LineNo;
                        RecPostedLine.DocumentNo := DocumentNo;
                        RecPostedLine.PostingDate := RecCustLedgEntry."Posting Date";
                        RecPostedLine.EntryDocNo := RecCustLedgEntry."Document No.";
                        RecPostedLine.ElementCode := RecCustLedgEntry.ElementCode;
                        RecPostedLine.ElementDesc := RecCustLedgEntry.ElementDesc;
                        RecCustLedgEntry.CalcFields(Amount);
                        RecPostedLine.Amount := RecCustLedgEntry.Amount;
                        RecPostedLine.Insert();
                    until
                    RecCustLedgEntry.Next() = 0;
                end;

            end;

        }
        field(3; CustomerName; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2; DocumentNo; code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if DocumentNo <> xRec.DocumentNo then begin
                    RecSalesSetup.Get();
                    NoSeriesMgt.TestManual(RecSalesSetup.FeesDocNo);
                    "No. Series" := '';
                end;
            end;

        }
        field(4; "No. Series"; code[20])
        {
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(Key1; DocumentNo)
        {
            Clustered = true;
        }
    }

    var
        RecCustomer: Record Customer;
        RecCustLedgEntry: Record "Cust. Ledger Entry";
        RecPosted: Record PostedCustLedg;
        RecPostedLine: Record PostedCustLedgLine;
        RecPostedLine2: record PostedCustLedgLine;
        RecSalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        LineNo: Integer;

    trigger OnInsert()
    begin
        if DocumentNo = '' then begin
            RecSalesSetup.Get();
            RecSalesSetup.TestField(FeesDocNo);
            NoSeriesMgt.InitSeries(RecSalesSetup.FeesDocNo, xRec."No. Series", 0D, DocumentNo, "No. Series");
        end;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}