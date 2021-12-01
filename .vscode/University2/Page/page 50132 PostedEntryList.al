page 50132 PostedEntryList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = 50130;
    CardPageId = 50130;

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
}