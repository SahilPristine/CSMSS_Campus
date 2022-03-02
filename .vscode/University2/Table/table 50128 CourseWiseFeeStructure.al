table 50128 CourseWiseFeeStructure
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; BatchCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = BatchMasterTable.CODE;
        }
        field(2; AdmissionQuota; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = AcademicYearMasterTable.CODE;
        }
        field(3; CourseCode; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = CourseMasterTable.CODE;

        }
        // field(4; StreamCode; code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = StreamMasterTable.StreamCode;

        // }
        // field(5; SemesterCode; code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = SemesterMasterTable.SemesterCode;

        // }
        field(4; ClassCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = ClassMaster;
        }
        field(6; ElementCode; code[20])
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
        field(7; Description; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Amount; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(9; DebitAcc; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";

        }
        field(10; CreditAcc; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }

        // field(11; CategoryCode; text[50])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = AdmissionCategory;
        // }
        // field(12; "Caste Code"; code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = CasteMaster;
        //     trigger OnValidate()
        //     begin
        //         recCategory.Reset();
        //         recCategory.SetRange(CategCode, CategoryCode);
        //         // recCategory.SetRange(Caste, "Caste Code");
        //         // recCategory.SetRange(Batch, BatchCode);
        //         recCategory.SetRange(Course, CourseCode);
        //         if recCategory.FindFirst() then begin
        //             "Govt Code" := recCategory.GovtCode;
        //         end;
        //     end;
        // }
        //

        // field(14; AmountByStudent; Decimal)
        // {
        //     DataClassification = ToBeClassified;
        //     trigger OnValidate()
        //     begin

        //     end;

        // }
        // field(15; AmountByGovt; Decimal)
        // {
        //     DataClassification = ToBeClassified;
        //     trigger OnValidate()
        //     begin
        //     end;

        // }
        // field(13; "Govt Code"; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = Customer;
        //     Editable = false;
        //     trigger OnValidate()
        //     begin

        //     end;
        // }

        // field(17; DueDate; Date)
        // {
        //     DataClassification = ToBeClassified;

        // }
        // field(18; Class; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = ClassMaster.CODE;
        // }
    }

    keys
    {
        key(Key1; BatchCode, CourseCode, ElementCode)
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