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
                pendingLinestoberun := 0;
                recStFees2.Reset();
                recStFees2.SetRange(StudentEnrollmentNo, "No.");
                recStFees2.SetRange(CourseCode, "Course Code");
                recStFees2.SetRange(Stream, "Stream Code");
                recStFees2.SetRange(DebitCreated, false);
                pendingLinestoberun := recStFees2.Count;

                recBatch.reset;
                recBatch.SetRange("Journal Template Name", template);
                recBatch.SetRange(Name, Batch);
                recBatch.FindFirst();
                DocNum := noseriesmgmt.GetNextNo(recBatch."No. Series", today, false);

                recGnJnl.reset;
                recGnJnl.SetRange("Journal Template Name", template);
                recGnJnl.SetRange("Journal Batch Name", Batch);
                recGnJnl.DeleteAll;

                recStFees.Reset();
                recStFees.SetRange(StudentEnrollmentNo, "No.");
                recStFees.SetRange(CourseCode, "Course Code");
                recStFees.SetRange(Stream, "Stream Code");
                recStFees.SetRange(DebitCreated, false);
                if recStFees.FindSet() then begin
                    runlines := 0;
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
                        recGnJnl.validate("Account No.", recStFees.StudentEnrollmentNo);
                        recGnJnl.validate(ElementCode, recStFees.ElementCode);
                        recGnJnl.validate(ElementDesc, recStFees.ElementDesc);
                        recGnJnl.Validate(Batch, recStFees.BatchCode);
                        recGnJnl.Validate(AcademicYear, recStFees.AcademicYear);
                        recGnJnl.Validate(Class, recStFees.Class);
                        recGnJnl.Validate("Course Code", recStFees.CourseCode);
                        recGnJnl.Validate("Semester Code", recStFees.Semester);
                        recGnJnl.Validate("Stream Code", recStFees.Stream);
                        recGnJnl.validate(Amount, recStFees.AmountByStudent);
                        recGnJnl.validate("Bal. Account No.", recStFees.CreditAcc);
                        recGnJnl.Modify(true);

                        if recStFees.GovtCode <> '' then begin
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
                            recGnJnl.validate("Account No.", recStFees.GovtCode);
                            recGnJnl.validate(ElementCode, recStFees.ElementCode);
                            recGnJnl.validate(ElementDesc, recStFees.ElementDesc);
                            recGnJnl.Validate(Batch, recStFees.BatchCode);
                            recGnJnl.Validate(AcademicYear, recStFees.AcademicYear);
                            recGnJnl.Validate(Class, recStFees.Class);
                            recGnJnl.Validate("Course Code", recStFees.CourseCode);
                            recGnJnl.Validate("Semester Code", recStFees.Semester);
                            recGnJnl.Validate("Stream Code", recStFees.Stream);
                            recGnJnl.validate(Amount, recStFees.GovtAmount);
                            recGnJnl.validate("Bal. Account No.", recStFees.CreditAcc);
                            recGnJnl.Modify(true);
                        end;
                        runlines += 1;
                        recStFees.DebitCreated := true;
                        recStFees.Modify();
                    until recStFees.Next = 0;
                end;
                if runlines = 0 then
                    Message('Entries already posted')
                else
                    Message('%1 entries created successfully', runlines);
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
        recCustLedg: Record "Cust. Ledger Entry";
        recStFees2: Record StudentFeeStructure;
        pendingLinestoberun: Integer;
        runlines: Integer;


}
