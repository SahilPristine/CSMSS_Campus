page 50118 StudentMasterList
{
    PageType = List;
    CardPageId = 50117;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    Caption = 'Students';

    layout
    {
        area(Content)
        {
            repeater(StudentList)
            {
                Caption = 'Students';
                field(StudentCode; rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Student Code';

                }
                field("First Name"; rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'First Name';
                }
                field("Last Name"; rec."Name 2")
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