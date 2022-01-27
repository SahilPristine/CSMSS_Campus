table 50110 FeeStructureElements
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ElementCode; Code[20])
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
        key(Key1; ElementCode)
        {
            Clustered = true;
        }
    }

    var
        recElement: record FeeStructureElements;

    trigger OnInsert()
    begin
        if CompanyName <> 'mithilesh' then begin
            recElement.ChangeCompany('mithilesh');
            recElement.TransferFields(Rec);
            recElement.Insert();
        end;
    end;

    trigger OnModify()
    begin
        if CompanyName <> 'mithilesh' then begin
            recElement.ChangeCompany('mithilesh');
            recElement.TransferFields(Rec);
            recElement.Modify();
        end;

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}