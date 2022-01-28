page 50146 VisitorregistrationList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Customer;
    SourceTableView = where(Type = filter(Visitor));

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = All;
                    Caption = ' Visitor Reg No';
                    // trigger OnAssistEdit()
                    // begin
                    //     if AssistEditCustom(xRec) then
                    //         CurrPage.Update();
                    // end;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'First Name';

                }
                field("Name 2"; rec."Name 2")
                {
                    ApplicationArea = All;
                    Caption = 'Second Name';
                }
                field("Phone No."; rec."Phone No.")
                {
                    ApplicationArea = All;
                    ExtendedDatatype = PhoneNo;
                }
                field("E-Mail"; rec."E-Mail")
                {
                    ApplicationArea = All;
                    ExtendedDatatype = EMail;
                }
                field("Aadhar No"; rec."Aadhar No")
                {
                    ApplicationArea = All;
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}