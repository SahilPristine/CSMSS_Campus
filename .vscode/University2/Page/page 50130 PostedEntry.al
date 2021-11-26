page 50130 PostedEntry
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = PostedCustLedg;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(CustomerNo; rec.CustomerNo)
                {
                    ApplicationArea = All;

                }
                field(CustomerName; rec.CustomerName)
                {
                    ApplicationArea = All;
                }
                field(DocumentNo; rec.DocumentNo)
                {
                    ApplicationArea = All;
                }
            }
            part(PostedEntry; PostedEntryLine)
            {
                ApplicationArea = All;
                SubPageLink = DocumentNo = field(DocumentNo);
                //UpdatePropagation = Both;
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
        RecPosted: Record PostedCustLedg;
}