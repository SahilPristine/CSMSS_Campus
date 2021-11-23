table 50112 HostelMaster
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; HostelCode; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; HostelName; Text[30])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; HostelCode)
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