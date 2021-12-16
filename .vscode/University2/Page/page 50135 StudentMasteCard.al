page 50135 StudentMaster
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    Caption = 'Student Master';
    Editable = false;
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
                    // Editable = confirm;

                }
                field(Cast; rec.Cast)
                {
                    ApplicationArea = All;
                    LookupPageId = 50134;

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
                // field(LateralEntry; rec.LateralEntry)
                // {
                //     ApplicationArea = All;
                // }
                // field(UniversityTransferProgram; rec.UniversityTransferProgram)
                // {
                //     ApplicationArea = All;

                // }
                field("Batch Code"; rec."Batch Code")
                {
                    ApplicationArea = All;
                }
                field(AcademicYear; rec.AcademicYear)
                {
                    ApplicationArea = All;
                    CAption = 'Academic Year';
                }

                field("Course Code"; rec."Course Code")
                {
                    ApplicationArea = All;
                    LookupPageId = CourseList;
                }

                field("Semester Code"; rec."Semester Code")
                {
                    ApplicationArea = All;
                }
                field("Stream Code"; rec."Stream Code")
                {
                    ApplicationArea = All;
                    LookupPageId = 50108;
                }
                field(Class; rec.Class)
                {
                    ApplicationArea = All;
                    LookupPageId = 50124;
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
                        // trigger OnValidate()
                        // begin
                        //     if rec.Hostel = true then
                        //         editHostel := true
                        //     else
                        //         editHostel := false;
                        //     CurrPage.Update(true);
                        // end;

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
                        // trigger OnValidate()
                        // begin
                        //     if rec.Transport = true then
                        //         editTransport := true
                        //     else
                        //         editTransport := false;
                        //     CurrPage.Update(true);
                        // end;

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


                end;
            }
        }
    }

    var
        StudentRegister: Record StudentRegistration;

    trigger OnOpenPage()
    begin

    end;
}