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

                end;

            }
        }
    }

    var
        RecPosted: Record PostedCustLedg;
        RecCustomer: Record Customer;
        RecCustLedgEntry: Record "Cust. Ledger Entry";
        RecPostedLine: record PostedCustLedgLine;
}