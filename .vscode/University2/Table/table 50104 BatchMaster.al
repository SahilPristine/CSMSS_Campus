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
        recBatch: Record BatchMasterTable;

    trigger OnInsert()
    begin
        recBatch.ChangeCompany('mithilesh');
        recBatch.TransferFields(Rec);
        recBatch.Insert();
    end;

    trigger OnModify()
    begin
        recBatch.ChangeCompany('mithilesh');
        recBatch.TransferFields(Rec);
        recBatch.Modify();

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}