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
                field(RegistrationNo; Rec.RegistrationNo)
                {
                    ApplicationArea = All;

                }
                field(StudentCode; Rec.StudentCode)
                {
                    ApplicationArea = All;

                }
                field(RegistrationDate; Rec.RegistrationDate)
                {
                    ApplicationArea = All;

                }
                field(CollegeName; Rec.CollegeName)
                {
                    ApplicationArea = All;

                }
            }
            group(StudentDetails)
            {
                field(StudentName; Rec.StudentName)
                {
                    ApplicationArea = All;

                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;

                }
                field(Address2; rec.Address2)
                {
                    ApplicationArea = All;
                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = All;

                }
                field(ContactNo; Rec.ContactNo)
                {
                    ApplicationArea = All;

                }
            }
            group(Registration)
            {

                field(HostelCode; Rec.HostelCode)
                {
                    ApplicationArea = All;

                }
                field(HostelName; Rec.HostelName)
                {
                    ApplicationArea = All;
                }
                field(RoomNo; Rec.RoomNo)
                {
                    ApplicationArea = All;
                    TableRelation = RoomMaster;

                }
                field(HostelFees; Rec.HostelFees)
                {
                    ApplicationArea = All;

                }
                field(DepositFees; Rec.DepositFees)
                {
                    ApplicationArea = All;

                }
                field(Left; rec.Left)
                {
                    ApplicationArea = All;
                }
                field(LeftDate; Rec.LeftDate)
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

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}