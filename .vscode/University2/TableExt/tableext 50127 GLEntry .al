tableextension 50127 GLEntry extends 17
{
    fields
    {
        field(50000; ElementCode; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; ElementDesc; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; ElementType; option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Earning,Deduction;
        }
        // Add changes to table fields here
    }

    var
        myInt: Integer;
}