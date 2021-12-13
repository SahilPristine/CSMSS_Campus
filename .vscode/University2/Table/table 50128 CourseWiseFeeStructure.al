table 50128 CourseWiseFeeStructure
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CourseCode; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = CourseMasterTable.CODE;

        }
        field(2; StreamCode; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = StreamMasterTable.StreamCode;

        }
        field(3; SemesterCode; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = SemesterMasterTable.StreamCode;

        }
        field(4; ElementCode; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = FeeStructureElements.ElementCode;
            trigger OnValidate()
            begin
                if ElementCode <> '' then begin
                    if recElement.get(ElementCode) then
                        Description := recElement.Description;
                end;
            end;

        }
        field(6; Period; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Monthly,Quarterly,Yearly;

        }
        field(7; DebitAcc; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";

        }
        field(8; CreditAcc; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(9; Description; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; BatchCode; text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = BatchMasterTable;
        }
        field(11; CategoryCode; text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = AdmissionCategory;
        }
        field(12; "Caste Code"; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = CasteMaster;
            trigger OnValidate()
            begin
                recCategory.Reset();
                recCategory.SetRange(CategCode, CategoryCode);
                recCategory.SetRange(Caste, "Caste Code");
                recCategory.SetRange(Batch, BatchCode);
                recCategory.SetRange(Course, CourseCode);
                if recCategory.FindFirst() then begin
                    "Govt Code" := recCategory.GovtCode;
                end;
            end;
        }
        field(13; "Govt Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
            Editable = false;
        }
        field(14; DueDate; Date)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; CourseCode, StreamCode, SemesterCode, ElementCode)
        {
            Clustered = true;
        }
    }

    var
        recElement: record FeeStructureElements;
        recCategory: Record AdmissionCategory;

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