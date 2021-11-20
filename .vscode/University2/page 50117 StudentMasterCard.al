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
                field(FirstName; rec.FirstName)
                {
                    ApplicationArea = All;

                }
                field(LastName; rec.LastName)
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

                }
            }
            group(PersonalDetails)
            {
                field(ContactNo; rec.ContactNo)
                {
                    ApplicationArea = All;
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
                field(EmailID; rec.EmailID)
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

                field("Permanent Address 1"; rec."Permanent Address 1")
                {
                    ApplicationArea = All;

                }
                field("Permanent Address 2"; rec."Permanent Address 2")
                {
                    ApplicationArea = All;

                }
                field(State; rec.State)
                {
                    ApplicationArea = All;
                }
                field(PinCode; rec.PinCode)
                {
                    ApplicationArea = All;
                }
                field(Country; rec.Country)
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

                }
                field(Class; rec.Class)
                {
                    ApplicationArea = All;


                }
                field("Enrollment No"; rec."Enrollment No")
                {
                    ApplicationArea = All;

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
        }
    }

    var
        myInt: Integer;
}