page 50109 ClassMaster
{
    PageType = Card;
    Caption = 'Class';
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
                field(CourseCode; rec.CourseCode)
                {
                    ApplicationArea = All;
                    TableRelation = CourseMasterTable;

                }
                field(Stream; rec.Stream)
                {
                    ApplicationArea = All;
                    TableRelation = StreamMasterTable;

                }
                field(Semester; rec.Semester)
                {
                    ApplicationArea = All;
                    TableRelation = SemesterMasterTable;

                }
                field(Class; rec.Class)
                {
                    ApplicationArea = All;

                }
                field(Description; rec.Description)
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