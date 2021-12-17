pageextension 50128 GLEntry extends 20
{
    layout
    {
        addafter("Entry No.")
        {
            field(ElementCode; rec.ElementCode)
            {
                ApplicationArea = All;
                Caption = 'Element Code';
            }
            field(ElementDesc; rec.ElementDesc)
            {
                ApplicationArea = All;
                Caption = 'Element Desc';
            }
            field(ElementType; rec.ElementType)
            {
                ApplicationArea = All;
                Caption = 'Element Type';
            }
            field(AcademicYear; rec.AcademicYear)
            {
                ApplicationArea = All;
            }
            field("Course Code"; rec."Course Code")
            {
                ApplicationArea = All;
            }
            field("Semester Code"; rec."Semester Code")
            {
                ApplicationArea = All;
            }
            field("Stream Code"; rec."Stream Code")
            {
                ApplicationArea = All;
            }
            field(Class; rec.Class)
            {
                ApplicationArea = All;
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}