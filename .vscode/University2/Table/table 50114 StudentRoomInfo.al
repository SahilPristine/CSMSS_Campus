table 50114 RoomStudentinfo
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EntryNo; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; StudentCode; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; StudentName; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(StudentMaster.StudentName where(StudentCode = field("StudentCode")));

        }
        field(4; HostelCode; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(5; RoomCode; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(6; AssignmentDate; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(7; LeftDate; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(8; Active; Boolean)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; EntryNo)
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