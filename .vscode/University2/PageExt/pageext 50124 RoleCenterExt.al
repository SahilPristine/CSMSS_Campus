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
                    action(StudentMaster)
                    {
                        RunObject = page 50118;
                        Caption = 'Student Master';
                    }

                    action(StudentFees)
                    {
                        RunObject = page 50111;
                        Caption = 'Student Fees Structure';
                    }

                    action(StudentRoomInfo)
                    {
                        RunObject = page 50114;
                        Caption = 'Student Room Info';
                    }
                    action(StudentClassAllotment)
                    {
                        RunObject = page 50125;
                        Caption = 'Student Promotion';
                    }
                }
                group(Masters)
                {
                    action("Batch Master")
                    {
                        RunObject = page 50104;
                    }
                    action("Course Master")
                    {
                        RunObject = page 50106;
                    }
                    action("Class Master")
                    {
                        RunObject = page 50124;
                    }
                    action("Branch Master")
                    {
                        RunObject = page 50133;
                    }
                    action("Hostel Master")
                    {
                        RunObject = page 50112;
                    }
                    action("Stream Master")
                    {
                        RunObject = page 50108;
                    }
                    action("Semester Master")
                    {
                        RunObject = page 50107;
                    }
                    action("Room Master")
                    {
                        RunObject = page 50113;
                    }
                    action("Academic Year Master")
                    {
                        RunObject = page 50105;
                    }
                    action("Admission Category")
                    {
                        RunObject = page 50127;
                    }
                    action("Route Master")
                    {
                        RunObject = page 50129;
                    }
                }
                group(Hostels)
                {
                    action("Hostel Registeration")
                    {
                        RunObject = page 50116;
                    }
                    action("Student Room Shifting")
                    {
                        RunObject = page 50126;
                    }
                }
                group(Fees)
                {
                    action("Fees Structure Elements")
                    {
                        RunObject = page 50110;
                    }
                    action("Course Wise Fees Structure")
                    {
                        RunObject = page 50128;
                    }
                    action("Student Fees Structure")
                    {
                        RunObject = page 50111;
                    }
                    action("Student Fees Receipt")
                    {
                        RunObject = page 50132;
                    }
                }
                group(Report)
                {
                    action(CustLedgReport)
                    {
                        RunObject = report 50101;
                        Caption = 'Student Fees';
                    }
                    action("Student Fees Processing")
                    {
                        RunObject = report 50100;
                    }
                }
            }
        }
    }

    var
        myInt: Integer;
}