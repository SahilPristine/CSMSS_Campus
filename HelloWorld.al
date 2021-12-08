// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50102 CustomerListExt extends "Customer List"
{
    layout
    {
        addafter(Name)
        {
            field(Class; rec.Class)
            {
                ApplicationArea = all;
            }
            field(AcademicYear; rec.AcademicYear)
            {
                ApplicationArea = all;
            }
            field("Batch Code"; rec."Batch Code")
            {
                ApplicationArea = all;
            }
            field("Course Code"; rec."Course Code")
            {
                ApplicationArea = All;
            }
            field("Stream Code"; rec."Stream Code")
            {
                ApplicationArea = All;
            }
        }
    }
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}