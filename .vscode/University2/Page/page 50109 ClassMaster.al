page 50109 ClassMaster
{
    PageType = Card;
    Caption = 'Class Master';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ClassMasterTable;
    AccessByPermission = page ClassMaster = X;


    layout
    {
        area(Content)
        {
            group(ClassMaster)
            {
                Caption = 'Class Master';
                field(CourseCode; rec.CourseCode)
                {
                    ApplicationArea = All;
                    TableRelation = CourseMasterTable;
                    Caption = 'Course Code';

                }
                field(Stream; rec.Stream)
                {
                    ApplicationArea = All;
                    TableRelation = StreamMasterTable;
                    Caption = 'Stream';

                }
                field(Semester; rec.Semester)
                {
                    ApplicationArea = All;
                    TableRelation = SemesterMasterTable;
                    Caption = 'Semester';

                }
                field(Class; rec.Class)
                {
                    ApplicationArea = All;
                    Caption = 'Class';

                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenSemester)
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Caption = 'Semester';
                RunObject = page SemesterList;

                trigger OnAction()
                begin

                end;
            }

            action(OpenStream)
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Caption = 'Stream';
                RunObject = page StreamList;

                trigger OnAction()
                begin

                end;
            }
        }

    }


    var
        myInt: Integer;
}