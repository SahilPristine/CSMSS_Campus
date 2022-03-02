table 50127 AdmissionCategory
{
    DataClassification = ToBeClassified;
    LookupPageId = 50127;

    fields
    {
        field(1; CategCode; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Course; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = CourseMasterTable.CODE;

        }
        field(4; Element; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Student Fees %"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                IF "Student Fees %" <> 0 THEN begin
                    "Govt Fees %" := 100 - "Student Fees %";
                end;

            end;
        }
        field(6; "Govt Fees %"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Govt Fees %" <> 0 then begin
                    "Student Fees %" := 100 - "Govt Fees %";
                end;
            end;
        }
        field(7; GovtCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where(Type = const(Others));
        }
    }

    keys
    {
        key(Key1; CategCode, Course)
        {
            Clustered = true;
        }
    }

    var
        recCategory: Record AdmissionCategory;

    trigger OnInsert()
    begin
        if CompanyName <> 'mithilesh' then begin
            recCategory.ChangeCompany('mithilesh');
            recCategory.TransferFields(Rec);
            recCategory.Insert();
        end;
    end;

    trigger OnModify()
    begin
        if CompanyName <> 'mithilesh' then begin
            recCategory.ChangeCompany('mithilesh');
            recCategory.TransferFields(Rec);
            recCategory.Insert();
        end;

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}