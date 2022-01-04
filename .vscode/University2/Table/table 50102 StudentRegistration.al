table 50102 StudentRegistration
{
    DataClassification = ToBeClassified;

    fields
    {
        field(50000; "Registration No"; code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Registration No" <> xRec."Registration No" then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup.RegisterationNo);
                    "No. Series" := '';
                end;
            end;
        }
        field(50001; "First Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;

        }
        field(50002; "Last Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(50003; DOB; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Birth Place"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; Gender; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","Male","Female","Others";
            Description = 'SL-V.01';
        }
        field(50006; Category; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = AdmissionCategory.CategCode;
            Description = 'SL-V.01';
            NotBlank = true;
        }
        field(50007; Cast; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = CasteMaster;
            NotBlank = true;
        }
        field(50008; Religion; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","Hindu","Muslim","Sikh","Christian";
        }
        field(50009; Nationality; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","Indian";
        }
        field(50010; "Aadhar No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Admission Quota"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","Regular","Institutional";
        }
        field(50012; "Qualifying Exam Details"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "Permanent Address 1"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Permanent Address 2"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50015; State; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = State;
        }
        field(50016; "Pin Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Post Code";
        }
        field(50017; "Country Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(50018; "Local Address 1"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "Local Address 2"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50020; State2; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = State;
        }
        field(50021; "Pin Code2"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Post Code";
        }
        field(50022; "Country Code2"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(50023; "Batch Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = BatchMasterTable;
            Description = 'SL-V.01';
            NotBlank = true;
        }
        field(50024; AcademicYear; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = AcademicYearMasterTable.CODE;
            Description = 'SL-V.01';
            NotBlank = true;
        }
        field(50025; "Course Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = CourseMasterTable;
            Description = 'SL-V.01';
            NotBlank = true;
        }

        field(50026; "Semester Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = SemesterMasterTable.SemesterCode;
            Description = 'SL-V.01';
            ValidateTableRelation = true;
            NotBlank = true;
        }
        field(50027; "Stream Code"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = StreamMasterTable.StreamCode where(CourseCode = field("Course Code"));
            Description = 'SL-V.01';
            NotBlank = true;
        }
        field(50028; Class; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = ClassMaster;
            Description = 'SL-V.01';
            NotBlank = true;
        }
        field(50029; "Enrollment No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
            // trigger OnValidate()
            // begin
            //     if "Enrollment No" <> xRec."Enrollment No" then begin
            //         SalesSetup.Get();
            //         NoSeriesMgt.TestManual(SalesSetup.EnrollmentNo);
            //         "No. Series" := '';
            //     end;
            // end;
        }


        field(50030; LateralEntry; Boolean)
        {
            DataClassification = ToBeClassified;

            Description = 'SL-V.01';
        }
        field(50031; UniversityTransferProgram; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50053; "Phone No"; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50054; "Email ID"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50032; "Father's First Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50033; "Father's Last Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50034; "Father's Contact No"; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50035; "Father's Email ID"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50036; "Mother's First Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50037; "Mother's Last Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50038; "Mother's Contact No"; Text[10])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50039; "Mother's Email ID"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50040; "Bank Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50041; "Branch Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50042; "IFSC Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50043; "Bank Account No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SL-V.01';
        }
        field(50056; "Application Method"; Enum "Application Method")
        {
            DataClassification = ToBeClassified;
        }

        field(50044; Hostel; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(50045; Transport; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(50046; RoomType; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = RoomMaster.RoomType;
        }

        field(50047; BedType; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = RoomMaster.Beds where(RoomType = field(RoomType));
        }
        field(50048; RouteNo; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = RouteMaster;
        }
        field(50049; RouteName; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50050; Charge; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50051; HostelCode; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50052; RoomNo; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50055; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50057; SameAddress; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                // if SameAddress = true then begin
                //     rec.SetRange("Registration No", "Registration No");
                //     if rec.FindFirst() then begin
                //         "Local Address 1" := "Permanent Address 1";
                //         "Local Address 2" := "Permanent Address 2";
                //         State2 := State;
                //         "Pin Code2" := "Pin Code";
                //         "Country Code2" := "Country Code";
                //         Insert();
                //     end;
                // end;
            end;
        }
        field(50058; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Student","Others";
            trigger OnValidate()
            begin
                Type := Type::Student;
            end;
        }

    }

    keys
    {
        key(Key1; "Registration No")
        {
            Clustered = true;
        }
    }

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;



    trigger OnInsert()
    begin
        if "Registration No" = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField(RegistrationNo);
            NoSeriesMgt.InitSeries(SalesSetup.RegistrationNo, xRec."No. Series", 0D, "Registration No", "No. Series");
        end;

    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}