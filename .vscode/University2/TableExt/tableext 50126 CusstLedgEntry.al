tableextension 50126 CusstLedgEntry extends 21
{
    fields
    {
        field(50000; ElementCode; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(50009; StudentCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No." where(Type = filter('Student'));
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
        field(50008; PaymentReceived; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50010; Batch; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = BatchMasterTable.CODE;
            Description = 'SL-V.01';
        }
        field(50011; Category; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(50012; Caste; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    var



}