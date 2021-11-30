table 50111 StudentFeeStructure
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; StudentID; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No." where("Enrollment No" = filter(<> ''));
            trigger OnValidate()
            begin
                if StudentID <> '' then
                    if recStudent.get(StudentID) then
                        StudentName := recStudent.Name + ' ' + recStudent."Name 2";
                CourseCode := recStudent."Course Code";
                Stream := recStudent."Stream Code";
                Semester := recStudent."Semester Code";
                BatchCode := recStudent."Batch Code";
                CategoryCode := recStudent.Category;
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
            // TableRelation = StreamMasterTable.StreamCode where(CourseCode = field(CourseCode));

        }
        field(4; Semester; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = SemesterMasterTable.SemesterCode where(CourseCode = field(CourseCode));

        }
        field(17; BatchCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = BatchMasterTable;
        }
        field(18; CategoryCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = AdmissionCategory;

        }
        field(5; ElementCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = FeeStructureElements;
            trigger OnValidate()
            begin
                recFees.reset;
                recFees.SetRange(CourseCode, Rec.CourseCode);
                recFees.SetRange(ElementCode, Rec.ElementCode);
                if recFees.FindFirst() then begin
                    ElementDesc := recFees.Description;
                    ElementType := recFees.ElementType;
                    DebitAcc := recFees.DebitAcc;
                    CreditAcc := recFees.CreditAcc;
                end;
            end;

        }
        field(6; ElementDesc; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(7; ElementType; Text[30])
        {
            DataClassification = ToBeClassified;
        }

        // field(8; Period; Option)
        // {
        //     DataClassification = ToBeClassified;
        //     OptionMembers = Monthly,Yearly;
        // }
        field(9; CalculationOrder; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(10; Amount; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(11; CalculationType; text[50])
        {
            DataClassification = ToBeClassified;

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
        field(16; DebitAmount; Decimal)
        {
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(Key1; StudentID, Stream, Semester, ElementCode)
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