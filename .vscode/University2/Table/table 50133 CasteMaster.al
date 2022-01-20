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
        recCaste: Record CasteMaster;

    trigger OnInsert()
    begin
        if CompanyName <> 'mithilesh' then begin
            recCaste.ChangeCompany('mithilesh');
            recCaste.TransferFields(Rec);
            recCaste.Insert();
        end;
    end;

    trigger OnModify()
    begin
        if CompanyName <> 'mithilesh' then begin
            recCaste.ChangeCompany('mithilesh');
            recCaste.TransferFields(Rec);
            recCaste.Insert();
        end;
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}