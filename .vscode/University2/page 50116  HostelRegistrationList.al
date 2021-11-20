page 50116 HostelRegistrationList
{
    PageType = List;
    CardPageId = 50115;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = HostelRegistration;
    AccessByPermission = page HostelRegistrationList = X;

    layout
    {
        area(Content)
        {
            repeater(HostelRegistration)
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
                field(StudentName; Rec.StudentName)
                {
                    ApplicationArea = All;

                }
                field(Address; Rec.Address)
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