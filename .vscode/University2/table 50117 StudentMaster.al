table 50117 StudentMaster
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; StudentCode; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; StudentName; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Place; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(4; Address; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(5; BatchCode; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(6; Category; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "SC/ST","OBC","UR","PWD";

        }
        field(7; FeesRate; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(8; EnrollmentNo; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(9; TotalCalculatedFees; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(10; BankCategory; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "A","B";
        }
        field(11; BankAccNo; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(12; BankName; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(13; BranchName; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(14; IFSC; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(15; ParentMobile; Text[10])
        {
            DataClassification = ToBeClassified;

        }
        field(16; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "X","Y","Z";

        }
        field(17; ContactNo; Text[10])
        {
            DataClassification = ToBeClassified;

        }
        field(18; Branch; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(19; AdmissionType; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(20; AdmissionYear; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(21; Image; Blob)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; StudentCode)
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