tableextension 50125 GenJournal extends 81
{
    fields
    {
        modify("Customer Id")
        {
            Caption = 'Student ID';
        }
        field(50000; ElementCode; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; ElementType; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; ElementDesc; Text[50])
        {
            DataClassification = ToBeClassified;
        }


    }

    var
        myInt: Integer;
}