page 50117 StudentRegistration
{
    PageType = Card;
    Caption = 'Student Registration Page';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StudentRegistration;
    PopulateAllFields = true;

    layout
    {
        area(Content)
        {
            group(StudentDetails)
            {
                Caption = 'Student Details';

                field("Registration No"; rec."Registration No")
                {
                    ApplicationArea = All;
                    Caption = 'Registration No';
                }

                field(FirstName; rec."First Name")
                {
                    ApplicationArea = All;
                    Caption = 'First Name';

                }
                field(LastName; rec."Last Name")
                {
                    Caption = 'Last Name';
                    ApplicationArea = All;

                }
                field(DOB; rec.DOB)
                {
                    ApplicationArea = All;
                }
                field("Birth Place"; rec."Birth Place")
                {
                    ApplicationArea = All;
                }
                field(Gender; rec.Gender)
                {
                    ApplicationArea = All;

                }
                field(Category; rec.Category)
                {
                    ApplicationArea = All;
                    Caption = 'Admission Category';
                    Editable = confirm;

                }
                field(Cast; rec.Cast)
                {
                    ApplicationArea = All;
                    LookupPageId = 50134;

                }
                field(Religion; rec.Religion)
                {
                    ApplicationArea = All;
                }
                field(Nationality; rec.Nationality)
                {
                    ApplicationArea = All;
                }
                field("Aadhar No"; rec."Aadhar No")
                {
                    ApplicationArea = All;
                }
                field("Admission Quota"; rec."Admission Quota")
                {
                    ApplicationArea = All;
                }
                field("Qualifying Exam Details"; rec."Qualifying Exam Details")
                {
                    ApplicationArea = All;
                }
            }
            group("Address Details")
            {
                group("Permanent Address")
                {
                    field("Permanent Address 1"; rec."Permanent Address 1")
                    {
                        ApplicationArea = All;
                        Caption = 'Address Line 1';

                    }
                    field("Permanent Address 2"; rec."Permanent Address 2")
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
                }
                group("Local Address")
                {
                    field("Local Address 1"; rec."Local Address 1")
                    {
                        ApplicationArea = All;
                        Caption = 'Address Line 1';

                    }
                    field("Local Address 2"; rec."Local Address 2")
                    {
                        ApplicationArea = All;
                        Caption = 'Address Line 2';


                    }
                    field(State2; rec.State2)
                    {
                        ApplicationArea = All;
                        Caption = 'State';
                    }
                    field(PostCode; rec."Pin Code2")
                    {
                        ApplicationArea = All;
                        Caption = 'Pin Code';
                    }
                    field("Country Code"; rec."Country Code2")
                    {
                        ApplicationArea = All;
                        Caption = 'Country Code';
                    }
                }

            }

            group(PersonalDetails)
            {
                field("Phone No."; rec."Phone No")
                {
                    ApplicationArea = All;
                    // trigger OnValidate()
                    // begin
                    //     CustRec."Phone No." := rec."Phone No.";
                    // end;
                }
                field("Father's First Name"; rec."Father's First Name")
                {
                    ApplicationArea = All;

                }
                field("Father's Last Name"; rec."Father's Last Name")
                {
                    ApplicationArea = All;

                }
                field("Father's Contact No"; rec."Father's Contact No")
                {
                    ApplicationArea = All;

                }
                field("Father's Email ID"; rec."Father's Email ID")
                {
                    ApplicationArea = All;

                }
                field("E-Mail"; rec."Email ID")
                {
                    ApplicationArea = All;
                }
                field("Mother's First Name"; rec."Mother's First Name")
                {
                    ApplicationArea = All;

                }
                field("Mother's Last Name"; rec."Mother's Last Name")
                {
                    ApplicationArea = All;

                }
                field("Mother's Contact No"; rec."Mother's Contact No")
                {
                    ApplicationArea = All;

                }
                field("Mother's Email ID"; rec."Mother's Email ID")
                {
                    ApplicationArea = All;

                }
            }

            group(AdmissionDetails)
            {
                // field(LateralEntry; rec.LateralEntry)
                // {
                //     ApplicationArea = All;
                // }
                // field(UniversityTransferProgram; rec.UniversityTransferProgram)
                // {
                //     ApplicationArea = All;

                // }
                field("Batch Code"; rec."Batch Code")
                {
                    ApplicationArea = All;
                }
                field(AcademicYear; rec.AcademicYear)
                {
                    ApplicationArea = All;
                    CAption = 'Academic Year';
                }

                field("Course Code"; rec."Course Code")
                {
                    ApplicationArea = All;
                    LookupPageId = CourseList;
                }

                field("Semester Code"; rec."Semester Code")
                {
                    ApplicationArea = All;
                }
                field("Stream Code"; rec."Stream Code")
                {
                    ApplicationArea = All;
                    LookupPageId = 50108;
                }
                field(Class; rec.Class)
                {
                    ApplicationArea = All;
                    LookupPageId = 50124;
                }
                field("Enrollment No"; rec."Enrollment No")
                {
                    ApplicationArea = All;
                    Editable = False;
                    Caption = 'Enrollment No';
                    trigger OnValidate()
                    begin

                    end;

                }

            }


            group(BankDetails)
            {
                Caption = 'Bank Details';
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = All;

                }
                field("Branch Name"; rec."Branch Name")
                {
                    ApplicationArea = All;

                }
                field("IFSC Code"; rec."IFSC Code")
                {
                    ApplicationArea = All;

                }
                field("Bank Account No"; rec."Bank Account No")
                {
                    ApplicationArea = All;

                }
            }
            group(Hostel_Transport)
            {
                Caption = 'Hostel & Transport Details';
                group(Hostel)
                {
                    field(AvailHostel; rec.Hostel)
                    {
                        ApplicationArea = All;
                        Caption = 'Hostel';
                        trigger OnValidate()
                        begin
                            if rec.Hostel = true then
                                editHostel := true
                            else
                                editHostel := false;
                            CurrPage.Update(true);
                        end;

                    }
                    field(RoomType; rec.RoomType)
                    {

                        ApplicationArea = All;
                        Caption = 'Room Type';
                        Enabled = editHostel;

                    }
                    field(BedType; rec.BedType)
                    {
                        ApplicationArea = All;
                        Caption = 'Bed Type';
                        Enabled = editHostel;
                    }
                    field(HostelCode; rec.HostelCode)
                    {
                        ApplicationArea = All;
                        Caption = 'Hostel Code';
                        Enabled = editHostel;
                    }
                    field(RoomNo; rec.RoomNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Room No';
                        Enabled = editHostel;
                    }
                }
                group(Transport)
                {
                    field(AvailTransport; rec.Transport)
                    {
                        ApplicationArea = All;
                        Caption = 'Transport';
                        trigger OnValidate()
                        begin
                            if rec.Transport = true then
                                editTransport := true
                            else
                                editTransport := false;
                            CurrPage.Update(true);
                        end;

                    }
                    field(RouteNo; rec.RouteNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Route No';
                        Enabled = editTransport;
                    }
                    field(Charge; rec.Charge)
                    {
                        ApplicationArea = All;
                        Enabled = editTransport;
                    }
                }
            }
        }
        area(FactBoxes)
        {
            //     part(Picture; "Customer Picture")
            //     {
            //         ApplicationArea = Basic, Suite;
            //         SubPageLink = "No." = FIELD("No.");
            //         Caption = 'Student Image';
            //     }
            //     part(StudentStatisticsFactBox; "Customer Statistics FactBox")
            //     {
            //         ApplicationArea = Basic, Suite;
            //         Caption = 'Student Statistics';
            //         SubPageLink = "No." = FIELD("No."),
            //           "Currency Filter" = FIELD("Currency Filter"),
            //           "Date Filter" = FIELD("Date Filter"),
            //           "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
            //           "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
            //     }
            //     part("Attached Documents"; "Document Attachment Factbox")
            //     {
            //         ApplicationArea = All;
            //         Caption = 'Attachments';
            //         SubPageLink = "Table ID" = CONST(18),
            //                       "No." = FIELD("No.");
        }


    }

    actions
    {
        area(Processing)
        {
            // action(FeesStructure)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Fees Structure';
            //     RunObject = page 50111;
            //     RunPageLink = StudentEnrollmentNo = field("Enrollment No");
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     Image = CheckList;

            //     trigger OnAction()
            //     begin


            //     end;
            // }
            action(ConfirmEnroll)
            {
                ApplicationArea = All;
                Caption = 'Confirm Enrollment';
                Promoted = true;
                PromotedCategory = Process;
                Image = Post;
                trigger OnAction()
                var
                    Question: Text;
                    Answer: Boolean;
                    Text000: Label 'Do you want to confirm enrollment?';

                begin

                    // rec.TestField("Enrollment No", '');

                    if rec."Enrollment No" <> ''
                    then
                        Error('Enrollment No %1 Already Generated', rec."Enrollment No");

                    Question := Text000;
                    Answer := Dialog.Confirm(Question, true);
                    if Answer = true then begin
                        // recSalesSetup.Get();
                        // rec."Enrollment No" := NoSeriesMgt.GetNextNo(recSalesSetup.EnrollmentNo, today, true);
                        recSalesSetup.get();
                        rec."Enrollment No" := NoSeriesMgt.GetNextNo(recSalesSetup."Customer Nos.", Today, true);
                    end;

                    Message('%1 Enrollment alloted to %2', rec."Enrollment No", rec."Registration No");

                    CustRec.Init();
                    CustRec."No." := rec."Enrollment No";
                    CustRec.Name := rec."First Name";
                    CustRec."Name 2" := rec."Last Name";
                    CustRec.DOB := rec.DOB;
                    CustRec."Birth Place" := rec."Birth Place";
                    CustRec.Gender := rec.Gender;
                    CustRec.Category := rec.Category;
                    CustRec.Cast := rec.Cast;
                    CustRec.Religion := rec.Religion;
                    CustRec.Nationality := rec.Nationality;
                    CustRec."Aadhar No" := rec."Aadhar No";
                    CustRec."Admission Quota" := rec."Admission Quota";
                    CustRec."Qualifying Exam Details" := rec."Qualifying Exam Details";
                    CustRec.Address := rec."Permanent Address 1";
                    CustRec."Address 2" := rec."Permanent Address 2";
                    CustRec.State := rec.State;
                    CustRec."Pin Code" := rec."Pin Code";
                    CustRec."Country/Region Code" := rec."Country Code";
                    CustRec."Local Address 1" := rec."Local Address 1";
                    CustRec."Local Address 2" := rec."Local Address 2";
                    CustRec.State2 := rec.State2;
                    CustRec."Post Code" := rec."Pin Code2";
                    CustRec."Country Code" := rec."Country Code2";
                    CustRec."Phone No." := rec."Phone No";
                    CustRec."E-Mail" := rec."Email ID";
                    CustRec."Father's First Name" := rec."Father's First Name";
                    CustRec."Father's Last Name" := rec."Father's Last Name";
                    CustRec."Father's Contact No" := rec."Father's Contact No";
                    CustRec."Father's Email ID" := rec."Father's Email ID";
                    CustRec."Mother's First Name" := rec."Mother's First Name";
                    CustRec."Mother's Last Name" := rec."Mother's Last Name";
                    CustRec."Mother's Contact No" := rec."Mother's Contact No";
                    CustRec."Mother's Email ID" := rec."Mother's Email ID";
                    CustRec."Batch Code" := rec."Batch Code";
                    Custrec.AcademicYear := rec.AcademicYear;
                    CustRec."Course Code" := rec."Course Code";
                    CustRec."Semester Code" := rec."Semester Code";
                    CustRec."Stream Code" := rec."Stream Code";
                    CustRec.Class := rec.Class;
                    CustRec."Bank Name" := rec."Bank Name";
                    CustRec."Branch Name" := rec."Branch Name";
                    CustRec."IFSC Code" := rec."IFSC Code";
                    CustRec."Bank Account No" := rec."Bank Account No";
                    CustRec.Hostel := rec.Hostel;
                    CustRec.RoomType := rec.RoomType;
                    CustRec.BedType := rec.BedType;
                    CustRec.HostelCode := rec.HostelCode;
                    CustRec.RoomNo := rec.RoomNo;
                    CustRec.Transport := rec.Transport;
                    CustRec.RouteNo := rec.RoomNo;
                    CustRec.Charge := rec.Charge;

                    CustRec.Insert(true);

                    // if CustRec."No." <> ' ' then begin
                    //     CustRec.get(rec."Enrollment No");
                    //     CustRec.SetRange("No.", rec."Enrollment No");
                    //     if CustRec.FindFirst() then begin
                    //         CustRec.Name := StudentReg."First Name";

                    //     end
                    // end;

                    CurrPage.Update(true);

                    // recSalesSetup.Get();
                    // CustRec."Enrollment No" := recSalesSetup.EnrollmentNo;
                    // Message('%1', CustRec."Enrollment No");
                    // CurrPage.Update();
                end;


            }
        }
    }

    var
        CustRec: Record Customer;
        StudentReg: Record StudentRegistration;
        Enroll: Boolean;
        recSalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        [InDataSet]
        editHostel: Boolean;
        [InDataSet]
        editTransport: Boolean;
        [InDataSet]
        confirm: Boolean;


    trigger OnAfterGetRecord()
    begin
        if rec.Hostel = true then
            editHostel := true
        else
            editHostel := false;

        if rec.Transport = true then
            editTransport := true
        else
            editTransport := false;

        if rec."Enrollment No" <> '' then
            confirm := false
        else
            confirm := true;



        // CurrPage.Update(true);

    end;

    trigger OnOpenPage()
    begin

    end;


    trigger OnAfterGetCurrRecord()
    begin
        if rec."Enrollment No" <> '' then
            confirm := false
        else
            confirm := true;
    end;

}