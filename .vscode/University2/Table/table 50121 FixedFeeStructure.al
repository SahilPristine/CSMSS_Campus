table 50121 FixedFeeStructure
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CourseCode; Code[20])
        {
            DataClassification = ToBeClassified;

        }

        field(2; SemesterCode; Code[20])
        {
            DataClassification = ToBeClassified;

        }

        field(3; StreamCode; Code[20])
        {
            DataClassification = ToBeClassified;

        }

        field(4; Element; Code[20])
        {
            DataClassification = ToBeClassified;

        }

        field(5; TotalFeesAmount; Code[20])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; CourseCode, "SemesterCode", "StreamCode", "Element")
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