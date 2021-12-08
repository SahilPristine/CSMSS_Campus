page 50117 StudentMaster
{
    PageType = Card;
    Caption = 'Student Master';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    PopulateAllFields = true;

    layout
    {
        area(Content)
        {
            group(StudentDetails)
            {
                Caption = 'Student Details';
                field(StudentCode; rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Student Code';
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
                    trigger OnValidate()
                    begin
                        CustRec.Name := rec.Name + '' + rec."Name 2";
                    end;

                }
                field(Gender; rec.Gender)
                {
                    ApplicationArea = All;

                }
                field(Category; rec.Category)
                {
                    ApplicationArea = All;

                }
            }
            group(PersonalDetails)
            {
                field("Phone No."; rec."Phone No.")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CustRec."Phone No." := rec."Phone No.";
                    end;
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
            group("Address Details")
            {

                field("Permanent Address 1"; rec.Address)
                {
                    ApplicationArea = All;

                }
                field("Permanent Address 2"; rec."Address 2")
                {
                    ApplicationArea = All;

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
            group(AdmissionDetails)
            {
                field(LateralEntry; rec.LateralEntry)
                {
                    ApplicationArea = All;
                }
                field(UniversityTransferProgram; rec.UniversityTransferProgram)
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
                field("Batch Code"; rec."Batch Code")
                {
                    ApplicationArea = All;

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
                // field(ConfirmEnroll; rec.ConfirmEnroll)
                // {
                //     ApplicationArea = All;
                //     trigger OnValidate()
                //     begin
                //         Enroll := rec.ConfirmEnroll;
                //     end;

                //     //     trigger OnValidate()
                //     //     begin
                //     //         If rec.ConfirmEnroll then
                //     //             isVisible3 := true else
                //     //             isVisible3 := false;
                //     //     end;
                // }
                // group("HideGroup3")
                // {
                //     Visible = isVisible3;
                //     ShowCaption = false;
                field("Enrollment No"; rec."Enrollment No")
                {
                    ApplicationArea = All;
                    Editable = False;

                }

            }
            group(Hostel_Transport)
            {
                field(Hostel; rec.Hostel)
                {
                    ApplicationArea = All;

                }
                field(RoomType; rec.RoomType)
                {

                    ApplicationArea = All;
                    Caption = 'Room Type';

                }
                field(BedType; rec.BedType)
                {
                    ApplicationArea = All;
                    Caption = 'Bed Type';
                }
                field(HostelCode; rec.HostelCode)
                {
                    ApplicationArea = All;
                    Caption = 'Hostel Code';
                }
                field(RoomNo; rec.RoomNo)
                {
                    ApplicationArea = All;
                    Caption = 'Room No';
                }
                field(Transport; rec.Transport)
                {
                    ApplicationArea = All;

                }
                field(RouteNo; rec.RouteNo)
                {
                    ApplicationArea = All;
                    Caption = 'Route No';
                }
                field(Charge; rec.Charge)
                {
                    ApplicationArea = All;
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
            }
            group(FeesDetails)
            {
                Caption = 'Fees Details';
                field("Fees Rate"; rec."Fees Rate")
                {
                    ApplicationArea = All;

                }
                field("Total Course Fees"; rec."Total Course Fees")
                {
                    ApplicationArea = All;

                }
                field(AdmissionType; rec.AdmissionType)
                {
                    ApplicationArea = All;
                    Caption = 'Admission Type';

                }
                field(Status; rec.Status)
                {
                    ApplicationArea = All;

                }
                field("Application Method"; rec."Application Method")
                {
                    ApplicationArea = All;
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
                RunPageLink = StudentID = field("No.");
                Promoted = true;
                PromotedCategory = Process;
                Image = CheckList;

                trigger OnAction()
                begin


                end;
            }
            action(ConfirmEnroll)
            {
                ApplicationArea = All;
                Caption = 'Confirm Enrollment';
                Promoted = true;
                PromotedCategory = Process;
                Image = Post;
                trigger OnAction()
                var
                    Question: Text;
                    Answer: Boolean;
                    Text000: Label 'Do you want to confirm enrollment?';

                begin
                    Question := Text000;
                    Answer := Dialog.Confirm(Question, true);
                    if Answer = true then begin
                        recSalesSetup.Get();
                        rec."Enrollment No" := NoSeriesMgt.GetNextNo(recSalesSetup.EnrollmentNo, today, true);
                    end;

                    Message('%1 Enrollment alloted to %2', rec."Enrollment No", rec."No.");
                    CurrPage.Update();

                    // recSalesSetup.Get();
                    // CustRec."Enrollment No" := recSalesSetup.EnrollmentNo;
                    // Message('%1', CustRec."Enrollment No");
                    // CurrPage.Update();
                end;
            }
        }
    }

    var
        CustRec: Record Customer;
        isVisible: boolean;
        isVisible2: Boolean;
        isVisible3: Boolean;
        Enroll: Boolean;
        recSalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        editable: Boolean;

}