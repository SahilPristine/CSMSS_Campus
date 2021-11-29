page 50130 PostedEntry
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = PostedCustLedg;
    Caption = 'Student Fees Slip';

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
        }

    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

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
}