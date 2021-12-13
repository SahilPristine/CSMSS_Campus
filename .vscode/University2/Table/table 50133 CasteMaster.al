table 50133 CasteMaster
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Caste Code"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Description"; Text[30])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; "Caste Code")
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