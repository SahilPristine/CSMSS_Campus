report 50100 GenJournalReport
{
    UseRequestPage = true;
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;



    dataset
    {
        dataitem(Customer; Customer)

        {
            RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            begin
                recBatch.reset;
                recBatch.SetRange("Journal Template Name", template);
                recBatch.SetRange(Name, Batch);
                recBatch.FindFirst();
                DocNum := noseriesmgmt.GetNextNo(recBatch."No. Series", today, false);
                Message(DocNum);
                recGnJnl.reset;
                recGnJnl.SetRange("Journal Template Name", template);
                recGnJnl.SetRange("Journal Batch Name", Batch);
                recGnJnl.DeleteAll;

                recStFees.Reset();
                recStFees.SetRange(StudentID, "No.");
                recStFees.SetRange(CourseCode, "Course Code");
                // recStFees.SetRange(Semester, "Semester Code");
                recStFees.SetRange(Stream, "Stream Code");
                // recStFees.SetRange(BatchCode, "Batch Code");
                if recStFees.FindFirst() then begin
                    repeat
                        LineNo := LineNo + 10000;
                        recGnJnl.Init();
                        recGnJnl."Posting Date" := PostingDate;
                        recGnJnl."Journal Template Name" := template;
                        recGnJnl."Journal Batch Name" := Batch;
                        recGnJnl."Line No." := LineNo;
                        recGnJnl.Insert(true);
                        recGnJnl.Validate("Document Type", recGnJnl."Document Type"::" ");
                        recGnJnl.Validate("Document No.", DocNum);
                        recGnJnl.Validate("Account Type", recGnJnl."Account Type"::Customer);
                        recGnJnl.validate("Account No.", recStFees.StudentID);
                        recGnJnl.validate(ElementCode, recStFees.ElementCode);
                        recGnJnl.validate(ElementDesc, recStFees.ElementDesc);
                        recGnJnl.validate(ElementType);
                        recGnJnl.validate(Amount, recStFees.Amount);
                        recGnJnl.validate("Bal. Account No.", recStFees.CreditAcc);
                        recGnJnl.Modify(true);

                    until recStFees.Next = 0;

                end;

            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(General)
                {

                    field(Template; template)
                    {
                        ApplicationArea = All;
                        TableRelation = "Gen. Journal Template";

                    }
                    field(Batch; Batch)
                    {
                        ApplicationArea = All;

                    }
                    field(PostingDate; PostingDate)
                    {
                        ApplicationArea = All;
                    }
                    /*  field(CustomerNo; CustomerNo)
                     {
                         ApplicationArea = All;
                         TableRelation = Customer;
                     } */
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }

    }

    var
        recStFees: Record StudentFeeStructure;
        recGnJnl: Record "Gen. Journal Line";
        Batch: Code[20];
        template: Code[20];
        LineNo: Integer;
        PostingDate: Date;
        recBatch: Record "Gen. Journal Batch";
        noseriesmgmt: Codeunit NoSeriesManagement;
        DocNum: Code[20];
        CustomerNo: Code[20];


}
