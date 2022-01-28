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
            // CalcFormula = Sum("Daily Attendance Details"."Total Hours" WHERE(EmpID = FIELD(EmpID), Date = FIELD(DateFilter)));
        }
        field(21; "Total Days"; Integer)
        {
            FieldClass = FlowField;
            // CalcFormula = Count("Daily Attendance Details" WHERE(EmpID = FIELD(EmpID), Paid = CONST(Yes), Date = FIELD(DateFilter)));
        }
        field(22; Block; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Half Days"; Integer)
        {
            FieldClass = FlowField;
            // CalcFormula = Count("Daily Attendance Details" WHERE(EmpID = FIELD(EmpID), "Half Paid" = CONST(Yes), Date = FIELD(DateFilter)));
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
            // TableRelation = Grade.Code;
        }
        field(75; "OT Hours"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Daily Attendance Details"."OT Hours" where(EmpID = field(EmpID), Date = field(DateFilter)));
        }
        field(76; "Late Hours"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Daily Attendance Details"."Late Hours" WHERE(EmpID = FIELD(EmpID), Date = FIELD(DateFilter)));
        }
        field(77; "80CCE Amount"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Deductible Amount" WHERE(EmpID = FIELD(EmpID), "Section Type" = FILTER(80CCE)));
        }
        field(78; "Last Pay Revision Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(79; "Net Change"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Emp. Ledger Entry".Amount WHERE(EmpID = FIELD(EmpID), "Posting Date" = FIELD(DateFilter)));
        }
        field(80; Imprest; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Emp. Ledger Entry".Amount WHERE(EmpID = FIELD(EmpID), "Element Type" = CONST(Imprest), "Posting Date" = FIELD(DateFilter)));

        }
        field(81; Advance; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Emp. Ledger Entry".Amount WHERE(EmpID = FIELD(EmpID), "Element Type" = CONST(Advance), "Posting Date" = FIELD(DateFilter)));
        }
        field(82; "80D Amount"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Deductible Amount" WHERE(EmpID = FIELD(EmpID), "Section Type" = FILTER("80D Amount"), 80D=FILTER(Normal)));
        }
        field(83; "80D Amount (Spl.)"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormlua = Sum("Emp. DeductionsUnderChapter-VI"."Deductible Amount" WHERE(EmpID=FIELD(EmpID),"Section Type"=FILTER("80D Amount (Spl.)"),80D=FILTER(Special)));
        }
        field(84; "80DD Amount"; Decimal)
        {
            FieldClass = flowfield;
            // CalcFormla = Sum("Emp. DeductionsUnderChapter-VI"."Deducible Amount" where (EmpID = Field(EmpID), "Section Type"= FILTER(80DD),80D=FILTER(Normal)));
        }
        field(85; "80DD Amount (Spl.)"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Deductible Amount" WHERE(EmpID = FIELD(EmpID), Section Type=FILTER(80DD),80D=FILTER(Special)));
        }
        field(86; "80DDB Amount"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula=Sum("Emp. DeductionsUnderChapter-VI"."Deductible Amount" WHERE (EmpID=FIELD(EmpID),Section Type=FILTER(80DDB),80D=FILTER(Normal)));
        }
        field(87; "80DDB Amount (Spl.)"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Deductible Amount" WHERE(EmpID = FIELD(EmpID), "Section Type" = FILTER(80DDB),80D=FILTER(Special)));

        }
        field(88; "Form 16 80CCE Amount"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Form 16 Deductible Amount" WHERE(EmpID = FIELD(EmpID), "Section Type" = FILTER(80CCE)));
        }
        field(89; "Form 16 80D Amount"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Form 16 Deductible Amount" WHERE(EmpID = FIELD(EmpID), "Section Type" = FILTER(80D),80D=FILTER(Normal)));
        }
        field(90; "Form 16 80D Amount (Spl.)"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula=Sum("Emp. DeductionsUnderChapter-VI"."Form 16 Deductible Amount" WHERE (EmpID=FIELD(EmpID),"Section Type"=FILTER(80D),80D=FILTER(Special)));
        }
        field(91; "Form 16 80DD Amount"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula=Sum("Emp. DeductionsUnderChapter-VI"."Form 16 Deductible Amount" WHERE (EmpID=FIELD(EmpID),"Section Type"=FILTER(80DD),80D=FILTER(Normal)));
        }
        field(92; "Form 16 80DD Amount (Spl.)"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Form 16 Deductible Amount" WHERE(EmpID = FIELD(EmpID), Section Type=FILTER(80DD),80D=FILTER(Special)));
        }
        field(93; "Form 16 80DDB Amount"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Form 16 Deductible Amount" WHERE(EmpID = FIELD(EmpID), Section Type=FILTER(80DDB),80D=FILTER(Normal)));
        }
        field(94; "Form 16 80DDB Amount (Spl.)"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Form 16 Deductible Amount" WHERE(EmpID = FIELD(EmpID), "Section Type" = FILTER(80DDB),80D=FILTER(Special)));
        }
        field(95; "Single Shift"; Code[10])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Shift Master"."Shift Code";
        }
        field(96; "Search Name"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(97; "Salary Payment A/C Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","G/L Account","Bank Account";
        }
        field(98; "Salary Payment A/C No."; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation=IF ("Salary Payment A/C Type"=CONST("G/L Account")) "G/L Account".No.
            //                                                      ELSE IF (Salary Payment A/C Type=CONST(Bank Account)) "Bank Account".No.
        }
        field(99; Picture; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(100; "Standard Offdays"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(101; "Holidays Applicable"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(102; "Overlook PF Salary Limit"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(103; "Overlook ESI Salary Limit"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(104; "Earning Element Amount"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Gen. Journal Line".Amount WHERE("Emp ID" = FIELD(EmpID), "Pay Element" = FIELD(Element Filter),Element Type=FILTER(<>Employer PF&<>Employer ESI&<>Employer CMPF),Type2=CONST(Earning)));
        }
        field(105; "Salary Period"; text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(106; "Salary Days"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(107; "Actual Salary Days"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(108; "Element Filter"; code[20])
        {
            FieldClass = FlowFilter;
        }
        field(109; "Deduction Element Amount"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = - Sum("Gen. Journal Line".Amount WHERE(Emp ID=FIELD(EmpID),Pay Element=FIELD(Element Filter),Element Type=FILTER(<>Employer PF&<>Employer ESI&<>Employer CMPF),Type2=CONST(Deduction)));

        }
        field(110; "Total Earning"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Payroll Journal Line".Amount WHERE(Emp ID=FIELD(EmpID),Element Type=FILTER(<>Employer PF&<>Employer ESI&<>Employer CMPF),Type=CONST(Earning),Arrear Pay Element=FIELD(Arrear Type)));
        }
        field(111; "Total Deduction"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = - Sum("Payroll Journal Line".Amount WHERE(Emp ID=FIELD(EmpID),Element Type=FILTER(<>Employer PF&<>Employer ESI&<>Employer CMPF),Type=CONST(Deduction),Pay Element=FILTER(<>LOAN),Arrear Pay Element=FIELD(Arrear Type)));
        }
        field(112; "Net Salary"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula=Sum("Emp. Ledger Entry".Amount WHERE (EmpID=FIELD(EmpID),Posting Date=FIELD(Date Filter),Salary Entry=FILTER(Yes)));
            Editable = false;
        }
        field(113; "Dispensary(ESI)"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(114; "Anniversary Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(115; "Loan Deduction"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = - Sum("Gen. Journal Line".Amount WHERE(Journal Template Name=CONST(PAYROLL),Loan=FILTER(<>'')));
        }
        field(116; "Notice Period"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(117; "Resignation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(118; "Final Settlement"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(119; "PF Amount"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Emp. PF Entry"."Total PF Amount" WHERE (EmpID=FIELD(EmpID),Posting Date=FIELD(Date Filter)));
            Editable = false;
        }
        field(120; "No. of Off/Holidays"; Integer)
        {
            FieldClass = FlowField;
            // CalcFormula = Count("Daily Attendance Details" WHERE(EmpID = FIELD(EmpID), Date = FIELD(Date Filter),Type=FILTER(Offday|Holiday)));
        }
        field(121; "Final Settlement Processed"; Boolean)
        {
            Editable = false;
        }
        field(122; "Final Settlement Posted"; Boolean)
        {
            Editable = false;
        }
        field(123; Type; option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Employee","Contract","Retainer","Consultant";
        }
        field(124; "Vendor Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(125; "Current Instance"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(126; "Rate per Manday"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(127; "Calender Code"; Code[10])
        {
            // TableRelation = Calender.Code;
            DataClassification = ToBeClassified;
        }
        field(128; "Comp. Off Balance"; Integer)
        {
            FieldClass = FlowField;
            // CalcFormula = count("Daily Attendance Details" WHERE(EmpID = FIELD(EmpID), "Comp Off" = CONST(Yes), Comp Off Assigned=CONST(No)));
            Editable = false;
        }
        field(129; "Half Comp. Off Balance"; Integer)
        {
            FieldClass = FlowField;
            // CalcFormula=Count("Daily Attendance Details" WHERE (EmpID=FIELD(EmpID),"Comp Off" (Half)=CONST(Yes),Comp Off Assigned=CONST(No)));
            Editable = false;
        }
        field(130; "Leave Filter"; code[20])
        {
            FieldClass = FlowFilter;
        }
        field(131; "Availed Leaves in Current Year"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Daily Attendance Details"."Leave Weight" WHERE (EmpID=FIELD(EmpID),Leave Code=FIELD(Leave Filter),Leave Closed=CONST(No),Date=FIELD(Date Filter)));
        }
        field(132; "Comp. Off Availed in Curr. Yr"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula=Sum("Daily Attendance Details"."Leave Weight" WHERE (EmpID=FIELD(EmpID),Leave Code=CONST(COMPOFF),Leave Closed=CONST(No)));
            Editable = false;
        }
        field(133; "Card No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(134; "Employer PF"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula=Sum("Payroll Journal Line".Amount WHERE (Emp ID=FIELD(EmpID),Element Type=FILTER(Employer PF|Employer CMPF),Arrear Pay Element=FIELD(Arrear Type)));
        }
        field(135; "Employer ESI "; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula=Sum("Payroll Journal Line".Amount WHERE (Emp ID=FIELD(EmpID),Element Type=FILTER(Employer ESI),Arrear Pay Element=FIELD(Arrear Type)));
            DecimalPlaces = 2 : 5;
        }
        field(136; "Working (Full Days)"; Integer)
        {
            FieldClass = FlowField;
            // CalcFormula = Count("Daily Attendance Details" WHERE(EmpID = FIELD(EmpID), Date = FIELD(Date Filter),Type=FILTER(Working),Paid=FILTER(Yes),Leave Code=FILTER('')));
            Editable = false;
        }
        field(137; "Off Days"; Integer)
        {
            FieldClass = FlowField;
            // CalcFormula=Count("Daily Attendance Details" WHERE (EmpID=FIELD(EmpID),Date=FIELD(Date Filter),Type=FILTER(Offday),Paid=FILTER(Yes)));
            Editable = false;
        }
        field(138; Holidays; Integer)
        {
            FieldClass = FlowField;
            // CalcFormula=Count("Daily Attendance Details" WHERE (EmpID=FIELD(EmpID),Date=FIELD(Date Filter),Type=FILTER(Holiday)));
            Editable = false;
        }
        field(139; "Working (Half Days)"; Integer)
        {
            FieldClass = FlowField;
            // CalcFormula=Count("Daily Attendance Details" WHERE (EmpID=FIELD(EmpID),Date=FIELD(Date Filter),Type=FILTER(Working),Half Paid=FILTER(Yes),Leave Code=FILTER('')));
            Editable = false;
        }
        field(140; "Earned Element Amount"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula=Sum("Emp. Ledger Entry".Amount WHERE (EmpID=FIELD(EmpID),Pay Element=FIELD(Element Filter),Element Type=FILTER(<>Employer PF&<>Employer ESI&<>Employer CMPF),Type=FILTER(Earning),Posting Date=FIELD(Date Filter)));
        }
        field(141; "Deducted Element Amount"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = - Sum("Emp. Ledger Entry".Amount WHERE(EmpID = FIELD(EmpID), Pay Element=FIELD(Element Filter),Element Type=FILTER(<>Employer PF&<>Employer ESI&<>Employer CMPF),Type=FILTER(Deduction),Posting Date=FIELD(Date Filter)));
            Editable = false;
        }
        field(142; "Posted Employer PF"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula=Sum("Emp. PF Entry"."Total PF Amount" WHERE (EmpID=FIELD(EmpID),Element Type=FILTER(Employer PF),Posting Date=FIELD(Date Filter)));
            Editable = false;
        }
        field(143; "Posted Employer ESI"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula=Sum("Emp. ESI Entry"."Total ESI Amount" WHERE (EmpID=FIELD(EmpID),Element Type=FILTER(Employer ESI),Posting Date=FIELD(Date Filter)));
            DecimalPlaces = 2 : 5;
        }
        field(144; "Posted Total Earning"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Emp. Ledger Entry".Amount WHERE(EmpID = FIELD(EmpID), Element Type=FILTER(<>Employer PF&<>Employer ESI&<>Employer CMPF),Type=CONST(Earning), Posting Date=FIELD(Date Filter)));
        }
        field(145; "Posted Total Deduction"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = - Sum("Emp. Ledger Entry".Amount WHERE(EmpID = FIELD(EmpID), Element Type=FILTER(<>Employer PF&<>Employer ESI&<>Employer CMPF),Type=CONST(Deduction),Posting Date=FIELD(Date Filter)));
        }
        field(146; "Posted Loan Deduction"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = -Sum("Emp. Ledger Entry".Amount WHERE (EmpID=FIELD(EmpID), Loan=FILTER(<>''),Posting Date=FIELD(Date Filter),Type=FILTER(Deduction)));
        }
        field(147; "Working(Half Leave)"; Integer)
        {
            FieldClass = FlowField;
            // CalcFormula = Count("Daily Attendance Details" WHERE (EmpID=FIELD(EmpID),Date=FIELD(Date Filter),Type=FILTER(Working),Status=FILTER(Half Leave),Leave Code=FILTER(<>'')));
            Editable = False;
        }
        field(148; "Bank Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(149; "Payment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Bank Transfer","Cheque","Cash","NEFT";
        }
        field(150; "Arrear Type"; Boolean)
        {
            FieldClass = FlowFilter;
        }
        field(151; "Hold for Payment"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(152; "Permanent Address 1"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(153; "Permanent Address 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(154; "Loan Eligible Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(155; "Approval Authoirty"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = EmployeeMaster;
        }
        field(156; "PT Calculation Mandatory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(157; "IFSC Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(158; "Bank Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(159; "Base Earning"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula=Sum("Employee Pay Element"."Calculation Value" WHERE (EmpID=FIELD(EmpID),Pay Element=FIELD(Element Filter),Type=FILTER(Earning)));
        }
        field(160; "Base Deduction"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Employee Pay Element".Structure WHERE(EmpID = FIELD(EmpID), Pay Element=FIELD(Element Filter),Type=FILTER(Deduction)));
        }
        field(161; "Approval Authoirty2"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = EmployeeMaster;

        }
        field(162; "Approval Authoirty2mail"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(163; "Aadhar Card No"; Code[12])
        {
            // DataClassification = ToBeClassified;
        }
        field(164; "UAN No"; Code[112])
        {
            DataClassification = ToBeClassified;
        }
        field(165; "App Password"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(166; "Location 1"; Code[50])
        {
            TableRelation = Location.Code;
        }
        field(167; "Location 2"; Code[50])
        {
            TableRelation = Location.Code;
        }
        field(168; "Location 3"; Code[50])
        {
            TableRelation = Location.Code;
        }
        field(169; "Location 4"; Code[50])
        {
            TableRelation = Location.Code;
        }
        field(170; "District Code"; Code[20])
        {
            // TableRelation = "Geographical Setup".District WHERE (Zone=FIELD(Zone),State=FIELD(State Code),Region=FIELD(Region Code));
            // ValidateTableRelation = false;
            DataClassification = ToBeClassified;
        }
        field(171; "Reion Code"; Code[20])
        {
            // TableRelation="Geographical Setup".Region WHERE (Zone=FIELD(Zone),State=FIELD(State Code));
            // ValidateTableRelation=No;
            DataClassification = ToBeClassified;
        }
        field(172; Taluka; Text[30])
        {
            // TableRelation = TableRelation="Geographical Setup".Taluka WHERE (Zone=FIELD(Zone),State=FIELD(State Code),Region=FIELD(Region Code),District=FIELD(District Code));
            // ValidateTableRelation = false;
            DataClassification = ToBeClassified;
        }
        field(173; Zone; Code[20])
        {
            // TableRelation="Geographical Setup".Zone;
            // ValidateTableRelation = false;
            DataClassification = ToBeClassified;
        }
        field(174; Village; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(175; "Zone Name"; Text[100])
        {
            FieldClass = FlowField;
            // CalcFormula = Lookup("Zone Master".Description WHERE(Code = FIELD(Zone)));
            Editable = false;
        }
        field(176; "State Name"; Text[100])
        {
            FieldClass = FlowField;
            // CalcFormula = Lookup(State.Description WHERE (Code=FIELD(State Code)));
            Editable = false;
        }
        field(177; "District Name"; Text[100])
        {
            FieldClass = FlowField;
            // CalcFormula=Lookup("District Master".Name WHERE (Code=FIELD(District Code)));
            Editable = false;
        }
        field(178; "Region Name"; Text[100])
        {
            FieldClass = FlowField;
            // CalcFormula=Lookup("Region Master".Name WHERE (Code=FIELD(Region Code)));
            Editable = false;
        }
        field(179; "Taluka Name"; Text[100])
        {
            FieldClass = FlowField;
            // CalcFormula=Lookup("Taluka Master".Description WHERE (Code=FIELD(Taluka)));
            Editable = false;
        }
        field(180; "Perm Taluka"; Text[30])
        {
            // TableRelation = "Geographical Setup".Taluka WHERE (Zone=FIELD(Perm Zone),State=FIELD(Perm State Code),Region=FIELD(Perm Region Code),District=FIELD(Perm District Code));
            DataClassification = ToBeClassified;
        }
        field(181; "Perm Zone"; Code[20])
        {
            // TableRelation="Geographical Setup".Zone;
            // ValidateTableRelation = false;
            DataClassification = ToBeClassified;
        }
        field(182; "Perm Village"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(183; "Perm Zone Name"; Text[100])
        {
            FieldClass = FlowField;
            // CalcFormula=Lookup("Zone Master".Description WHERE (Code=FIELD(Perm Zone)));
            Editable = false;
        }
        field(184; "Perm State Name"; Text[100])
        {
            FieldClass = FlowField;
            // CalcFormula=Lookup(State.Description WHERE (Code=FIELD(Perm State Code)));
            // ValidateTableRelation=No;
            Editable = false;
        }
        field(185; "Perm District Name"; Text[100])
        {
            FieldClass = FlowField;
            // CalcFormula=Lookup("District Master".Name WHERE (Code=FIELD(Perm District Code)));
            Editable = false;
        }
        field(186; "Perm Region Name"; Text[100])
        {
            FieldClass = FlowField;
            // CalcFormula=Lookup("Region Master".Name WHERE (Code=FIELD(Perm Region Code)));
            Editable = false;
        }
        field(187; "Perm Taluka Name"; Text[100])
        {
            FieldClass = FlowField;
            // CalcFormula=Lookup("Taluka Master".Description WHERE (Code=FIELD(Perm Taluka)));
            Editable = false;
        }
        field(188; "Perm District Code"; Code[20])
        {
            // TableRelation = "Geographical Setup".District WHERE (Zone=FIELD(Perm Zone),State=FIELD(Perm State Code),Region=FIELD(Perm Region Code));
            DataClassification = ToBeClassified;
        }
        field(189; "Perm Region Code"; Code[20])
        {
            // TableRelation="Geographical Setup".Region WHERE (Zone=FIELD(Perm Zone),State=FIELD(Perm State Code));
            DataClassification = ToBeClassified;
        }
        field(190; "Perm State Code"; Code[20])
        {
            TableRelation = State;
            DataClassification = ToBeClassified;
        }
        field(191; "Perm Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            DataClassification = ToBeClassified;
        }
        field(192; "Company Mobile No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(193; "Department Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Dimension Value".Name WHERE (Dimension Code=FILTER(DEPARTMENT),Blocked=CONST(No),Dimension Value Type=CONST(Begin-Total));
            // ValidateTableRelation = false;
        }
        field(194; "Sub Department Code"; Code[10])
        {
            // TableRelation = "Dimension Value".Code WHERE (Dimension Code=FILTER(DEPARTMENT),Blocked=CONST(No),Dimension Value Type=CONST(Standard));
            DataClassification = ToBeClassified;
        }
        field(195; "Loan Net Change"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Emp. Ledger Entry".Amount WHERE(EmpID = FIELD(EmpID), Posting Date=FIELD(Date Filter),Loan=FILTER(<>'')));
        }
        field(196; "Without Loan Net Change"; Decimal)
        {
            FieldClass = FlowField;
            // CalcFormula = Sum("Emp. Ledger Entry".Amount WHERE (EmpID=FIELD(EmpID),Posting Date=FIELD(Date Filter),Pay Element=FILTER(ADV|DED|IMPREST)));
            Editable = false;
        }
        field(197; "Full Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(198; HO; Code[30])
        {
            // TableRelation="Employee HO Master".HO;
            DataClassification = ToBeClassified;
        }
        field(199; Branch; Code[20])
        {
            // TableRelation="Employee Branch Master";
            DataClassification = ToBeClassified;
        }
        field(200; "Branch Name"; Text[30])
        {
            FieldClass = FlowField;
            // CalcFormula=Lookup("Employee Branch Master".Description WHERE (Branch=FIELD(Branch)));
        }
        field(201; "Sub Dep Name"; Code[100])
        {
            FieldClass = FlowField;
            // CalcFormula=Lookup("Dimension Value".Name WHERE (Code=FIELD(Sub Department Code),Dimension Code=FILTER(DEPARTMENT)));
        }
        field(202; "Incoming Document Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key1; EmpID)
        {
            Clustered = true;
        }
        key(Key2; Block, "Final Settlement Processed")
        { }
        key(Key3; Type, "Vendor Code")
        { }
        key(Key4; Block, "Global Dimension 2 Code")
        { }
        key(Key5; FirstName)
        { }
        key(Key6; "Full Name")
        { }
        key(Key7; "Department Name")
        { }
        key(Key8; "Card No.")
        { }
        key(Key9; "PF / CMPF No.")
        { }
        key(Key10; "Global Dimension 1 Code", Grade)
        { }
        key(Key11; "Global Dimension 1 Code", "Terminating Date", "Joining Date")
        { }
        key(Key12; "Global Dimension 1 Code", "Terminating Date")
        { }
        key(Key13; "Global Dimension 1 Code", "Joining Date")
        { }
        key(Key14; "Joining Date")
        { }
        key(Key15; BrithDate)
        { }
        key(Key16; Block, "E-Mail", EmpID)
        { }


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