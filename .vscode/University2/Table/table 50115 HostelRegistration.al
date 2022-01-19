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

        }
        field(2; StudentEnrollmentNo; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No." where(Hostel = const(true));
            trigger OnValidate()
            begin
                if StudentEnrollmentNo <> '' then
                    if recStudent.Get(StudentEnrollmentNo) then begin
                        Name := recStudent.Name + ' ' + recStudent."Name 2";
                        Address := recStudent.Address;
                        Address2 := recStudent."Address 2";
                        Class := recStudent.Class;
                        ContactNo := recStudent."Phone No.";
                        // CollegeName := recStudent.CurrentCompany;
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
        field(5; Name; Text[100])
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
            trigger OnValidate()
            begin
                recRoom.Reset();
                recRoom.SetRange(RoomCode, Rec.RoomNo);
                if recRoom.FindFirst() then begin
                    HostelFees := recRoom.PerBedFees;
                    DepositFees := recRoom.DepositFees;
                    PerMonthFees := HostelFees / 12;
                end;
            end;


        }
        field(13; HostelFees; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(14; DepositFees; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(15; LeftDate; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                fromMonth := Date2DMY(RegistrationDate, 2);
                toMonth := Date2DMY(LeftDate, 2);
                Diff := toMonth - fromMonth;
                Balance := PerMonthFees * Diff;
            end;

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
        field(19; RegType; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","Others","Student";
            trigger OnValidate()
            begin
                if rec.RegType = rec.RegType::Student then
                    EditStudent := true
                else
                    EditStudent := false;
                if rec.RegType = rec.RegType::Others then
                    EditVisitor := true
                else
                    EditVisitor := false;
                Rec.Modify(true);
            end;

        }
        field(20; VisitorNo; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where(Type = filter('Others'));
            trigger OnValidate()
            begin
                if VisitorNo <> '' then
                    if recStudent.Get(VisitorNo) then begin
                        Name := recStudent.Name + ' ' + recStudent."Name 2";
                        Address := recStudent.Address;
                        Address2 := recStudent."Address 2";
                        Class := recStudent.Class;
                        ContactNo := recStudent."Phone No.";
                        // CollegeName := recStudent.CurrentCompany;
                    end;
            end;
        }
        field(21; Balance; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; PerMonthFees; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23; TotalBalance; Decimal)
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
        EditStudent: Boolean;
        EditVisitor: Boolean;
        fromMonth: Integer;
        toMonth: Integer;
        Diff: Integer;

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