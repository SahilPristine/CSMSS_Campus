table 50130 PostedCustLedg
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CustomerNo; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(9; CustomerName; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; DocumentNo; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; PostingDate; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(4; ElementCode; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(5; ElementDesc; text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(6; ElementType; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(7; Amount; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(8; DueDate; Date)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; CustomerNo, ElementCode)
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