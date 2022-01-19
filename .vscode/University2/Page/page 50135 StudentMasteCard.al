page 50135 StudentMaster
{
    PageType = Card;
    // ApplicationArea = All;
    // UsageCategory = Administration;
    SourceTable = Customer;
    SourceTableView = where(Type = filter(Student));
    Caption = 'Student Master';
    // Editable = false;
    // SourceTableView = where("Enrollment No" = filter(<> ' '));

    layout
    {
        area(Content)
        {
            group(StudentDetails)
            {
                Caption = 'Student Details';
                // field(StudentCode; rec."No.")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Student Code';
                // }
                field("Enrollment No"; rec."No.")
                {
                    ApplicationArea = All;
                    Editable = False;

                }
                field(Type; rec.Type)
                {
                    ApplicationArea = All;
                    Editable = false;
                    // trigger OnValidate()
                    // var
                    //     NoSeries: Record "No. Series";
                    //     SalesSetup: Record "Sales & Receivables Setup";
                    // begin
                    //     if rec."No." = SalesSetup."Customer Nos." then begin
                    //         rec.Type := Rec.Type::Student;
                    //     end;
                    // end;

                }

                field(FirstName; rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'First Name';

                }
                field(LastName; rec."Name 2")
                {
                    Caption = 'Last Name';
                    ApplicationArea = All;
                    // trigger OnValidate()
                    // begin
                    //     CustRec.Name := rec.Name + '' + rec."Name 2";
                    // end;

                }
                field(DOB; rec.DOB)
                {
                    ApplicationArea = All;
                }
                field("Birth Place"; rec."Birth Place")
                {
                    ApplicationArea = All;
                }
                field(Gender; rec.Gender)
                {
                    ApplicationArea = All;

                }
                field(Category; rec.Category)
                {
                    ApplicationArea = All;
                    Caption = 'Admission Category';
                    Editable = false;
                    // Editable = confirm;

                }
                field(Cast; rec.Cast)
                {
                    ApplicationArea = All;
                    LookupPageId = 50134;
                    Editable = false;

                }
                field(Religion; rec.Religion)
                {
                    ApplicationArea = All;
                }
                field(Nationality; rec.Nationality)
                {
                    ApplicationArea = All;
                }
                field("Aadhar No"; rec."Aadhar No")
                {
                    ApplicationArea = All;
                }
                field("Admission Quota"; rec."Admission Quota")
                {
                    ApplicationArea = All;
                }
                field("Qualifying Exam Details"; rec."Qualifying Exam Details")
                {
                    ApplicationArea = All;
                }
            }
            group("Address Details")
            {
                group("Permanent Address")
                {
                    field("Permanent Address 1"; rec.Address)
                    {
                        ApplicationArea = All;
                        Caption = 'Address Line 1';

                    }
                    field("Permanent Address 2"; rec."Address 2")
                    {
                        ApplicationArea = All;
                        Caption = 'Address Line 2';


                    }
                    field(State; rec.State)
                    {
                        ApplicationArea = All;
                    }
                    field(PinCode; rec."Post Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Pin Code';
                    }
                    field("Country/Region Code"; rec."Country/Region Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Country Code';
                    }
                }
                group("Local Address")
                {
                    field("Local Address 1"; rec."Local Address 1")
                    {
                        ApplicationArea = All;
                        Caption = 'Address Line 1';

                    }
                    field("Local Address 2"; rec."Local Address 2")
                    {
                        ApplicationArea = All;
                        Caption = 'Address Line 2';


                    }
                    field(State2; rec.State2)
                    {
                        ApplicationArea = All;
                        Caption = 'State';
                    }
                    field(PostCode; rec."Pin Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Pin Code';
                    }
                    field("Country Code"; rec."Country Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Country Code';
                    }
                }

            }

            group(PersonalDetails)
            {
                field("Phone No."; rec."Phone No.")
                {
                    ApplicationArea = All;
                    //     trigger OnValidate()
                    //     begin
                    //         CustRec."Phone No." := rec."Phone No.";
                    //     end;
                }
                field("Father's First Name"; rec."Father's First Name")
                {
                    ApplicationArea = All;

                }
                field("Father's Last Name"; rec."Father's Last Name")
                {
                    ApplicationArea = All;

                }
                field("Father's Contact No"; rec."Father's Contact No")
                {
                    ApplicationArea = All;

                }
                field("Father's Email ID"; rec."Father's Email ID")
                {
                    ApplicationArea = All;

                }
                field("E-Mail"; rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Mother's First Name"; rec."Mother's First Name")
                {
                    ApplicationArea = All;

                }
                field("Mother's Last Name"; rec."Mother's Last Name")
                {
                    ApplicationArea = All;

                }
                field("Mother's Contact No"; rec."Mother's Contact No")
                {
                    ApplicationArea = All;

                }
                field("Mother's Email ID"; rec."Mother's Email ID")
                {
                    ApplicationArea = All;

                }
            }

            group(AdmissionDetails)
            {
                field("Batch Code"; rec."Batch Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(AcademicYear; rec.AcademicYear)
                {
                    ApplicationArea = All;
                    CAption = 'Academic Year';
                    Editable = false;
                }

                field("Course Code"; rec."Course Code")
                {
                    ApplicationArea = All;
                    LookupPageId = CourseList;
                    Editable = false;
                }

                field("Semester Code"; rec."Semester Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Stream Code"; rec."Stream Code")
                {
                    ApplicationArea = All;
                    LookupPageId = 50108;
                    Editable = false;
                }
                field(Class; rec.Class)
                {
                    ApplicationArea = All;
                    LookupPageId = 50124;
                    Editable = false;
                }


            }

            group(BankDetails)
            {
                Caption = 'Bank Details';
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = All;

                }
                field("Branch Name"; rec."Branch Name")
                {
                    ApplicationArea = All;

                }
                field("IFSC Code"; rec."IFSC Code")
                {
                    ApplicationArea = All;

                }
                field("Bank Account No"; rec."Bank Account No")
                {
                    ApplicationArea = All;


                }
                field("Application Method"; rec."Application Method")
                {
                    ApplicationArea = All;
                }
            }
            group(Hostel_Transport)
            {
                Caption = 'Hostel & Transport Details';
                group(Hostel)
                {
                    field(AvailHostel; rec.Hostel)
                    {
                        ApplicationArea = All;
                        Caption = 'Hostel';

                    }
                    field(RoomType; rec.RoomType)
                    {

                        ApplicationArea = All;
                        Caption = 'Room Type';
                        // Enabled = editHostel;

                    }
                    field(BedType; rec.BedType)
                    {
                        ApplicationArea = All;
                        Caption = 'Bed Type';
                        // Enabled = editHostel;
                    }
                    field(HostelCode; rec.HostelCode)
                    {
                        ApplicationArea = All;
                        Caption = 'Hostel Code';
                        // Enabled = editHostel;
                    }
                    field(RoomNo; rec.RoomNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Room No';
                        // Enabled = editHostel;
                    }
                }
                group(Transport)
                {
                    field(AvailTransport; rec.Transport)
                    {
                        ApplicationArea = All;
                        Caption = 'Transport';

                    }
                    field(RouteNo; rec.RouteNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Route No';
                        // Enabled = editTransport;
                    }
                    field(Charge; rec.Charge)
                    {
                        ApplicationArea = All;
                        // Enabled = editTransport;
                    }
                }
                group(PostingGroup)
                {
                    field("Customer Posting Group"; rec."Customer Posting Group")
                    {
                        ApplicationArea = All;
                        LookupPageId = "Customer Posting Groups";
                    }
                    field("Gen. Bus. Posting Group"; rec."Gen. Bus. Posting Group")
                    {
                        ApplicationArea = All;
                        LookupPageId = "Gen. Business Posting Groups";
                    }
                }
            }
        }
        area(FactBoxes)
        {
            part(Picture; "Customer Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No.");
                Caption = 'Student Image';
            }
            part(StudentStatisticsFactBox; "Customer Statistics FactBox")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Student Statistics';
                SubPageLink = "No." = FIELD("No."),
                  "Currency Filter" = FIELD("Currency Filter"),
                  "Date Filter" = FIELD("Date Filter"),
                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(18),
                              "No." = FIELD("No.");
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(FeesStructure)
            {
                ApplicationArea = All;
                Caption = 'Fees Structure';
                RunObject = page 50111;
                RunPageLink = StudentEnrollmentNo = field("No.");
                Promoted = true;
                PromotedCategory = Process;
                Image = CheckList;

                trigger OnAction()
                begin
                    // CreateFeesStructure(recStFees, recFees, recStudent);
                end;
            }

            action(ChangeCateg)
            {
                ApplicationArea = All;
                Caption = 'Change Category/Cast';
                Promoted = true;
                PromotedCategory = Process;
                Image = Change;
                trigger OnAction()
                begin
                    OnBeforeChangeCategory(recStFees, recStudent);
                    CurrPage.Close();
                end;

            }
        }
    }

    var
        StudentRegister: Record StudentRegistration;
        recStFees: Record StudentFeeStructure;
        recFees: Record CourseWiseFeeStructure;
        recStudent: Record Customer;
        recCLE: Record "Cust. Ledger Entry";
        recChangeCat: Record Customer;
        recHostel: Record HostelRegistration;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        rec.Type := rec.Type::Student;
    end;

    // trigger OnOpenPage()
    // begin
    //     recHostel.Reset();
    //     recHostel.SetRange(StudentEnrollmentNo, Rec."No.");
    //     if recHostel.FindFirst() then begin
    //         // recStudent.Init();
    //         rec.HostelCode := recHostel.HostelCode;
    //         rec.RoomNo := recHostel.RoomNo;
    //         rec.Modify(true);
    //         // CurrPage.Update(true);
    //     end;
    // end;

    // trigger OnModifyRecord(): Boolean
    // begin

    // end;

    // trigger OnAfterGetCurrRecord()
    // begin
    //     recHostel.Reset();
    //     recHostel.SetRange(StudentEnrollmentNo, Rec."No.");
    //     if recHostel.FindFirst() then begin
    //         recStudent.Init();
    //         rec.HostelCode := recHostel.HostelCode;
    //         rec.RoomNo := recHostel.RoomNo;
    //         rec.Modify(true);
    //         // CurrPage.Update(true);
    //     end;
    // end;

    // trigger OnAfterGetRecord()
    // begin
    //     recHostel.Reset();
    //     recHostel.SetRange(StudentEnrollmentNo, Rec."No.");
    //     if recHostel.FindFirst() then begin
    //         recStudent.Init();
    //         rec.HostelCode := recHostel.HostelCode;
    //         rec.RoomNo := recHostel.RoomNo;
    //         rec.Modify(true);
    //         // CurrPage.Update(true);
    //     end;
    // end;

    local procedure OnBeforeChangeCategory(recStFees: Record StudentFeeStructure; RecStudent: Record Customer)
    var
        Answer: Boolean;
    begin
        recStFees.Reset();
        recStFees.SetRange(StudentEnrollmentNo, rec."No.");
        recStFees.SetRange(DebitCreated, true);
        recStFees.SetRange(StudentEntryReversed, false);
        recStFees.SetRange(GovtEntryReversed, false);
        recStFees.SetRange(Blocked, false);
        if recStFees.FindFirst() then begin
            Message('Sorry!!! Category can not be changed. Please reverse all the open transactions for %1', rec."No.");
            repeat
                Message('Reverse Transactions %1 and %2', recStFees.PostedEntryNo, recStFees.GovtEntryNo);
            until recStFees.Next() = 0;
        end;

        recStFees.Reset();
        recStFees.SetRange(StudentEnrollmentNo, rec."No.");
        recStFees.SetRange(DebitCreated, true);
        recStFees.SetRange(StudentEntryReversed, true);
        recStFees.SetRange(GovtEntryReversed, true);
        recStFees.SetRange(Blocked, false);
        if recStFees.FindFirst() then begin
            recChangeCat.Reset();
            recChangeCat.SetFilter("No.", Rec."No.");
            if not recChangeCat.FindFirst() then begin
                recChangeCat.Init();
                recChangeCat.Validate("No.", Rec."No.");
                recChangeCat.Insert();
            end;
            Page.Run(50137, recChangeCat);
        end;

        recStFees.Reset();
        recStFees.SetRange(StudentEnrollmentNo, rec."No.");
        recStFees.SetRange(DebitCreated, true);
        recStFees.SetRange(StudentEntryReversed, true);
        recStFees.SetRange(GovtEntryReversed, true);
        recStFees.SetRange(Blocked, true);
        if recStFees.FindFirst() then begin
            recChangeCat.Reset();
            recChangeCat.SetFilter("No.", Rec."No.");
            if recChangeCat.FindFirst() then begin
                recChangeCat.Init();
                recChangeCat.Validate("No.", Rec."No.");
                recChangeCat.Insert();
            end;
            Page.Run(50137, recChangeCat);
        end;


        recStFees.Reset();
        recStFees.SetRange(StudentEnrollmentNo, rec."No.");
        recStFees.SetRange(DebitCreated, false);
        recStFees.SetRange(Blocked, false);
        if recStFees.FindFirst() then begin
            recChangeCat.Reset();
            recChangeCat.SetFilter("No.", Rec."No.");
            if not recChangeCat.FindFirst() then begin
                recChangeCat.Init();
                recChangeCat.Validate("No.", Rec."No.");
                recChangeCat.Insert();
            end;
            Page.Run(50137, recChangeCat);

        end;
    end;

}