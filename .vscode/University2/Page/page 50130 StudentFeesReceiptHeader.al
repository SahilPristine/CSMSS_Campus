page 50130 StudentFeeReceiptHeader
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentFeeReceiptHeader;
    RefreshOnActivate = true;
    Caption = 'Student Fees Receipt';



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
                    trigger OnValidate()
                    begin
                        if RecCustomer.get(rec.CustomerNo) then begin
                            RecCustomer.CalcFields("Balance (LCY)");
                            rec."Total Remaining Amount" := RecCustomer."Balance (LCY)" + rec.LateFees;
                            Rec.Modify();
                        end;
                    end;

                }
                field(CustomerName; rec.CustomerName)
                {
                    ApplicationArea = All;
                    Caption = 'Student Name';
                }

            }

            part(PostedEntry; StudentFeeReceiptLine)
            {

                ApplicationArea = All;
                SubPageLink = DocumentNo = field(DocumentNo);
            }
            group("Fees Details")
            {
                ShowCaption = false;

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
                    GJL.validate("Document No.", Rec.DocumentNo);
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
                    gjl.Validate(ElementDesc, RecPostedLine.ElementDesc);
                    GJL.Modify(true);
                    CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GJL);
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
        CurrPage.Update(true);

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
        CurrPage.Update(true);
    end;

}