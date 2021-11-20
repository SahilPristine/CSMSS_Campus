page 50105 AcademicYearList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = AcademicYearMasterTable;
    SaveValues = true;
    AccessByPermission = page AcademicYearList = X;
    AdditionalSearchTerms = 'Sahil';

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
                field(CODE; Rec.CODE)
                {
                    ApplicationArea = All;
                    NotBlank = true;

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