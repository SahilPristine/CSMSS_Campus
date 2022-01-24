page 50142 TransportationList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = TransportReg;
    SourceTableView = where(Status = filter(Open));

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
            action(Confirm)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Confirm;

                trigger OnAction()
                begin

                    Clear(lineno);
                    GJL.Reset();
                    GJL.SetRange("Journal Template Name", 'GENERAL1');
                    GJL.SetRange("Journal Batch Name", 'DEFAULT');
                    GJL.DeleteAll();

                    GJL.Reset();
                    GJL.SetRange("Journal Template Name", 'GENERAL1');
                    GJL.SetRange("Journal Batch Name", 'DEFAULT');
                    if GJL.FindLast() then
                        lineno := GJL."Line No."
                    else
                        lineno := 10000;


                    RecGenJoun.Init();
                    RecGenJoun."Posting Date" := Today;
                    RecGenJoun."Journal Template Name" := 'GENERAL1';
                    RecGenJoun."Journal Batch Name" := 'DEFAULT';
                    RecGenJoun."Line No." := LineNo + 10000;
                    SalesSetup.Get();
                    RecGenJoun."Bal. Account No." := SalesSetup.TransportBalAccType;
                    RecGenJoun.ElementCode := SalesSetup.DefaultTransportElement;
                    // RecGenJoun.Insert(true);
                    RecGenJoun."Document Type" := RecGenJoun."Document Type"::" ";
                    RecGenJoun."Document No." := rec.SlipNo;
                    RecGenJoun."Account Type" := RecGenJoun."Account Type"::Customer;
                    RecGenJoun."Bal. Account Type" := RecGenJoun."Bal. Account Type"::"G/L Account";
                    RecGenJoun."Account No." := rec."StudentEnrollmennt No";
                    RecGenJoun.Amount := rec.RouteCharges;
                    RecGenJoun.Insert(true);
                    Message('Transport fees debit created for student %1', rec."StudentEnrollmennt No");
                    // RecGenJoun.validate("Bal. Account No.", recStFees.CreditAcc);
                    // Codeunit.Run(Codeunit::"Gen. Jnl.-Post", RecGenJoun);

                end;
            }
        }
    }

    var
        myInt: Integer;
        RecGenJoun: Record "Gen. Journal Line";
        GJL: Record "Gen. Journal Line";
        lineno: integer;
        SalesSetup: Record "Sales & Receivables Setup";
        Batch: Code[20];
        Template: Code[20];
        recBatch: Record "Gen. Journal Batch";
        DocNum: Code[20];
        noseriesmgmt: Codeunit NoSeriesManagement;
        PostingDate: Date;
        RecStudentFees: Record StudentFeeStructure;
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