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
        field(2; StreamCode; Code[20])
        {
            DataClassification = ToBeClassified;
            // OptionMembers = "CS","Mech","EC","Civil","EE";

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
        recStream: Record StreamMasterTable;

    trigger OnInsert()
    begin
        if CompanyName <> 'mithilesh' then begin
            recStream.ChangeCompany('mithilesh');
            recStream.TransferFields(Rec);
            recStream.Insert();
        end;

    end;

    trigger OnModify()
    begin
        if CompanyName <> 'mithilesh' then begin
            recStream.ChangeCompany('mithilesh');
            recStream.TransferFields(Rec);
            recStream.Modify();
        end;

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}