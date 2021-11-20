page 50118 StudentMasterList
{
    PageType = List;
    CardPageId = 50117;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            repeater(StudentList)
            {
                field(StudentCode; rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Student Code';

                }
                field(FirstName; rec.FirstName)
                {
                    ApplicationArea = All;

                }
                field(LastName; rec.LastName)
                {
                    ApplicationArea = All;

                }
                field(AcademicYear; rec.AcademicYear)
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