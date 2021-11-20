page 50108 StreamList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = StreamMasterTable;
    AccessByPermission = page StreamList = X;

    layout
    {
        area(Content)
        {
            repeater(StreamList)
            {
                field(CourseCode; Rec.CourseCode)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin

                        CourseRec.Get(rec.CourseCode);
                        streameditable := CourseRec.Stream;
                    end;
                }
                field(StreamCode; Rec.StreamCode)
                {
                    ApplicationArea = All;
                    Editable = streameditable;
                }
                field(Description; Rec.Description)
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
        CourseRec: Record 50106;
        streameditable: Boolean;


}