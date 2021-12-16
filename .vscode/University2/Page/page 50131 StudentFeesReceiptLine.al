page 50131 StudentFeeReceiptLine
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentFeeReceiptLine;
    AutoSplitKey = true;
    Caption = 'Student Fees Receipt Line';

    layout
    {
        area(Content)
        {
            repeater(StudentFees)
            {
                field(DocumentNo; rec.DocumentNo)
                {
                    ApplicationArea = All;
                    Caption = 'Document No';
                }
                field(LineNo; rec.LineNo)
                {
                    ApplicationArea = All;
                    Caption = 'Line No';
                }
                field(EntryDocNo; rec.EntryDocNo)
                {
                    ApplicationArea = All;
                    Caption = 'Debit No';
                }
                field(ElementCode; rec.ElementCode)
                {
                    ApplicationArea = All;
                    Caption = 'Element Code';

                }
                field(ElementDesc; rec.ElementDesc)
                {
                    ApplicationArea = All;
                    Caption = 'Element Desc';

                }
                field(ElementType; rec.ElementType)
                {
                    ApplicationArea = All;
                    Caption = 'Element Type';
                }
                field(Amount; rec.Amount)
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