tableextension 50123 CustomerExtension extends Customer
{
    fields
    {
        //         field(50158; StudentCode; code[20])
        //         {
        //             DataClassification = ToBeClassified;
        //             Description = 'SL-V.01';
        //             trigger OnValidate()
        //             IF "StudentCode" <> xRec."No." THEN BEGIN
        //             SalesSetup.GET;
        //             NoSeriesMgt.TestManual(SalesSetup."Customer Nos.");
        //              "No. Series" := '';
        // END;
        //         }
        field(50124; AcademicYear; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = AcademicYearMasterTable.CODE;
            Description = 'SL-V.01';
        }
        field(50125; FirstName; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50126; LastName; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50127; Gender; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","Male","Female","Others";
            Description = 'SL-V.01';
        }
        field(50128; Category; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = AdmissionCategory.CategCode;
            Description = 'SL-V.01';
        }
        field(50130; LateralEntry; Boolean)
        {
            DataClassification = ToBeClassified;

            Description = 'SL-V.01';
        }
        field(50131; UniversityTransferProgram; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50132; "Father's First Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50133; "Father's Last Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50134; "Father's Contact No"; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50135; "Father's Email ID"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50136; "Mother's First Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50137; "Mother's Last Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50138; "Mother's Contact No"; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50139; "Mother's Email ID"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50140; "Permanent Address 1"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50141; "Permanent Address 2"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50158; State; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50159; PinCode; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50160; Country; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50142; "Course Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = CourseMasterTable;
            Description = 'SL-V.01';
        }
        field(50143; "Batch Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = BatchMasterTable;
            Description = 'SL-V.01';
        }
        field(50145; "Semester Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = SemesterMasterTable.SemesterCode;
            Description = 'SL-V.01';
            ValidateTableRelation = true;
        }
        field(50146; "Stream Code"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = StreamMasterTable.Description where(CourseCode = field("Course Code"));
            Description = 'SL-V.01';
        }
        field(50147; Class; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = ClassMaster;
            Description = 'SL-V.01';
        }
        field(50148; "Enrollment No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50150; "Bank Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50151; "Branch Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50152; "IFSC Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50153; "Bank Account No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50154; "Fees Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50155; "Total Course Fees"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50156; "AdmissionType"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "";
            Description = 'SL-V.01';
        }
        field(50157; "Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","New Admission","Continue","Terminated","Other";
            Description = 'SL-V.01';
        }
        field(50161; "ContactNo"; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50162; EmailID; Text[30])
        {
            DataClassification = ToBeClassified;
        }

    }

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "NoSeriesManagement";

}