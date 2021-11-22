report 50100 GenJournalReport
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(DataItemName; 81)
        {
            RequestFilterFields = "Customer Id", "Journal Template Name", "Journal Batch Id", "Posting Date";
            column(Posting_Date; "Posting Date")
            {

            }
            column(Document_Type; "Document Type")
            {

            }
            column(Document_No_; "Document No.")
            {

            }
            column(Account_Type; "Account Type")
            {

            }
            column(Account_No_; "Account No.")
            {

            }
            column(ElementCode; ElementCode)
            {

            }
            column(ElementDesc; ElementDesc)
            {

            }
            column(ElementType; ElementType)
            {

            }
            column(Amount; Amount)
            {

            }
            column(Bal__Account_Type; "Bal. Account Type")
            {

            }
            column(Bal__Account_No_; "Bal. Account No.")
            {

            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;
}