tableextension 50124 SalesSetup extends 311
{
    fields
    {
        field(50000; RegisterationNo; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            Description = 'SL-V.01';
        }
        field(50001; RoomShistRegNo; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            Description = 'SL-V.01';
        }

        field(50002; RegistrationNo; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            Description = 'SL-V.01';
        }
        field(50003; FeesDocNo; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            Description = 'Sl-V.01';
        }
        field(5004; FeesReceipt; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            Description = 'SL-V.01';
        }
        field(5005; GovtCode; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            Description = 'SL-V.01';
        }
    }

    var
        myInt: Integer;
}