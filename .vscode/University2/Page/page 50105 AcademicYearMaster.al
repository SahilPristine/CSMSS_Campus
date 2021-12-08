page 50105 AcademicYearList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = AcademicYearMasterTable;
    Caption = 'Academic Year Master';

    //   PageType = Card;
    // ApplicationArea = All;
    // UsageCategory = Administration;
    // SourceTable = BatchMasterTable;
    // AccessByPermission = page BatchMasterPage = X;

    layout
    {
        area(Content)
        {
            repeater(AcademicYear)
            {
                Caption = 'Academic Year';
                field(CODE; Rec.CODE)
                {
                    ApplicationArea = All;
                    NotBlank = true;

                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }
                field("From Date"; rec."From Date")
                {
                    ApplicationArea = All;
                }
                field("To Date"; rec."To Date")
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
            action(Sahil)
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = FiledPosted;
                trigger OnAction()
                begin
                    Message('Action Created');
                end;
            }
        }
    }

    var
        myInt: Integer;
}