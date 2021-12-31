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
            column(Remaining_Amount; "Remaining Amount")
            {

            }
            column(Due_Date; "Due Date")
            {

            }
            column(Desc; Desc)


            {

            }
            trigger OnAfterGetRecord()
            begin
                if RecCust.Get("Customer No.") then
                    Desc := RecCust.Name + ' ' + RecCust."Name 2"

            end;
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
        RecCust: Record Customer;
        Desc: text;


}