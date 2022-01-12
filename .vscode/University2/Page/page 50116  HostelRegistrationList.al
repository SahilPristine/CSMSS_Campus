page 50116 HostelRegistrationList
{
    PageType = List;
    CardPageId = 50115;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = HostelRegistration;
    AccessByPermission = page HostelRegistrationList = X;
    Caption = 'Hostel Registration';

    layout
    {
        area(Content)
        {
            repeater(HostelRegistration)
            {
                field(RegistrationNo; Rec.RegistrationNo)
                {
                    ApplicationArea = All;
                    Caption = 'Registeration No';

                }
                field(StudentEnrollmentNo; rec.StudentEnrollmentNo)
                {
                    ApplicationArea = All;
                    Caption = 'Student Code';

                }
                field(VisitorNo; rec.VisitorNo)
                {
                    ApplicationArea = All;
                    Caption = 'Visitor Reg No';
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
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';

                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    Caption = 'Address';

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