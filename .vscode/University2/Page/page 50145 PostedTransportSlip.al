page 50145 PostedTransportSlip
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = TransportReg;
    SourceTableView = where(Status = filter(Closed));
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater("Transport Registeration")
            {
                field(SlipNo; rec.SlipNo)
                {
                    ApplicationArea = All;
                    Caption = 'Transport Slip No';
                }
                field("StudentEnrollmennt No"; rec."StudentEnrollmennt No")
                {
                    ApplicationArea = All;

                }
                field("Student Name"; rec."Student Name")
                {
                    ApplicationArea = All;
                }
                field(Class; rec.Class)
                {
                    ApplicationArea = All;
                }
                field(Course; rec.Course)
                {
                    ApplicationArea = All;
                }
                field(BatchCode; rec.BatchCode)
                {
                    ApplicationArea = All;
                }
                field(PhoneNo; rec.PhoneNo)
                {
                    ApplicationArea = All;
                }
                field(RouteNo; rec.RouteNo)
                {
                    ApplicationArea = All;
                    LookupPageId = RouteMaster;
                }
                field(RouteCharges; rec.RouteCharges)
                {
                    ApplicationArea = All;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = All;
                }
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
    var
        recCLE: Record "Cust. Ledger Entry";

    // trigger OnAfterGetRecord()
    // begin
    //     recCLE.reset();
    //     recCLE.SetRange("Document No.", rec.SlipNo);
    //     if recCLE.FindFirst() then
    //         rec.Status := rec.Status::Closed
    //     else
    //         rec.Status := Rec.Status::Open;
    // end;
}