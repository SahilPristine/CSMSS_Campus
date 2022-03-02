page 50139 GovernmentCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    // SourceTableView = where(Type = filter(Others));

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'General';
                field("No."; rec."No.")
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
                    // Visible = NoFieldVisible;
                    // trigger OnValidate()
                    // begin
                    //     rec.Type := Rec.Type::Others;
                    // end;

                    trigger OnAssistEdit()
                    begin
                        if AssistEditCustom(xRec) then
                            CurrPage.Update();
                    end;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = All;

                    Editable = false;

                }

                field(Name; rec.Name)
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the customer''s name. This name will appear on all sales documents for the customer.';

                    // trigger OnValidate()
                    // begin
                    //     CurrPage.Update(true);
                    // end;
                }
                field("Name 2"; rec."Name 2")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    ToolTip = 'Specifies an additional part of the name.';
                    Visible = false;
                }
                field("Search Name"; rec."Search Name")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    ToolTip = 'Specifies an alternate name that you can use to search for a customer.';
                    Visible = false;
                }
                field("IC Partner Code"; rec."IC Partner Code")
                {
                    ApplicationArea = Intercompany;
                    Importance = Additional;
                    ToolTip = 'Specifies the customer''s intercompany partner code.';
                }
                field("Balance (LCY)"; rec."Balance (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the payment amount that the customer owes for completed sales. This value is also known as the customer''s balance.';

                    trigger OnDrillDown()
                    begin
                        rec.OpenCustomerLedgerEntries(false);
                    end;
                }
                field("Balance Due (LCY)"; rec."Balance Due (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies payments from the customer that are overdue per today''s date.';

                    trigger OnDrillDown()
                    begin
                        rec.OpenCustomerLedgerEntries(true);
                    end;
                }
                field("Credit Limit (LCY)"; rec."Credit Limit (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    // StyleExpr = StyleTxt;
                    ToolTip = 'Specifies the maximum amount you allow the customer to exceed the payment balance before warnings are issued.';

                }
                field(Blocked; rec.Blocked)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies which transactions with the customer that cannot be processed, for example, because the customer is insolvent.';
                }
                field("Privacy Blocked"; rec."Privacy Blocked")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies whether to limit access to data for the data subject during daily operations. This is useful, for example, when protecting data from changes while it is under privacy review.';
                }
                field("Salesperson Code"; rec."Salesperson Code")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies a code for the salesperson who normally handles this customer''s account.';
                }
                field("Responsibility Center"; rec."Responsibility Center")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the code for the responsibility center that will administer this customer by default.';
                }
                field("Service Zone Code"; rec."Service Zone Code")
                {
                    ApplicationArea = Service;
                    Importance = Additional;
                    ToolTip = 'Specifies the code for the service zone that is assigned to the customer.';
                }
                field("Document Sending Profile"; rec."Document Sending Profile")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the preferred method of sending documents to this customer, so that you do not have to select a sending option every time that you post and send a document to the customer. Sales documents to this customer will be sent using the specified sending profile and will override the default document sending profile.';
                }


                field("Last Date Modified"; rec."Last Date Modified")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies when the customer card was last modified.';
                }
                field("Disable Search by Name"; rec."Disable Search by Name")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies that you can change customer name in the document, because the name is not used in search.';
                }
            }
            group(PostingDetails)
            {
                Caption = 'Posting Details';
                field("Gen. Bus. Posting Group"; rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                    // Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the customer''s trade type to link transactions made for this customer with the appropriate general ledger account according to the general posting setup.';
                }
                field("VAT Bus. Posting Group"; rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    ToolTip = 'Specifies the customer''s VAT specification to link transactions made for this customer to.';
                }
                field("Customer Posting Group"; rec."Customer Posting Group")
                {
                    ApplicationArea = All;
                    // Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the customer''s market type to link business transactions to.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Picture; "Customer Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No.");
                Caption = 'Student Image';
            }
            part(StudentStatisticsFactBox; "Customer Statistics FactBox")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Student Statistics';
                SubPageLink = "No." = FIELD("No."),
                  "Currency Filter" = FIELD("Currency Filter"),
                  "Date Filter" = FIELD("Date Filter"),
                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(18),
                              "No." = FIELD("No.");
            }
        }
    }


    actions
    {
        area(Processing)
        {
            action("Ledger E&ntries")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Ledger E&ntries';
                Image = CustomerLedger;
                Promoted = true;
                PromotedCategory = Process;
                // PromotedIsBig = true;
                RunObject = Page "Customer Ledger Entries";
                RunPageLink = "Customer No." = FIELD("No.");
                RunPageView = SORTING("Customer No.")
                                  ORDER(Descending);
                ShortCutKey = 'Ctrl+F7';
                ToolTip = 'View the history of transactions that have been posted for the selected record.';
            }
        }
    }

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    // trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // begin
    //     rec.Type := rec.Type::Others;
    //     // CurrPage.Update(true);
    // end;

    // trigger OnModifyRecord(): Boolean
    // begin
    //     rec.Type := rec.Type::Others;

    // end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        rec.Type := rec.Type::Others;
        // CurrPage.Update(true);
    end;

    local procedure AssistEditCustom(OldCust: Record Customer): Boolean
    var
        Cust: Record Customer;
    begin
        with Cust do begin
            Cust := Rec;
            SalesSetup.Get();
            SalesSetup.TestField(GovtCode);
            if NoSeriesMgt.SelectSeries(SalesSetup.GovtCode, OldCust."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Cust;
                exit(true);
            end;
        end;
    end;
}