pageextension 50124 RoleCenterExt extends 9006
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addfirst(sections)
        {
            group(University)
            {
                group(Student)
                {
                    action(StudentRegistration)
                    {
                        RunObject = page 50118;
                        Caption = 'Student Registration';
                        Image = EditCustomer;
                    }
                    action(StudentMaster)
                    {
                        RunObject = page 50136;
                        Caption = 'Student Master';
                        Image = Customer;
                    }

                    action(StudentFees)
                    {
                        RunObject = page 50111;
                        Caption = 'Student Fees Structure';
                        Image = Line;
                    }

                    action(StudentRoomInfo)
                    {
                        RunObject = page 50114;
                        Caption = 'Student Room Info';
                        Image = AddToHome;
                    }
                    action(StudentClassAllotment)
                    {
                        RunObject = page 50125;
                        Caption = 'Student Promotion';
                        Image = CoupledOpportunitiesList;
                    }
                }
                group(Masters)
                {
                    action("Batch Master")
                    {
                        RunObject = page 50104;
                        Image = CreateYear;
                    }
                    action("Course Master")
                    {
                        RunObject = page 50106;
                        Image = Register;
                    }
                    action("Class Master")
                    {
                        RunObject = page 50124;
                        Image = CodesList;
                    }
                    action("Branch Master")
                    {
                        RunObject = page 50133;
                        Image = NewBranch;
                    }
                    action("Hostel Master")
                    {
                        RunObject = page 50112;
                        Image = Home;
                    }
                    action("Stream Master")
                    {
                        RunObject = page 50108;
                        Image = SalesCreditMemo;
                    }
                    action("Semester Master")
                    {
                        RunObject = page 50107;
                        Image = BankAccountStatement;
                    }
                    action("Room Master")
                    {
                        RunObject = page 50113;
                        Image = CalendarChanged;
                    }
                    action("Academic Year Master")
                    {
                        RunObject = page 50105;
                        Image = CreateYear;
                    }
                    action("Admission Category")
                    {
                        RunObject = page 50127;
                        Image = Category;
                    }
                    action("Caste Master")
                    {
                        RunObject = page 50134;
                        Image = ChartOfAccounts;
                    }
                    action("Route Master")
                    {
                        RunObject = page 50129;
                        Image = Route;
                    }
                }
                group(Hostels)
                {
                    action("Hostel Registeration")
                    {
                        RunObject = page 50116;
                        Image = AddToHome;
                    }
                    action("Student Room Shifting")
                    {
                        RunObject = page 50141;
                        Image = TransferOrder;
                    }
                }
                group(Trasport)
                {
                    action("Transport registration")
                    {
                        RunObject = page TransportationList;
                        Image = AddAction;
                    }
                    action("Posted Transport Slip")
                    {
                        RunObject = page PostedTransportSlip;
                    }
                }
                group(Fees)
                {
                    action("Fees Structure Elements")
                    {
                        RunObject = page 50110;
                        Image = ElectronicDoc;
                    }
                    action("Course Wise Fees Structure")
                    {
                        RunObject = page 50128;
                        Image = "Invoicing-Document";
                    }
                    action("Student Fees Structure")
                    {
                        RunObject = page 50111;
                        Image = AbsenceCalendar;
                    }
                    action("Student Fees Receipt")
                    {
                        RunObject = page 50132;
                        Image = Invoice;
                    }
                    action("Posted fees Receipt")
                    {
                        RunObject = page PostedFeesReceiptList;
                        Image = PostedOrder;
                    }
                }
                group(Report)
                {
                    action(CustLedgReport)
                    {
                        RunObject = report 50101;
                        Caption = 'Student Fees';
                        Image = Report;
                    }
                    action("Student Fees Processing")
                    {
                        RunObject = report 50100;
                        Image = Report2;
                    }
                }
            }
        }
    }

    var
        FeesReport: Report GenJournalReport;
        Rec: Record Customer;
}