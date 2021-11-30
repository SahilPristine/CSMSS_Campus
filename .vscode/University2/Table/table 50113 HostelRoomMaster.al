table 50113 RoomMaster
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; HostelCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = HostelMaster.HostelCode;
            trigger OnValidate()
            begin
                if HostelCode <> '' then
                    if recHostel.Get(HostelCode) then begin
                        HostelDesc := recHostel.HostelName;
                    end;
            end;



        }
        field(2; RoomCode; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; RoomType; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(4; Capacity; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(5; Beds; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(6; Floor; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(7; Wings; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(8; PerBedFees; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(9; HostelDesc; Text[50])
        {
            DataClassification = ToBeClassified;
            // TableRelation = HostelMaster.HostelName where (HostelCode = field(HostelCode));
        }
    }

    keys
    {
        key(Key1; HostelCode, RoomCode, RoomType, Beds)
        {
            Clustered = true;
        }
    }

    var
        recHostel: Record HostelMaster;

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