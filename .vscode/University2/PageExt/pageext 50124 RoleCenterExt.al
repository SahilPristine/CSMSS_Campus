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
                    }

                    action(StudentFees)
                    {
                        RunObject = page 50111;
                    }

                    action(StudentRoomInfo)
                    {
                        RunObject = page 50114;
                    }
                    action(StudentClassAllotment)
                    {
                        RunObject = page 50125;
                    }
                }
                group(Masters)
                {
                    action(Batch)
                    {
                        RunObject = page 50104;
                    }
                    action(Course)
                    {
                        RunObject = page 50106;
                    }
                    action(Class)
                    {
                        RunObject = page 50124;
                    }
                    action(Hostel)
                    {
                        RunObject = page 50112;
                    }
                    action(Stream)
                    {
                        RunObject = page 50108;
                    }
                    action(Semester)
                    {
                        RunObject = page 50107;
                    }
                    action(Rooms)
                    {
                        RunObject = page 50113;
                    }
                    action(AcademicYear)
                    {
                        RunObject = page 50105;
                    }
                    action(AdmissionCategory)
                    {
                        RunObject = page 50127;
                    }
                    action(RouteMaster)
                    {
                        RunObject = page 50129;
                    }
                }
                group(Hostels)
                {
                    action(HostelReg)
                    {
                        RunObject = page 50116;
                    }
                    action(StudentRoomShifting)
                    {
                        RunObject = page 50126;
                    }
                }
                group(Fees)
                {
                    action(FeesStructureElements)
                    {
                        RunObject = page 50110;
                    }
                    action(CourseWiseFeeStructure)
                    {
                        RunObject = page 50128;
                    }
                    action(StudentFeeStructure)
                    {
                        RunObject = page 50111;
                    }
                    action("Student Fees Slip")
                    {
                        RunObject = page 50130;
                    }
                }
                group(Report)
                {
                    action(CustLedgReport)
                    {
                        RunObject = report 50101;
                        Caption = 'Student Fees';
                    }
                    action(StudentFeesProcessing)
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