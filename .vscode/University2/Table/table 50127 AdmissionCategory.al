table 50127 AdmissionCategory
{
    DataClassification = ToBeClassified;
    LookupPageId = 50127;

    fields
    {
        field(1; CategCode; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(6; Description; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(7; Caste; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = CasteMaster;
        }
        field(3; Batch; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = BatchMasterTable.CODE;

        }
        field(4; Course; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = CourseMasterTable.CODE;

        }
        field(5; GovtCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;

        }
    }

    keys
    {
        key(Key1; CategCode, Course, Batch, Caste)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

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