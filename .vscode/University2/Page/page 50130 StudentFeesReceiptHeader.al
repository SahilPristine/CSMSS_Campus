page 50130 StudentFeeReceiptHeader
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentFeeReceiptHeader;
    RefreshOnActivate = true;
    Caption = 'Student Fees Receipt';
    // Editable = editable;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(DocumentNo; rec.DocumentNo)
                {
                    ApplicationArea = All;
                    Caption = 'Document No';
                    // Editable = editable;

                    trigger OnAssistEdit()
                    begin
                        if rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field(CustomerNo; rec.CustomerNo)
                {
                    ApplicationArea = All;
                    Caption = 'Student Enrollment No';
                    TableRelation = Customer."No.";
                    // Editable = editable;
                    trigger OnValidate()
                    begin
                        if RecCustomer.get(rec.CustomerNo) then begin
                            RecCustomer.CalcFields("Balance (LCY)");
                            rec."Total Remaining Amount" := RecCustomer."Balance (LCY)" + rec.LateFees;
                            Rec.Modify();
                            CurrPage.Update(true);

                        end;
                    end;

                }
                field(CustomerName; rec.CustomerName)
                {
                    ApplicationArea = All;
                    Caption = 'Student Name';
                    // Editable = editable;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                    // Editable = editable;
                }

            }

            part(PostedEntry; StudentFeeReceiptLine)
            {

                ApplicationArea = All;
                SubPageLink = DocumentNo = field(DocumentNo);
                // Editable = editable;
            }
            group("Fees Details")
            {
                ShowCaption = false;
                // Editable = editable;

                field(LateFees; rec.LateFees)
                {
                    ApplicationArea = All;
                    Caption = 'Late Fees';
                    trigger OnValidate()
                    begin
                        rec."Total Remaining Amount" := RecCustomer."Balance (LCY)" + rec.LateFees;
                    end;
                }
                field("Total Remaining Amount"; rec."Total Remaining Amount")
                {
                    ApplicationArea = All;
                }

                field("Amount Received"; rec."Amount Received")
                {
                    ApplicationArea = All;
                }
                field("Mode Of Payment"; rec."Mode Of Payment")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        IF rec."Mode Of Payment" = rec."Mode Of Payment"::Cash then
                            cash := true
                        else
                            cash := false;

                        if (Rec."Mode Of Payment" = Rec."Mode Of Payment"::Cheque) or (Rec."Mode Of Payment" = rec."Mode Of Payment"::BankTransfer) then
                            recBank := true
                        else
                            recBank := false;
                        CurrPage.Update(true);
                    end;


                }
            }
            group(AccInfo)
            {
                ShowCaption = false;
                // Editable = editable;
                field(GLAccNo; rec.GLAccNo)
                {
                    ApplicationArea = All;
                    Editable = cash;
                    trigger OnValidate()
                    begin

                    end;
                }
                field(BankAccNo; rec.BankAccNo)
                {
                    ApplicationArea = All;
                    Editable = recBank;
                    trigger OnValidate()
                    begin

                    end;
                }
            }

        }

    }

    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = All;
                Image = Post;
                Promoted = true;

                trigger OnAction()
                begin

                    Clear(lineno);
                    RecGenJoun.Reset();
                    RecGenJoun.SetRange("Journal Template Name", 'GENERAL');
                    RecGenJoun.SetRange("Journal Batch Name", 'FEES');
                    RecGenJoun.DeleteAll();

                    // recBatch.reset;
                    // recBatch.SetRange("Journal Template Name", 'GENERAL');
                    // recBatch.SetRange(Name, 'FEES');
                    // recBatch.FindFirst();
                    // DocNum := noseriesmgmt.GetNextNo(recBatch."No. Series", today, false);

                    RecGenJoun.Reset();
                    RecGenJoun.SetRange("Journal Template Name", 'GENERAL');
                    RecGenJoun.SetRange("Journal Batch Name", 'FEES');
                    if RecGenJoun.FindLast() then
                        lineno := RecGenJoun."Line No."
                    else
                        lineno := 10000;

                    GJL.Init();
                    GJL.Validate("Journal Template Name", 'GENERAL');
                    GJL.Validate("Journal Batch Name", 'FEES');
                    GJL."Line No." := lineno + 10000;
                    GJL.Insert(true);
                    GJL.Validate("Posting Date", today);
                    GJL.validate("Document No.", rec.DocumentNo);
                    GJL.validate("Document Type", GJL."Document Type"::Payment);
                    IF Rec."Mode Of Payment" = Rec."Mode Of Payment"::Cash then begin
                        GJL.validate("Account Type", GJL."Account Type"::"G/L Account");
                        GJL.Validate("Account No.", Rec.GLAccNo)
                    end;
                    if Rec."Mode Of Payment" = Rec."Mode Of Payment"::BankTransfer then begin
                        GJL.validate("Account Type", gjl."Account Type"::"Bank Account");
                        GJL.Validate("Account No.", rec.BankAccNo);
                    end;

                    GJL.Validate(Amount, Rec."Amount Received");
                    GJL.validate("Bal. Account Type", GJL."Bal. Account Type"::Customer);
                    GJL.Validate("Bal. Account No.", Rec.CustomerNo);
                    GJL.Validate(ElementCode, RecPostedLine.ElementCode);
                    // gjl.Validate(ElementDesc, RecPostedLine.ElementDesc);
                    GJL.Modify(true);
                    CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GJL);

                    rec.Status := rec.Status::Closed;

                end;


            }
        }
    }

    var
        RecPosted: Record StudentFeeReceiptHeader;
        RecCustomer: Record Customer;
        RecCustLedgEntry: Record "Cust. Ledger Entry";
        RecPostedLine: record StudentFeeReceiptLine;
        RecGenJoun: Record "Gen. Journal Line";
        DefaultOption: Option;
        [InDataSet]
        cash: Boolean;
        [InDataSet]
        recBank: Boolean;
        lineno: Integer;
        GJL: Record "Gen. Journal Line";
        recPage: Page 50130;
        recBatch: Record "Gen. Journal Batch";
        DocNum: Code[20];
        noseriesmgmt: Codeunit NoSeriesManagement;
        [InDataSet]
        editable: boolean;

    trigger OnAfterGetRecord()
    begin
        IF rec."Mode Of Payment" = rec."Mode Of Payment"::Cash then
            cash := true
        else
            cash := false;

        if (Rec."Mode Of Payment" = Rec."Mode Of Payment"::Cheque) or (Rec."Mode Of Payment" = rec."Mode Of Payment"::BankTransfer) then
            recBank := true
        else
            recBank := false;


        //PBS-SL Code to post stsudent fees receipt with differet posting ocument no.

        // RecPostedLine.DeleteAll();

        // RecCustLedgEntry.Reset();
        // RecCustLedgEntry.SetRange("Customer No.", rec.CustomerNo);
        // RecCustLedgEntry.SetRange(Open, true);
        // if RecCustLedgEntry.FindSet() then begin
        //     repeat
        //         If RecPostedLine.FindLast() then
        //             LineNo := RecPostedLine.LineNo + 10000
        //         else
        //             LineNo := 10000;

        //         RecPostedLine.init();
        //         RecPostedLine.LineNo := LineNo;
        //         RecPostedLine.DocumentNo := rec.DocumentNo;
        //         RecPostedLine.PostingDate := RecCustLedgEntry."Posting Date";
        //         RecPostedLine.EntryDocNo := RecCustLedgEntry."Document No.";
        //         RecPostedLine.ElementCode := RecCustLedgEntry.ElementCode;
        //         // RecPostedLine.ElementDesc := RecCustLedgEntry.ElementDesc;
        //         RecCustLedgEntry.CalcFields(Amount);
        //         RecPostedLine.Amount := RecCustLedgEntry.Amount;
        //         RecCustLedgEntry.CalcFields("Remaining Amount");
        //         RecPostedLine."Remaining Amount" := RecCustLedgEntry."Remaining Amount";
        //         RecPostedLine.Insert();
        //     // end;

        //     until
        //     RecCustLedgEntry.Next() = 0;
        // end;


        if RecCustomer.get(rec.CustomerNo) then begin
            RecCustomer.CalcFields("Balance (LCY)");
            rec."Total Remaining Amount" := RecCustomer."Balance (LCY)" + rec.LateFees;
            Rec.Modify();

        end;

    end;

    trigger OnAfterGetCurrRecord()
    begin

        IF rec."Mode Of Payment" = rec."Mode Of Payment"::Cash then
            cash := true
        else
            cash := false;

        if (Rec."Mode Of Payment" = Rec."Mode Of Payment"::Cheque) or (Rec."Mode Of Payment" = rec."Mode Of Payment"::BankTransfer) then
            recBank := true
        else
            recBank := false;

    end;
}