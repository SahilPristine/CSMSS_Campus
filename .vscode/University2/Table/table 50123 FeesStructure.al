table 50123 FeesStructure
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CourseCode; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = CourseMasterTable;

        }
        field(2; Stream; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = StreamMasterTable.StreamCode where(CourseCode = field(CourseCode));

        }
        field(3; Semester; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = SemesterMasterTable.SemesterCode where(CourseCode = field(CourseCode));

        }
        field(4; Elements; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = CourseMasterTable;

        }
        field(5; AmountType; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "FinalAmount","%age";
            TableRelation = CourseMasterTable;

        }
        field(6; Amount; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = CourseMasterTable;

        }
        field(7; DebitAcc; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(8; CreditAcc; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(9; Category; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "SC/ST","OBC","Gen";
            TableRelation = "G/L Account"."No.";
        }
        field(10; AdmissionCategory; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Regular","EBC","MannagementQuota";
            TableRelation = "G/L Account"."No.";
        }

    }

    keys
    {
        key(Key1; CourseCode, Stream)
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