page 50143 PostedFeesReceipt
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentFeeReceiptHeader;
    SourceTableView = where(Status = filter(Closed));
    Caption = 'Student Fees Receipt';
    Editable = false;

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
                            CurrPage.Update(true);

                        end;
                    end;

                }
                field(CustomerName; rec.CustomerName)
                {
                    ApplicationArea = All;
                    Caption = 'Student Name';
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
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

}