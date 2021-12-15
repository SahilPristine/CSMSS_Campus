page 50136 StudentMasterList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    Caption = 'Students';
    CardPageId = 50135;
    // Editable = false;
    // SourceTableView = where("Enrollment No" = filter(<> ' '));

    layout
    {
        area(Content)
        {
            repeater(StudentList)
            {
                Caption = 'Students';
                field("Enrollment No"; rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Student Enrollment No';

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