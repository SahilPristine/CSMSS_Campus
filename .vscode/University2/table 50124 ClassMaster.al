table 50124 ClassMaster
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CODE; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[50])
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