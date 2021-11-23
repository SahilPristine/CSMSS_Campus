table 50122 CollegeSetup
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; College; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Company;

        }
        field(2; HostelRegistrationNo; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

        }
    }

    keys
    {
        key(Key1; College)
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