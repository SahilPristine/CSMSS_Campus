table 50115 HostelRegistration
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; RegistrationNo; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if RegistrationNo <> xRec.RegistrationNo then begin
                    recSalesSetup.Get();
                    NoSeriesMgt.TestManual(recSalesSetup.RegisterationNo);
                    "No. Series" := '';
                end;
            end;
            // trigger OnValidate()
            // begin
            // if RegistrationNo <> xRec.RegistrationNo then
            // begin
            //     recGLSetup.Get();
            //     NoSeriesMgt.TestManual(recGLSetup.RegisterationNo);
            //     No. Series"
            // end;
            // end;
            // trigger OnValidate()
            // begin
            //     RegistrationNo := recGLSetup.RegisterationNo
            // end;

            // AutoIncrement = true;

        }
        field(2; StudentCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
            trigger OnValidate()
            begin
                if StudentCode <> '' then
                    if recStudent.Get(StudentCode) then begin
                        StudentName := recStudent.Name + ' ' + recStudent."Name 2";
                        Address := recStudent.Address;
                        Address2 := recStudent."Address 2";
                        Class := recStudent.Class;
                        ContactNo := recStudent."Phone No.";

                    end;


            end;

        }
        field(3; RegistrationDate; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(4; CollegeName; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Company;

        }
        field(5; StudentName; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(6; Address; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(7; Address2; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }

        field(8; Class; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = ClassMaster;
            Editable = false;

        }
        field(9; ContactNo; Code[15])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(11; HostelCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = HostelMaster;
            trigger OnValidate()
            begin
                if HostelCode <> '' then
                    if recHostel.Get(HostelCode) then begin
                        HostelName := recHostel.HostelName;
                    end;

            end;

        }

        field(18; HostelName; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; RoomNo; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = RoomMaster.RoomCode;
            // trigger OnValidate()
            // begin
            //     if RoomNo <> '' then begin
            //         if recRoom.get(RoomNo) then
            //             HostelFees := recRoom.PerBedFees;
            //     end;
            //     // recStudent.Reset();
            //     // recStudent.SetRange("No.", StudentCode);
            //     // if recStudent.FindFirst() then begin
            //     //     recStudent.HostelCode := HostelCode;
            //     //     recStudent.RoomNo := RoomNo;
            //     // end;
            // end;


        }
        field(13; HostelFees; Decimal)
        {
            DataClassification = ToBeClassified;
            // FieldClass = FlowField;
            // CalcFormula = lookup(RoomMaster.PerBedFees where(RoomCode = field(RoomNo)));
            // TableRelation = RoomMaster.PerBedFees where(RoomCode = field(RoomNo));

        }
        field(14; DepositFees; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(15; LeftDate; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(16; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(17; Left; Boolean)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; RegistrationNo)
        {
            Clustered = true;
        }

    }

    var
        recStudent: Record Customer;
        recSalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        recRoom: Record 50113;
        recHostel: Record HostelMaster;

    trigger OnInsert()
    begin
        if RegistrationNo = '' then begin
            recSalesSetup.Get();
            recSalesSetup.TestField(RegisterationNo);
            NoSeriesMgt.InitSeries(recSalesSetup.RegisterationNo, xRec."No. Series", 0D, RegistrationNo, "No. Series");
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