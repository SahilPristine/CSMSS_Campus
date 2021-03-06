table 50126 StudentRoomShifting
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; RegistrationNo; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = HostelRegistration.RegistrationNo;
            trigger OnValidate()
            begin
                if RegistrationNo <> '' then
                    if recHostel.Get(RegistrationNo) then begin
                        EnrollmentNo := recHostel.StudentEnrollmentNo;
                        StudentName := recHostel.Name;
                        RegistrationDate := recHostel.RegistrationDate;
                        CollegeName := recHostel.CollegeName;
                        Address := recHostel.Address;
                        Address2 := recHostel.Address2;
                        Class := recHostel.Class;
                        ContactNo := recHostel.ContactNo;
                        HostelCode := recHostel.HostelCode;
                        HostelName := recHostel.HostelName;
                        RoomNo := recHostel.RoomNo;
                        HostelFees := recHostel.HostelFees;
                    end;
            end;

        }
        field(14; ShiftingNo; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if ShiftingNo <> xRec.ShiftingNo then begin
                    recSalesSetup.Get();
                    NoSeriesMgt.TestManual(recSalesSetup.RoomShistRegNo);
                    "No. Series" := '';
                end;
            end;
        }
        field(2; EnrollmentNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(3; RegistrationDate; Date)
        {
            DataClassification = ToBeClassified;
            editable = false;

        }
        field(4; CollegeName; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;

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
            Editable = false;


        }
        field(9; ContactNo; Code[15])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(10; HostelName; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(11; RoomNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(12; NewHostelName; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; NewRoomNo; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = RoomMaster.RoomCode;
            trigger OnValidate()
            begin
                recRoom.Reset();
                recRoom.SetRange(RoomCode, NewRoomNo);
                if recRoom.FindFirst() then begin
                    NewHostelFees := recRoom.PerBedFees;
                    StudentBalance := NewHostelFees - HostelFees;
                end;
            end;
        }
        field(15; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(16; NewHostelCode; Code[20])
        {
            Caption = 'New Hostel Code';
            TableRelation = HostelMaster.HostelCode;
            trigger OnValidate()
            begin
                if NewHostelCode <> '' then
                    if recHostelMaster.Get(NewHostelCode) then begin
                        NewHostelName := recHostelMaster.HostelName;
                    end;

            end;
        }
        field(17; RoomShiftingDate; Date)
        {
            Caption = 'Room Shifting Date';
            trigger OnValidate()
            begin

            end;
            // trigger OnValidate()
            // begin
            //     recHostel.Reset();
            //     recHostel.SetRange(RegistrationNo, RegistrationNo);
            //     if recHostel.FindFirst() then begin
            //         // recHostel.Left := true;
            //         recHostel.LeftDate := RoomShiftingDate;
            //         recHostel.Modify(true);
            //     end;
            // end;
        }
        field(18; NewHostelFees; Decimal)
        {
            Caption = 'New Hostel Charges';
        }
        field(20; HostelCode; Code[20])
        {
            Caption = 'Hostel Code';
        }
        field(21; HostelFees; Decimal)
        {
            Caption = 'Hostel Fees';
        }
        field(22; StudentBalance; Decimal)
        {
            Caption = 'Student Balance';
        }

    }

    keys
    {
        key(Key1; ShiftingNo, RegistrationNo)
        {
            Clustered = true;
        }
    }

    var
        recHostel: Record HostelRegistration;
        recSalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        recRoom: Record RoomMaster;
        recHostelMaster: Record HostelMaster;

    trigger OnInsert()
    begin
        if ShiftingNo = '' then begin
            recSalesSetup.Get();
            recSalesSetup.TestField(RoomShistRegNo);
            NoSeriesMgt.InitSeries(recSalesSetup.RoomShistRegNo, xRec."No. Series", 0D, ShiftingNo, "No. Series");
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