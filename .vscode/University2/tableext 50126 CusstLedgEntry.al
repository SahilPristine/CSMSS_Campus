tableextension 50126 CusstLedgEntry extends 21
{
    fields
    {
        field(50000; ElementCode; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; ElementDesc; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; ElementType; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        // Add changes to table fields here
    }

    var
        myInt: Integer;
}