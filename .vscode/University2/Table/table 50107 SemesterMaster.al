table 50107 SemesterMasterTable
{
    DataClassification = ToBeClassified;
    LookupPageId = 50107;

    fields
    {
        field(1; CourseCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = CourseMasterTable.CODE;

        }
        field(2; StreamCode; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; SemesterCode; Code[20])
        {
            DataClassification = ToBeClassified;


        }
        field(4; Description; Text[50])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; CourseCode, StreamCode, SemesterCode)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; CourseCode, Description)
        {

        }
        fieldgroup(Brick; CourseCode, Description)
        {

        }
    }

    var
        recSem: Record SemesterMasterTable;

    trigger OnInsert()
    begin
        if CompanyName <> 'mithilesh' then begin
            recSem.ChangeCompany('mithilesh');
            recSem.TransferFields(Rec);
            recSem.Insert();
        end;


    end;

    trigger OnModify()
    begin
        if CompanyName <> 'mithilesh' then begin
            recSem.ChangeCompany('mithilesh');
            recSem.TransferFields(Rec);
            recSem.modify();
        end;

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}