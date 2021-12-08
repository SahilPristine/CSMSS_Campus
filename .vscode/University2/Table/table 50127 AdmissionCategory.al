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
        field(2; College; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Company.Name;

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
        field(5; FeeWaivers; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(6; Description; Text[30])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; CategCode, College, Course, Batch)
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