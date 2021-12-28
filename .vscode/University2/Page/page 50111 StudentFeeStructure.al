page 50111 StudentFeeStructure
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentFeeStructure;
    AccessByPermission = page StudentFeeStructure = X;
    Caption = 'Student Fees Sructure';

    layout
    {
        area(Content)
        {

            repeater(StudentFeesStructure)
            {
                Caption = 'Student Fees Structure';
                field(StudentID; Rec.StudentEnrollmentNo)
                {
                    ApplicationArea = All;
                    Caption = 'Student Enrollment No';

                }
                field(StudentName; rec.StudentName)
                {
                    ApplicationArea = All;
                    Caption = 'Student Name';
                }
                field(CourseCode; Rec.CourseCode)
                {
                    ApplicationArea = All;
                    Caption = 'Course Code';

                }
                field(Stream; Rec.Stream)
                {
                    ApplicationArea = All;
                    Caption = 'Stream';

                }
                field(Semester; Rec.Semester)
                {
                    ApplicationArea = All;
                    Caption = 'Semester';

                }
                field(BatchCode; rec.BatchCode)
                {
                    ApplicationArea = All;
                    Caption = 'Batch Code';
                }
                field(CategoryCode; rec.CategoryCode)
                {
                    ApplicationArea = All;
                    Caption = 'Category Code';
                }
                field(CasteCode; rec.CasteCode)
                {
                    ApplicationArea = All;
                    Caption = 'Caste Code';
                }
                field(ElementCode; rec.ElementCode)
                {
                    ApplicationArea = All;
                    Caption = 'Element Code';
                }
                field(GovtCode; rec.GovtCode)
                {
                    ApplicationArea = All;
                    Caption = 'Govt Code';
                    trigger OnValidate()
                    begin
                        If rec.GovtCode <> '' then
                            Enable := true
                        else
                            Enable := false;
                        CurrPage.Update(true);
                    end;
                }
                field(Amount; rec.AmountByStudent)
                {
                    ApplicationArea = All;
                }
                field(GovtAmount; rec.GovtAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Govt Amount';
                    Enabled = Enable;
                    trigger OnValidate()
                    begin
                        If rec.GovtCode <> '' then
                            Enable := true
                        else
                            Enable := false;
                        CurrPage.Update(true);
                    end;


                }
                field(TotalAmount; rec.TotalAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Total Amount';
                }
                field(DebitAcc; rec.DebitAcc)
                {
                    ApplicationArea = All;
                    Caption = 'Debit Account';

                }
                field(CreditAcc; rec.CreditAcc)
                {
                    ApplicationArea = All;
                    Caption = 'Credit Account';

                }
                field(DebitCreated; rec.DebitCreated)
                {
                    ApplicationArea = All;
                    Caption = 'Debit Created';
                }
                field(PostedEntryNo; rec.PostedEntryNo)
                {
                    ApplicationArea = All;
                    Caption = 'Posted Entry No.';

                }
                field(GovtEntryNo; rec.GovtEntryNo)
                {
                    ApplicationArea = All;
                    Caption = 'Govt Entry No.';
                }
                field(StudentEntryReversed; rec.StudentEntryReversed)
                {
                    ApplicationArea = All;
                }
                field(GovtEntryReversed; rec.GovtEntryReversed)
                {
                    ApplicationArea = All;
                    Enabled = Enable;
                }

                field(Blocked; rec.Blocked)
                {
                    ApplicationArea = All;
                }

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
        [InDataSet]
        Enable: boolean;
        custledgentry: Record "Cust. Ledger Entry";
        stfees: Record StudentFeeStructure;

    trigger OnAfterGetRecord()
    begin
        If rec.GovtCode <> '' then
            Enable := true
        else
            Enable := false;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        If rec.GovtCode <> '' then
            Enable := true
        else
            Enable := false;

    end;

    trigger OnOpenPage()
    begin
    end;


}