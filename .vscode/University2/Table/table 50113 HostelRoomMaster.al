table 50113 RoomMaster
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; HostelCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = HostelMaster.HostelCode;
            // trigger OnValidate()
            // begin
            //     if HostelCode <> '' then
            //         if recHostel.Get(HostelCode) then begin
            //             HostelDesc := recHostel.HostelName;
            //         end;
            // end;

        }
        field(2; RoomCode; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; RoomType; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(4; RoomDesc; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(5; Beds; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'No Of Beds';
        }

        // field(6; PerBedFees; Decimal)
        // {
        //     DataClassification = ToBeClassified;

        // }

    }


    keys
    {
        key(Key1; HostelCode, RoomCode, RoomType, Beds)
        {
            Clustered = true;
        }
    }

    // fieldgroups
    // {
    //     fieldgroup(DropDown; RoomType, Beds)
    //     {

    //     }
    // }

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