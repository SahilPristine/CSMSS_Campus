table 50111 StudentFeeStructure
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; StudentEnrollmentNo; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
            trigger OnValidate()
            begin
                if StudentEnrollmentNo <> '' then
                    if recStudent.get(StudentEnrollmentNo) then
                        StudentName := recStudent.Name + ' ' + recStudent."Name 2";
                CourseCode := recStudent."Course Code";
                Stream := recStudent."Stream Code";
                Semester := recStudent."Semester Code";
                BatchCode := recStudent."Batch Code";
                AcademicYear := recStudent.AcademicYear;
                Class := recStudent.Class;
                CategoryCode := recStudent.Category;
                CasteCode := recStudent.Cast;
            end;

        }
        field(14; StudentName; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; CourseCode; Code[20])
        {
            // TableRelation = StudentMaster where(StudentCode = field(StudentID));
            // FieldClass = FlowField;
            // CalcFormula = lookup(FeesStructure.CourseCode where(CourseCode = field(CourseCode)));

        }
        field(3; Stream; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(4; Semester; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17; BatchCode; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; AcademicYear; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23; Class; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18; CategoryCode; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19; CasteCode; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; ElementCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = FeeStructureElements;
            trigger OnValidate()
            begin
                recFees.reset;
                recFees.SetRange(CourseCode, Rec.CourseCode);
                recFees.SetRange(StreamCode, Rec.Stream);
                recFees.SetRange(SemesterCode, rec.Semester);
                recFees.SetRange(BatchCode, rec.BatchCode);
                recFees.SetRange(AcademicYear, rec.AcademicYear);
                recFees.SetRange(Class, rec.Class);
                recFees.setrange(CategoryCode, Rec.CategoryCode);
                recFees.SetRange("Caste Code", Rec.CasteCode);
                recFees.SetRange(ElementCode, Rec.ElementCode);
                if recFees.FindFirst() then begin
                    ElementDesc := recFees.Description;
                    GovtCode := recFees."Govt Code";
                    AmountByStudent := recFees.AmountByStudent;
                    GovtAmount := recFees.AmountByGovt;
                    DebitAcc := recFees.DebitAcc;
                    CreditAcc := recFees.CreditAcc;
                end;
            end;
        }
        field(6; ElementDesc; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(10; AmountByStudent; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Amount By Student';
            trigger OnValidate()
            begin
                TotalAmount := AmountByStudent + GovtAmount;
            end;

        }
        field(20; GovtCode; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(21; GovtAmount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Amount By Govt';
            trigger OnValidate()
            begin
                TotalAmount := AmountByStudent + GovtAmount;
            end;

        }
        field(12; DebitAcc; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(13; CreditAcc; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(15; DebitCreated; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16; TotalAmount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24; PostedEntryNo; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(25; GovtEntryNo; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(26; StudentEntryReversed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; GovtEntryReversed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(28; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(29; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; StudentEnrollmentNo, Stream, Semester, ElementCode, GovtCode, CategoryCode, CasteCode, LineNo)
        {
            Clustered = true;
        }
    }

    var
        recStudent: Record Customer;
        recFees: Record CourseWiseFeeStructure;

    trigger OnInsert()
    begin

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