table 50120 StudentHistory
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; StudentID; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(3; "College/Board"; Text[30])
        {
            DataClassification = ToBeClassified;
        }

        field(4; Course; Text[30])
        {
            DataClassification = ToBeClassified;
        }

        field(5; SubCourse; Text[30])
        {
            DataClassification = ToBeClassified;
        }

        field(6; Subject; Text[30])
        {
            DataClassification = ToBeClassified;
        }

        field(7; "Marks%"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(8; HistoryType; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","University Transfer","LateralEntry","Normal";
        }
    }

    keys
    {
        key(Key1; StudentID, "HistoryType", "LineNo")
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