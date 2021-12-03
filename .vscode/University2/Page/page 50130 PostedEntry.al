page 50130 PostedEntry
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = PostedCustLedg;
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
                }
                field(CustomerNo; rec.CustomerNo)
                {
                    ApplicationArea = All;
                    // TableRelation = Customer."No.";
                    // trigger OnValidate()
                    // begin
                    //     if rec.CustomerNo <> '' then
                    //         if RecCustomer.Get(rec.CustomerNo) then begin
                    //             RecPosted.CustomerName := RecCustomer.Name;
                    //         end;
                    //     RecCustLedgEntry.SetRange("Customer No.", RecPosted.CustomerNo);
                    //     if RecCustLedgEntry.FindFirst then begin
                    //         Repeat
                    //             RecPosted.Init();
                    //             RecPosted.DocumentNo := RecCustLedgEntry."Document No.";
                    //             RecPosted.PostingDate := RecCustLedgEntry."Posting Date";
                    //             RecPosted.ElementCode := RecCustLedgEntry.ElementCode;
                    //             RecPosted.ElementDesc := RecCustLedgEntry.ElementDesc;
                    //             RecPosted.Insert();
                    //         Until
                    //         RecCustLedgEntry.Next = 0;

                    //     end;
                    // end;

                }
                field(CustomerName; rec.CustomerName)
                {
                    ApplicationArea = All;
                }

            }

            part(PostedEntry; PostedEntryLine)
            {
                ApplicationArea = All;
                SubPageLink = DocumentNo = field(DocumentNo);
                //UpdatePropagation = Both;
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

            }
            field(GLAccNo; rec.GLAccNo)
            {
                ApplicationArea = All;

            }
            field(BankAccNo; rec.BankAccNo)
            {
                ApplicationArea = All;
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
                        GJL.Validate("Account No.", Rec.GLAccNo);
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
        RecPosted: Record PostedCustLedg;
        RecCustomer: Record Customer;
        RecCustLedgEntry: Record "Cust. Ledger Entry";
        RecPostedLine: record PostedCustLedgLine;
        RecGenJoun: Record "Gen. Journal Line";

        lineno: Integer;
        GJL: Record "Gen. Journal Line";

}