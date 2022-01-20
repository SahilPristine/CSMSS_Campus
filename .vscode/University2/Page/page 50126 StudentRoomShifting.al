page 50126 StudentRoomShifting
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 50126;
    Caption = 'Room Shifting';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Registeration Details';
                field(RegistrationNo; Rec.RegistrationNo)
                {
                    ApplicationArea = All;
                    Caption = 'Registration No';

                }
                field(ShiftingNo; rec.ShiftingNo)
                {
                    ApplicationArea = All;
                    Caption = 'Shifting No';
                }
                field(EnrollmentNo; rec.EnrollmentNo)
                {
                    ApplicationArea = All;
                    Caption = 'Student Enrollment No';

                }
                field(RegistrationDate; Rec.RegistrationDate)
                {
                    ApplicationArea = All;
                    Caption = 'Hostel Admission Date';

                }
                field(CollegeName; Rec.CollegeName)
                {
                    ApplicationArea = All;
                    Caption = 'College Name';

                }
                field(RoomShiftingDate; rec.RoomShiftingDate)
                {
                    ApplicationArea = All;
                    Caption = 'Room Shifting Date';
                    // trigger OnValidate()
                    // begin
                    //     recHostel.Reset();
                    //     recHostel.SetRange(RegistrationNo, rec.RegistrationNo);
                    //     if recHostel.FindFirst() then begin
                    //         recHostel.Left := true;
                    //         recHostel.LeftDate := rec.RoomShiftingDate;
                    //         CurrPage.Update(true);
                    //     end;
                    // end;
                }
            }
            group(StudentDetails)
            {
                Caption = 'Student Details';
                field(StudentName; Rec.StudentName)
                {
                    ApplicationArea = All;
                    Caption = 'Student Name';

                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    Caption = 'Address Line 1';

                }
                field(Address2; rec.Address2)
                {
                    ApplicationArea = All;
                    Caption = 'Address Line 2';
                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = All;

                }
                field(ContactNo; Rec.ContactNo)
                {
                    ApplicationArea = All;
                    Caption = 'Contact No';
                }
                field(HostelCode; rec.HostelCode)
                {
                    ApplicationArea = All;
                    Caption = 'Hostel Code';
                }
                field(HostelName; Rec.HostelName)
                {
                    ApplicationArea = All;
                    Caption = 'Hostel Name';

                }
                field(RoomNo; Rec.RoomNo)
                {
                    ApplicationArea = All;
                    Caption = 'Room No';

                }
                field(HostelFees; rec.HostelFees)
                {
                    ApplicationArea = All;
                    Caption = 'Hostel Fees';
                }

            }
            group(NewHostel)
            {
                Caption = 'New Hostel Details';
                field(NewHostelCode; rec.NewHostelCode)
                {
                    ApplicationArea = All;
                    Caption = 'New Hostel Code';
                }
                field(NewHostelName; rec.NewHostelName)
                {
                    ApplicationArea = All;
                    Caption = 'New Hostel Name';
                }
                field(NewRoomNo; rec.NewRoomNo)
                {
                    ApplicationArea = All;
                    Caption = 'New Room No';
                }
                field(NewHostelFees; rec.NewHostelFees)
                {
                    ApplicationArea = All;
                    Caption = 'New Hostel Charges';
                }
                field(StudentBalance; rec.StudentBalance)
                {
                    ApplicationArea = All;
                    Caption = 'Student Balance';
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Shift)
            {
                ApplicationArea = All;
                Caption = 'Shift Room';
                Promoted = true;
                PromotedCategory = Process;
                Image = NewTransferOrder;

                trigger OnAction()
                begin

                    Clear(lineno);
                    RecGenJoun.Reset();
                    RecGenJoun.SetRange("Journal Template Name", 'GENERAL');
                    RecGenJoun.SetRange("Journal Batch Name", 'HOSTELFEE');
                    RecGenJoun.DeleteAll();

                    RecGenJoun.Reset();
                    RecGenJoun.SetRange("Journal Template Name", 'GENERAL');
                    RecGenJoun.SetRange("Journal Batch Name", 'HOSTELFEE');
                    if RecGenJoun.FindLast() then
                        lineno := RecGenJoun."Line No."
                    else
                        lineno := 10000;

                    GJL.Init();
                    GJL.Validate("Journal Template Name", 'GENERAL');
                    GJL.Validate("Journal Batch Name", 'HOSTELFEE');
                    GJL."Line No." := lineno + 10000;
                    GJL.Insert(true);
                    GJL.Validate("Posting Date", today);
                    GJL.validate("Document No.", Rec.ShiftingNo);
                    GJL.validate("Document Type", GJL."Document Type"::Payment);
                    // IF Rec."Mode Of Payment" = Rec."Mode Of Payment"::Cash then begin
                    //     GJL.validate("Account Type", GJL."Account Type"::"G/L Account");
                    //     GJL.Validate("Account No.", Rec.GLAccNo)
                    // end;
                    // if Rec."Mode Of Payment" = Rec."Mode Of Payment"::BankTransfer then begin
                    //     GJL.validate("Account Type", gjl."Account Type"::"Bank Account");
                    //     GJL.Validate("Account No.", rec.BankAccNo);
                    // end;

                    GJL.Validate(Amount, Rec.StudentBalance);
                    GJL.validate("Account Type", GJL."Account Type"::Customer);
                    GJL.Validate("Account No.", Rec.EnrollmentNo);
                    GJL.Validate(ElementCode, SalesSetup.DefaultHostelElement);
                    // gjl.Validate(ElementDesc, RecPostedLine.ElementDesc);
                    GJL.Modify(true);

                    recStudent.Reset();
                    recStudent.SetRange("No.", rec.EnrollmentNo);
                    if recStudent.FindFirst() then begin
                        // recStudent.Init();
                        recStudent.HostelCode := rec.NewHostelCode;
                        recStudent.RoomNo := rec.NewRoomNo;
                        recStudent.Modify(true);
                        // CurrPage.Update(true);
                    end;
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post");


                end;
            }
        }
    }

    var
        recHostel: Record HostelRegistration;
        GJL: Record "Gen. Journal Line";
        RecGenJoun: record "Gen. Journal Line";
        lineno: Integer;
        SalesSetup: Record "Sales & Receivables Setup";
        recStudent: Record Customer;

    // trigger OnModifyRecord(): Boolean
    // begin
    //     CurrPage.Update(true);
    // end;
}