table 50108 StreamMasterTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CourseCode; Code[20])
        {
            DataClassification = ToBeClassified;

            // OptionMembers = "B.A.M.S","MD/MS(AYURVED)","PHD","BDS","B.SC","DIPLOMA","B.TECH","M.Tech";
            TableRelation = CourseMasterTable.CODE;


        }
        field(2; StreamCode; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "CS","Mech","EC","Civil","EE";

        }
        field(3; Description; Text[50])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; CourseCode, StreamCode, Description)
        {
            Clustered = true;
        }
    }

    var
    // CourseRec: Record 50106;

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