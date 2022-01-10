page 50136 StudentMasterList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Customer;
    SourceTableView = where(Type = filter(Student));
    Caption = 'Student Master';
    CardPageId = 50135;

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
            action(StudentFeesProcessing)
            {
                ApplicationArea = All;
                Caption = 'StudentFeesProcessing';

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    FeesReport.SetTableView(Rec);
                    FeesReport.Run();

                end;
            }
        }
    }

    var
        FeesReport: Report GenJournalReport;
        recStudent: Record Customer;
}