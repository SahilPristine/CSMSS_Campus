page 50118 StudentRegistrationList
{
    PageType = List;
    CardPageId = 50117;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentRegistration;
    Caption = 'Student Registration';

    layout
    {
        area(Content)
        {
            repeater(StudentList)
            {
                Caption = 'Students';
                field(StudentCode; rec."Registration No")
                {
                    ApplicationArea = All;
                    Caption = 'Student Code';

                }
                field("First Name"; rec."First Name")
                {
                    ApplicationArea = All;
                    Caption = 'First Name';
                }
                field("Last Name"; rec."Last Name")
                {
                    ApplicationArea = All;
                    Caption = 'Last Name';
                }
                field(AcademicYear; rec.AcademicYear)
                {
                    ApplicationArea = All;
                    Caption = 'Academic Year';

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