table 50105 AcademicYearMasterTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CODE; Code[20])
        {
            DataClassification = ToBeClassified;

        }

        field(2; Description; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "From Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(4; "To Date"; Date)
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
        recAcademic: Record AcademicYearMasterTable;

    trigger OnInsert()
    begin
        recAcademic.ChangeCompany('mithilesh');
        recAcademic.TransferFields(Rec);
        recAcademic.Insert();

    end;

    trigger OnModify()
    begin
        recAcademic.ChangeCompany('mithilesh');
        recAcademic.TransferFields(Rec);
        recAcademic.Modify();

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}