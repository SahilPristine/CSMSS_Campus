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
        field(50004; FeesReceipt; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            Description = 'SL-V.01';
        }
        field(50005; GovtCode; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            Description = 'SL-V.01';
        }
        field(50006; VisitorNo; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            Description = 'SL-V.01';
        }
        field(50007; DefaultHostelElement; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50008; DefaultDepositElement; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50009; TransportSlipNO; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            Description = 'SL-V.01';
        }
        field(50010; DefaultTransportElement; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50011; TransportBalAccType; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
            TableRelation = "G/L Account";
        }
    }

    var
        myInt: Integer;
}