table 50135 TransportReg
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "StudentEnrollmennt No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No." where(Transport = const(true));

            trigger OnValidate()
            begin
                if "StudentEnrollmennt No" <> '' then
                    if recStudent.get("StudentEnrollmennt No") then
                        "Student Name" := recStudent.Name + ' ' + recStudent."Name 2";
                Class := recStudent.Class;
                Course := recStudent."Course Code";
                BatchCode := recStudent."Batch Code";
                PhoneNo := recStudent."Phone No.";

            end;
        }
        field(2; "Student Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; RouteNo; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = RouteMaster;
            trigger OnValidate()
            begin
                if RouteNo <> '' then
                    if recRoute.get(RouteNo) then
                        RouteCharges := recRoute.Charge;
            end;

        }
        field(4; RouteCharges; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; SlipNo; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if SlipNo <> xRec.SlipNo then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup.TransportSlipNO);
                    "No. Series" := '';
                end;
            end;
        }
        field(6; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(7; Course; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; BatchCode; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; PhoneNo; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Class; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Open","Closed";
            // trigger OnValidate()
            // begin
            //     recCLE.Reset();
            //     recCLE.SetRange("Document No.", Rec.SlipNo);
            //     if recCLE.FindFirst() then
            //         rec.Status := rec.Status::closed
            //     else
            //         Rec.Status := rec.Status::open;
            // end;
        }
    }

    keys
    {
        key(Key1; SlipNo, "StudentEnrollmennt No", RouteNo)
        {
            Clustered = true;
        }
    }

    var
        recStudent: Record Customer;
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        recRoute: Record RouteMaster;
        recCLE: Record "Cust. Ledger Entry";

    trigger OnInsert()
    begin
        if SlipNo = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField(TransportSlipNO);
            NoSeriesMgt.InitSeries(SalesSetup.TransportSlipNO, xRec."No. Series", 0D, SlipNo, "No. Series");
        end;

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