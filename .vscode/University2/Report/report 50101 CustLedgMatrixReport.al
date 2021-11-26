report 50101 CustLedgMatrixReport
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './CustLedgReport.rdl';

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            column(Customer_No_; "Customer No.")
            {

            }
            column(Description; Description)
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
            column(Remaining_Amount; "Remaining Amount")
            {

            }
            column(Due_Date; "Due Date")
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