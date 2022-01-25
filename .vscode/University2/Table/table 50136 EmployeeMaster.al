table 50136 EmployeeMaster
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EmpID; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; FirstName; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; MiddleName; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; LastName; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Address 1"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Address 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; PostCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Post Code";
        }
        field(8; City; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; State; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Country; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(11; NoSeries; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(12; "SalesPers/PurchaserCode"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
        }
        field(13; LocationCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;

        }
        field(14; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(15; "Global Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(16; "Reason Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Reason Code";
        }
        field(17; "Global Dimension 1 Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(18; "Global Dimension 2 Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(19; DateFilter; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(20; "Total Hours"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Daily Attendance Details"."Total Hours" WHERE(EmpID = FIELD(EmpID), Date = FIELD(DateFilter)));
        }
        field(21; "Total Days"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Daily Attendance Details" WHERE(EmpID = FIELD(EmpID), Paid = CONST(Yes), Date = FIELD(DateFilter)));
        }
        field(22; Block; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Half Days"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Daily Attendance Details" WHERE(EmpID = FIELD(EmpID), "Half Paid" = CONST(Yes), Date = FIELD(DateFilter)));
        }
        field(24; "Joining Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; ProbationPeriod; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(26; ConfirmationDate; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Monthly House Rent"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "HRA Exemption"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Income From House Property"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Income From Business/Prof."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Short Term Capital Gains"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Long Term Capital Gains"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Income From Pother Sources"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Tax Male"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Tax Female"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Tax Senior"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(37; Comment; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(38; "PAN No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(39; Extension; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Phone No."; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Mobile No."; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "E-Mail"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Company E-Mail"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(44; Sex; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Male","Female";
        }
        field(45; BrithDate; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(46; "Father's Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Mother's Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Marital Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Single","Married","Divorced","Widowed";
        }
        field(49; "Husband's Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Spouse's Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(51; "No. Of Children"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(52; "Terminating Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(53; "Sanctioning Incharge"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(54; "PF / CMPF No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(55; "ESI No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(56; Designation; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57; "Form 16 Income-House Property"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(58; "Form 16 Income-Business/Prof."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59; "Form 16 Short Term Cap. Gains"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Form 16 Long Term Cap. Gains"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(61; "Form 16 Income-Other Sources"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(62; "Relief U/S 89"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(63; "Form 16 Relief U/S 89"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(64; "Employer's T.A.N. No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(65; "Income From Previous Employer"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(66; "TDS by Previous Employer"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(67; "Form 16 Income Prev. Employer"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(68; "Form 16 TDS by Prev. Employer"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69; "Tax Paid by Employee"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70; "Form 16 Tax Paid by Employee"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(71; "Income Taxable at Special Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(72; "Form 16 Income Special Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(73; "TDS Amount"; Decimal)
        {
            FieldClass = FlowField;
        }
        field(74; "Grade"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Grade.Code;
        }
        field(75; "OT Hours"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Daily Attendance Details"."OT Hours" where(EmpID = field(EmpID), Date = field(DateFilter)));
        }
        field(76; "Late Hours"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Daily Attendance Details"."Late Hours" WHERE(EmpID = FIELD(EmpID), Date = FIELD(DateFilter)));
        }
        field(77; "80CCE Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Deductible Amount" WHERE(EmpID = FIELD(EmpID), "Section Type" = FILTER(80CCE)));
        }
        field(78; "Last Pay Revision Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(79; "Net Change"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Emp. Ledger Entry".Amount WHERE(EmpID = FIELD(EmpID), "Posting Date" = FIELD(DateFilter)));
        }
        field(80; Imprest; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Emp. Ledger Entry".Amount WHERE(EmpID = FIELD(EmpID), "Element Type" = CONST(Imprest), "Posting Date" = FIELD(DateFilter)));

        }

    }

    keys
    {
        key(Key1; EmpID)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

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