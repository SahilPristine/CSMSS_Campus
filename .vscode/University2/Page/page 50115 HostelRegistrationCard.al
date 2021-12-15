page 50115 HostelRegistration
{
    PageType = Card;
    Caption = 'Hostel Registration';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = HostelRegistration;
    AccessByPermission = page HostelRegistration = X;

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
                    Caption = 'Registeration No';

                }
                field(StudentEnrollmentNo; Rec.StudentEnrollmentNo)
                {
                    ApplicationArea = All;
                    Caption = 'Student Enrollment No';
                    LookupPageId = 50136;

                }
                field(RegistrationDate; Rec.RegistrationDate)
                {
                    ApplicationArea = All;
                    Caption = 'Registeration Date';

                }
                field(CollegeName; Rec.CollegeName)
                {
                    ApplicationArea = All;
                    Caption = 'College Name';

                }
            }
            group(StudentDetails)
            {
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
                    Caption = 'Class';

                }
                field(ContactNo; Rec.ContactNo)
                {
                    ApplicationArea = All;
                    Caption = 'Contact No';

                }
            }
            group(Registration)
            {
                Caption = 'Hostel Details';

                field(HostelCode; Rec.HostelCode)
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
                    TableRelation = RoomMaster;
                    Caption = 'Room No';

                }
                field(HostelFees; Rec.HostelFees)
                {
                    ApplicationArea = All;
                    Caption = 'Hostel Fees';

                }
                field(DepositFees; Rec.DepositFees)
                {
                    ApplicationArea = All;
                    Caption = 'Deposit Fees';

                }
                field(Left; rec.Left)
                {
                    ApplicationArea = All;
                    Caption = 'Left';
                }
                field(LeftDate; Rec.LeftDate)
                {
                    ApplicationArea = All;
                    Caption = 'Left Date';

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

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}