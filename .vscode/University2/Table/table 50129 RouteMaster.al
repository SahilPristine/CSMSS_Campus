table 50129 RouteMaster
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; RouteNo; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Charge; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; RouteNo)
        {
            Clustered = true;
        }
    }

    var
        recRoute: Record RouteMaster;

    trigger OnInsert()
    begin
        if CompanyName <> 'mithilesh' then begin
            recRoute.ChangeCompany('mithilesh');
            recRoute.TransferFields(Rec);
            recRoute.Insert();
        end;

    end;

    trigger OnModify()
    begin
        if CompanyName <> 'mithilesh' then begin
            recRoute.ChangeCompany('mithilesh');
            recRoute.TransferFields(Rec);
            recRoute.Modify();
        end;

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}