table 50106 CourseMasterTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CODE; Code[20])
        {
            DataClassification = ToBeClassified;
            // OptionMembers = "B.A.M.S","MD/MS(AYURVED)","PHD","BDS","B.SC","DIPLOMA","B.TECH","M.Tech";
        }

        field(2; Description; Text[30])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
        }

        field(3; Duration; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "UG","PG";
        }
        field(5; Stream; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; CODE)
        {
            Clustered = true;
        }
    }

    var
        recCourse: record CourseMasterTable;

    trigger OnInsert()
    begin
        recCourse.ChangeCompany('mithilesh');
        recCourse.TransferFields(Rec);
        recCourse.Insert();

    end;

    trigger OnModify()
    begin
        recCourse.ChangeCompany('mithilesh');
        recCourse.TransferFields(Rec);
        recCourse.Modify();

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}