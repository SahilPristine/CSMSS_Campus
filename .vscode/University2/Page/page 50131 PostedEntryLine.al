page 50131 PostedEntryLine
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = PostedCustLedgLine;

    layout
    {
        area(Content)
        {
            repeater(StudentFees)
            {
                field(DocumentNo; rec.DocumentNo)
                {
                    ApplicationArea = All;
                }
                field(LineNo; rec.LineNo)
                {
                    ApplicationArea = All;
                }
                field(EntryDocNo; rec.EntryDocNo)
                {
                    ApplicationArea = All;
                }
                field(ElementCode; rec.ElementCode)
                {
                    ApplicationArea = All;

                }
                field(ElementDesc; rec.ElementDesc)
                {
                    ApplicationArea = All;

                }
                field(ElementType; rec.ElementType)
                {
                    ApplicationArea = All;
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