page 50144 PostedFeesReceiptList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 50130;
    SourceTableView = where(Status = filter(Closed));
    CardPageId = 50143;

    layout
    {
        area(Content)
        {
            repeater("Fees Slip")
            {
                field(DocumentNo; rec.DocumentNo)
                {
                    ApplicationArea = All;
                }
                field("Student No"; rec.CustomerNo)
                {
                    ApplicationArea = All;
                    Caption = 'Student No';

                }
                field(StudentName; rec.CustomerName)
                {
                    ApplicationArea = All;
                    Caption = 'Student Name';
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

    trigger OnOpenPage()
    begin

    end;
}