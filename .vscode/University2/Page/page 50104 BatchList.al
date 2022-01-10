page 50104 BatchList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BatchMasterTable;
    SaveValues = true;
    Caption = 'Batch Master';

    layout
    {
        area(Content)
        {
            Repeater(BatchList)
            {
                Caption = 'Batch Master';
                field("CODE"; Rec.CODE)
                {
                    ApplicationArea = All;
                    NotBlank = true;

                }

                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    NotBlank = true;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportBatch)
            {
                ApplicationArea = All;
                Caption = 'Import Batch';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Xmlport.Run(50100, true, false);

                end;
            }
        }
    }

    var
        myInt: Integer;
}