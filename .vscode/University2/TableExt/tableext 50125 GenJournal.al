tableextension 50125 GenJournal extends 81
{
    fields
    {
        modify("Customer Id")
        {
            Caption = 'Student ID';
        }
        field(50000; ElementCode; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }

        field(50002; ElementDesc; Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50003; AcademicYear; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = AcademicYearMasterTable.CODE;
            Description = 'SL-V.01';
        }
        field(50004; "Course Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = CourseMasterTable;
            Description = 'SL-V.01';
        }

        field(50005; "Semester Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = SemesterMasterTable.SemesterCode;
            Description = 'SL-V.01';
            ValidateTableRelation = true;
        }
        field(50006; "Stream Code"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = StreamMasterTable.StreamCode where(CourseCode = field("Course Code"));
            Description = 'SL-V.01';
        }
        field(50007; Class; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = ClassMaster;
            Description = 'SL-V.01';
        }
        field(50008; Batch; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = BatchMasterTable.CODE;
            Description = 'SL-V.01';
        }
        field(50009; StudentNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }

    }

    keys
    {
        key(key10; "Document Type", "Document No.", "Account No.")
        {

        }
    }

    var
        myInt: Integer;

}