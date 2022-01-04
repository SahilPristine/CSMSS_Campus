table 50104 BatchMasterTable
{
    DataClassification = ToBeClassified;
    LookupPageId = BatchList;
    fields
    {
        field(1; CODE; Code[10])
        {
            DataClassification = ToBeClassified;

        }

        field(2; Description; Text[30])
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
        batch: Record BatchMasterTable;

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