table 50125 StudentClassAllotment
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; StudentCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";

        }
        field(2; AcademicYear; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = AcademicYearMasterTable.CODE;

        }
        field(3; YearBegin; Text[10])
        {
            DataClassification = ToBeClassified;

        }
        field(4; YearEnd; Text[10])
        {
            DataClassification = ToBeClassified;

        }
        field(5; Class; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = ClassMaster.Description;

        }
    }

    keys
    {
        key(Key1; StudentCode, AcademicYear)
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