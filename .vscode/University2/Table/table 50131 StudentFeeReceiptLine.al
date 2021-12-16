table 50131 StudentFeeReceiptLine
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; DocumentNo; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; PostingDate; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(3; ElementCode; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(4; ElementDesc; text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(5; ElementType; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(6; Amount; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(7; DueDate; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(8; EntryDocNo; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Remaining amt to be adjsuted"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; PaymentReceived; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; DocumentNo, LineNo)
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