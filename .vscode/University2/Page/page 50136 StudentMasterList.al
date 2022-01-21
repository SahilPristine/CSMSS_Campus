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
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    FeesReport.SetTableView(Rec);
                    FeesReport.Run();

                end;
            }
            action("Ledger E&ntries")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Ledger E&ntries';
                Image = CustomerLedger;
                Promoted = true;
                PromotedCategory = Process;
                // PromotedIsBig = true;
                RunObject = Page "Customer Ledger Entries";
                RunPageLink = "Customer No." = FIELD("No.");
                RunPageView = SORTING("Customer No.")
                                  ORDER(Descending);
                ShortCutKey = 'Ctrl+F7';
                ToolTip = 'View the history of transactions that have been posted for the selected record.';
            }
        }
    }

    var
        FeesReport: Report GenJournalReport;
        recStudent: Record Customer;
}