table 50134 Change_Category_Cast
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EnrollmentNo; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = Customer."No.";
            trigger OnValidate()
            begin
                recStudent.Reset;
                recStudent.SetRange("No.", EnrollmentNo);
                if recStudent.FindFirst() then begin
                    OldCategory := recStudent.Category;
                    NewCategory := recStudent.Category;
                    OldCast := recStudent.Cast;
                    NewCast := recStudent.Cast;
                    Name := recStudent.Name + ' ' + recStudent."Name 2"
                end;
            end;

        }
        field(2; OldCategory; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; NewCategory; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = AdmissionCategory;
        }
        field(4; OldCast; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; NewCast; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = CasteMaster."Caste Code";
        }
        field(6; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; EnrollmentNo, LineNo)
        {
            Clustered = true;
        }
    }

    var
        recStudent: Record Customer;


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