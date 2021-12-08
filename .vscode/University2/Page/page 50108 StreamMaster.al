page 50108 StreamList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StreamMasterTable;
    AccessByPermission = page StreamList = X;
    Caption = 'Stream Master';

    layout
    {
        area(Content)
        {
            repeater(StreamList)
            {
                Caption = 'Stream Master';
                field(CourseCode; Rec.CourseCode)
                {
                    Caption = 'Course Code';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CourseRec.Get(rec.CourseCode);
                        streameditable := CourseRec.Stream;
                    end;
                }
                field(StreamCode; Rec.StreamCode)
                {
                    Caption = 'Stream Code';
                    ApplicationArea = All;
                    Editable = streameditable;
                }
                field(Description; Rec.Description)
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
        CourseRec: Record 50106;
        streameditable: Boolean;


}