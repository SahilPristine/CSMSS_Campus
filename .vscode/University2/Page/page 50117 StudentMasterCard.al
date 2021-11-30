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

                field(StudentCode; rec."No.")
                {
                    ApplicationArea = All;


                }
                field(AcademicYear; rec.AcademicYear)
                {
                    ApplicationArea = All;

                }
                field(FirstName; rec.Name)
                {
                    ApplicationArea = All;

                }
                field(LastName; rec."Name 2")
                {
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
                }
                field("Country/Region Code"; rec."Country/Region Code")
                {
                    ApplicationArea = All;
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

                }
                field(BedType; rec.BedType)
                {
                    ApplicationArea = All;
                }
                field(Transport; rec.Transport)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if rec.Transport then
                            isVisible2 := true
                        else
                            isVisible2 := false;

                    end;

                }
                group("HideGroup2")
                {
                    Visible = isVisible2;
                    ShowCaption = false;
                    field(RouteNo; rec.RouteNo)
                    {
                        ApplicationArea = All;
                    }
                    field(Charge; rec.Charge)
                    {
                        ApplicationArea = All;
                    }
                }
            }
            group(BankDetails)
            {
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
            part(Image; "Customer Picture")
            {

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
                RunObject = page 50111;
                RunPageLink = StudentID = field("No.");
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                end;
            }
            action(ConfirmEnroll)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
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