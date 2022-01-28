page 50140 VisitorRegistration
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = All;
                    Caption = ' Visitor Reg No';
                    trigger OnAssistEdit()
                    begin
                        if AssistEditCustom(xRec) then
                            CurrPage.Update();
                    end;
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

                field("Permanent Address 1"; rec.Address)
                {
                    ApplicationArea = All;
                    Caption = 'Address Line 1';

                }
                field("Permanent Address 2"; rec."Address 2")
                {
                    ApplicationArea = All;
                    Caption = 'Address Line 2';


                }
                field(State; rec.State)
                {
                    ApplicationArea = All;
                }
                field(PinCode; rec."Pin Code")
                {
                    ApplicationArea = All;
                    Caption = 'Pin Code';
                }
                field("Country/Region Code"; rec."Country Code")
                {
                    ApplicationArea = All;
                    Caption = 'Country Code';
                }
                field("Customer Posting Group"; rec."Customer Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Gen. Bus. Posting Group"; rec."Gen. Bus. Posting Group")
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
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        rec.Type := rec.Type::Visitor;
        // CurrPage.Update(true);
    end;


    local procedure AssistEditCustom(OldCust: Record Customer): Boolean
    var
        Cust: Record Customer;
    begin
        with Cust do begin
            Cust := Rec;
            SalesSetup.Get();
            SalesSetup.TestField(VisitorNo);
            if NoSeriesMgt.SelectSeries(SalesSetup.VisitorNo, OldCust."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Cust;
                exit(true);
            end;
        end;
    end;
}