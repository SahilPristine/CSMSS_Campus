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
        field(50158; State; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
            TableRelation = State;
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
            TableRelation = StreamMasterTable.StreamCode where(CourseCode = field("Course Code"));
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
            trigger OnValidate()
            begin
                if "Enrollment No" <> xRec."Enrollment No" then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup.EnrollmentNo);
                    "No. Series" := '';
                end;
            end;
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

        field(50164; Hostel; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(50165; Transport; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(50167; RoomType; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = RoomMaster.RoomType;
        }

        field(50168; BedType; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = RoomMaster.Beds where(RoomType = field(RoomType));
        }
        field(50169; RouteNo; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = RouteMaster;
        }
        field(50170; RouteName; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50171; Charge; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50172; HostelCode; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50173; RoomNo; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50174; DOB; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50175; "Birth Place"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50176; "Local Address 1"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50177; "Local Address 2"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50178; State2; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = State;
        }
        field(50179; "Pin Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Post Code";
        }
        field(50180; "Country Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(50181; Cast; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = CasteMaster;
        }
        field(50182; Religion; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Hindu","Muslim","Sikh","Christian";
        }
        field(50183; Nationality; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Indian";
        }
        field(50184; "Aadhar No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50185; "Admission Quota"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Regular","Institutional";
        }
        field(50186; "Qualifying Exam Details"; Text[50])
        {
            DataClassification = ToBeClassified;
        }


    }

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "NoSeriesManagement";
        Hostel: Record HostelMaster;
        Route: Record RouteMaster;

    // trigger OnInsert()

    // begin
    //     if "Enrollment No" = '' then begin
    //         SalesSetup.Get();
    //         SalesSetup.TestField(EnrollmentNo);
    //         NoSeriesMgt.InitSeries(SalesSetup.EnrollmentNo, xRec."No. Series", 0D, "Enrollment No", "No. Series");
    //     end;

    // end;

}