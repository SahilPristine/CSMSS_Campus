table 50137 "Human Resource Setup"
{
    DataClassification = ToBeClassified;
    // LookupPageId = page 59113;
    // DrillDownPageId = page 59113;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Employee No."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(3; "Hours per Day"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Hours per Halfday"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Hours per Saturday"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Payroll Rounding Precision"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Payroll Rounding Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Nearest","Up","Down";
        }
        field(8; "Maximum OT Hours Per Day"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Employee PF %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Employer PF %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Salary Limit on PF"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "EDLI %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Admin Charge %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Inspection Charge %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Dr A/C Employer PF"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(16; "Cr A/C Employer PF"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(17; "Employee ESI %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Employer ESI %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Dr A/C Employer ESI"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(20; "Cr A/C Employer ESI"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(21; "Salary Limit on ESI"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Current Assessment Year"; code[20])
        {
            // TableRelation = "Tax Setup"."Assessment Year";
        }
        field(23; "EPS %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "PF Registration No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "ESI Resistration No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Sal. Calc. Excl. Off/Hol Days"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Salaries Payable A/C"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(28; "Final Settlement Payable A/C"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(29; "Employee CMPF %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Employer CMPF %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Employee CMFP %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Employer CMFP %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Employee Share % on Pension"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "One Increment %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "CMPF Admin Charge %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Dr A/C Employer CMPF"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(37; "Cr A/C Employer CMPF"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(38; "Base of Arrear Calculation"; Option)
        {
            OptionMembers = "Daily","Monthly";
        }
        field(39; "Salaries Wages Payable"; code[20])
        {
            tableRelation = "G/L Account"."No.";
        }
        field(40; "Exempted hours for early leave"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(41; "EmployeeESI Rounding Precision"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(42; "PF Rounding Precision"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "PF Rounding Type"; Option)
        {
            OptionMembers = "Nearest","Up","Down";
        }
        field(44; "Employee ESI Rounding Type"; Option)
        {
            OptionMembers = "Nearest","Up","Down";
        }
        field(45; "EmployerESI Rounding Precision"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 2 : 5;
        }
        field(46; "Employer ESI Rounding Type"; Option)
        {
            OptionMembers = "Nearest","Up","Down";
        }
        field(47; "Bonus Pay Element"; Code[20])
        {
            // TableRelation = "Pay Element".Code;
        }
        field(48; "Bonus Basic Min. Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
            MinValue = 0;
        }
        field(49; "Bonus Basic Max. Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
            MinValue = 0;
        }
        field(50; "Bonus %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MinValue = 0;
            MaxValue = 100;
        }
        field(51; "Basic Pay Element"; Code[20])
        {
            // TableRelation = "Pay Element".Code;
        }
        field(52; "LTA Month"; Option)
        {
            OptionMembers = January,Februray,March,April,May,June,July,August,September,October,November,December;
        }
        field(53; "Bonus Pay Element2"; Code[20])
        {
            // TableRelation = "Pay Element".Code;
        }
        field(54; "Loan No Series"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(55; "LWF 1st Quater Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(56; "LWF 2nd  Quater Date"; date)
        {
            DataClassification = ToBeClassified;
        }
        field(57; "Prof Tax Age Limit"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(58; "Planned Impersent Nos."; code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(59; "Actual Impersent Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(60; "HR Head E-mail ID"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(69; "Salary Slip Month"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70; "Salary Slip Year"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(71; "Month Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Primary Key")
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