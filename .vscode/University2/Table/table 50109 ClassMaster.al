table 50109 ClassMasterTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CourseCode; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Stream; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Semester; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(4; Class; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(5; Description; Text[30])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; CourseCode, Stream, Semester, Class)
        {
            Clustered = true;
        }
    }

    var
        recClass: Record ClassMasterTable;

    trigger OnInsert()
    begin
        recClass.ChangeCompany('mithilesh');
        recClass.TransferFields(Rec);
        recClass.Insert();

    end;

    trigger OnModify()
    begin
        recClass.ChangeCompany('mithilesh');
        recClass.TransferFields(Rec);
        recClass.Insert();

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}