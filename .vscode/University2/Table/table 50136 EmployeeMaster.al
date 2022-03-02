// table 50136 EmployeeMaster
// {
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; EmpID; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 if EmpID <> xRec.EmpID then begin
//                     HRSetup.Get();
//                     NoSeriesMgt.TestManual(HRSetup."Employee No.");
//                     // "No. Series" := '';
//                 end;
//             end;
//         }
//         field(2; FirstName; Text[100])
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 if DimensionValue.GET(GLSetup."Global Dimension 2 Code", EmpID) then begin
//                     DimensionValue.Name := FirstName;
//                     DimensionValue.Modify();
//                 end;
//             end;
//         }
//         field(3; MiddleName; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(4; LastName; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(5; "Address 1"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(6; "Address 2"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(7; PostCode; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Post Code";
//         }
//         field(8; City; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(9; State; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(10; Country; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Country/Region";
//         }
//         field(11; "No. Series"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "No. Series".Code;
//         }
//         field(12; "SalesPers/PurchaserCode"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Salesperson/Purchaser";
//         }
//         field(13; LocationCode; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Location;
//             trigger OnValidate()
//             begin
//                 if Location.get(LocationCode) then
//                     "Employer's T.A.N. No." := Location."T.A.N. No."
//                 else
//                     "Employer's T.A.N. No." := '';
//             end;

//         }
//         field(14; "Global Dimension 1 Code"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
//             trigger OnValidate()
//             begin
//                 ValidateShortcutDimCode(1, "Global Dimension 1 Code");
//                 MODIFY;
//             end;
//         }
//         field(15; "Global Dimension 2 Code"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
//             trigger OnValidate()
//             begin
//                 ValidateShortcutDimCode(2, "Global Dimension 2 Code");
//                 MODIFY;
//             end;
//         }
//         field(16; "Reason Code"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Reason Code";
//         }
//         field(17; "Global Dimension 1 Filter"; Code[20])
//         {
//             FieldClass = FlowFilter;
//             TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
//         }
//         field(18; "Global Dimension 2 Filter"; Code[20])
//         {
//             FieldClass = FlowFilter;
//             TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
//         }
//         field(19; DateFilter; Date)
//         {
//             FieldClass = FlowFilter;
//         }
//         field(20; "Total Hours"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Daily Attendance Details"."Total Hours" WHERE(EmpID = FIELD(EmpID), Date = FIELD(DateFilter)));
//         }
//         field(21; "Total Days"; Integer)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Count("Daily Attendance Details" WHERE(EmpID = FIELD(EmpID), Paid = CONST(Yes), Date = FIELD(DateFilter)));
//         }
//         field(22; Block; Boolean)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 //     EmpLeaveDetails.RESET;
//                 //     EmpLeaveDetails.Setrange(EmpLeaveDetails.EmpID, EmpID);
//                 //     if EmpLeaveDetails.FindFirst then
//                 //         EmpLeaveDetails.MoifyAll(EmpLeaveDetails.Block, Block);
//             end;
//         }
//         field(23; "Half Days"; Integer)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Count("Daily Attendance Details" WHERE(EmpID = FIELD(EmpID), "Half Paid" = CONST(Yes), Date = FIELD(DateFilter)));
//         }
//         field(24; "Joining Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//             Editable = true;
//             trigger OnValidate()
//             begin
//                 // EmpLeaveDetails.RESET;
//                 // EmpLeaveDetails.SETRANGE(EmpLeaveDetails.EmpID, EmpID);
//                 // EmpLeaveDetails.SETFILTER(EmpLeaveDetails."Last Leave Credit Date", '<>%1', 0D);
//                 // if EmpLeaveDetails.FINDFIRST THEN
//                 //     ERROR('Leave has already been credited for the employee %1. You can not change Joining Date.', EmpID);
//                 // if "Joining Date" <> 0D THEN
//                 //     "Confirmation Date" := CALCDATE("Probation Period", "Joining Date")
//                 // else
//                 //     "Confirmation Date" := 0D;
//             end;

//         }
//         field(25; ProbationPeriod; DateFormula)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 // EmpLeaveDetails.RESET;
//                 // EmpLeaveDetails.SETRANGE(EmpLeaveDetails.EmpID, EmpID);
//                 // EmpLeaveDetails.SETFILTER(EmpLeaveDetails."Last Leave Credit Date", '<>%1', 0D);
//                 // if EmpLeaveDetails.FindFirst THEN
//                 //     ERROR('Leave has already been credited for the employee %1. You can not change Probation Period.', EmpID);
//                 // if "Joining Date" <> 0D THEN
//                 //     "Confirmation Date" := CALCDATE("Probation Period", "Joining Date")
//                 // else
//                 //     "Confirmation Date" := 0D;
//             end;
//         }
//         field(26; ConfirmationDate; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(27; "Monthly House Rent"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 if xRec."Monthly House Rent" <> "Monthly House Rent" then begin
//                     MODIFY;
//                     // EmpPayElement.UpdateExemptionHRA(EmpID);
//                 end;
//             end;
//         }
//         field(28; "HRA Exemption"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 if xRec."HRA Exemption" <> "HRA Exemption" THEN begin
//                     Modify();
//                     // EmpPayElement.UpdateExemptionHRA(EmpID);
//                 end;
//             end;
//         }
//         field(29; "Income From House Property"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 IF xRec."Income From House Property" <> "Income From House Property" THEN
//                     if Confirm(Text000, false) then
//                         Validate("Form 16 Income-House Property", "Income From House Property");
//             end;
//         }
//         field(30; "Income From Business/Prof."; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 IF xRec."Income From Business/Prof." <> "Income From Business/Prof." THEN
//                     if CONFIRM(Text001, FALSE) THEN
//                         if "Income From Business/Prof." >= 0 THEN
//                             Validate("Form 16 Income-Business/Prof.", "Income From Business/Prof.");
//             end;
//         }
//         field(31; "Short Term Capital Gains"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 IF xRec."Short Term Capital Gains" <> "Short Term Capital Gains" THEN
//                     if confirm(Text002, false) then
//                         if "Short Term Capital Gains" >= 0 THEN
//                             validate("Form 16 Short Term Cap. Gains", "Short Term Capital Gains");
//             end;
//         }
//         field(32; "Long Term Capital Gains"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 if xRec."Long Term Capital Gains" <> "Long Term Capital Gains" then
//                     if Confirm(Text003, false) then
//                         if "Long Term Capital Gains" >= 0 then
//                             Validate("Form 16 Long Term Cap. Gains", "Long Term Capital Gains");
//             end;
//         }
//         field(33; "Income From Other Sources"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 if xRec."Income From Other Sources" <> "Income From Other Sources" then
//                     if Confirm(Text004, false) then
//                         if "Income From Other Sources" >= 0 then
//                             Validate("Form 16 Income-Other Sources", "Income From Other Sources");
//             end;
//         }
//         field(34; "Tax Male"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 if "Tax Male" then begin
//                     "Tax Female" := false;
//                     "Tax Senior" := false;
//                 end;
//             end;
//         }
//         field(35; "Tax Female"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 if "Tax Female" then begin
//                     "Tax Male" := false;
//                     "Tax Senior" := false;
//                 end;
//             end;
//         }
//         field(36; "Tax Senior"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 if "Tax Senior" then begin
//                     "Tax Male" := false;
//                     "Tax Female" := "Tax Female";
//                 end;
//             end;
//         }
//         field(37; Comment; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(38; "PAN No."; Code[10])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(39; Extension; Text[30])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(40; "Phone No."; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(41; "Mobile No."; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(42; "E-Mail"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(43; "Company E-Mail"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(44; Sex; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = " ","Male","Female";
//         }
//         field(45; BrithDate; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(46; "Father's Name"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(47; "Mother's Name"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(48; "Marital Status"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = " ","Single","Married","Divorced","Widowed";
//         }
//         field(49; "Husband's Name"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(50; "Spouse's Name"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(51; "No. Of Children"; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(52; "Terminating Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(53; "Sanctioning Incharge"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = EmployeeMaster.EmpID;
//         }
//         field(54; "PF / CMPF No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(55; "ESI No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(56; Designation; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(57; "Form 16 Income-House Property"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(58; "Form 16 Income-Business/Prof."; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(59; "Form 16 Short Term Cap. Gains"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(60; "Form 16 Long Term Cap. Gains"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(61; "Form 16 Income-Other Sources"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(62; "Relief U/S 89"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 if xRec."Relief U/S 89" <> "Relief U/S 89" then
//                     if Confirm(text005, false) then
//                         validate("Form 16 Relief U/S 89", "Relief U/S 89");
//             end;
//         }
//         field(63; "Form 16 Relief U/S 89"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(64; "Employer's T.A.N. No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             // TableRelation = "T.A.N. Nos.".Code;
//         }
//         field(65; "Income From Previous Employer"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(66; "TDS by Previous Employer"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(67; "Form 16 Income Prev. Employer"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(68; "Form 16 TDS by Prev. Employer"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(69; "Tax Paid by Employee"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(70; "Form 16 Tax Paid by Employee"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(71; "Income Taxable at Special Rate"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 IF xRec."Income Taxable at Special Rate" <> "Income Taxable at Special Rate" THEN
//                     if Confirm(Text006, false) then
//                         if "Income Taxable at Special Rate" >= 0 then
//                             Validate("Form 16 Income Special Rate", "Income Taxable at Special Rate");
//             end;
//         }
//         field(72; "Form 16 Income Special Rate"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(73; "TDS Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = sum("Salary TDS Entry".Amount WHERE(EmpID = FIELD(EmpID), "Posting Date" = FIELD("Date Filter")));
//         }
//         field(74; "Grade"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             // TableRelation = Grade.Code;
//             trigger OnValidate()
//             begin
//                 // GradePayElement.RESET;
//                 // GradePayElement.SETRANGE(GradePayElement."Grade Code", Grade);
//                 // if GradePayElement.FindFirst THEN BEGIN
//                 //     EmpPayElement.RESET;
//                 //     EmpPayElement.SETRANGE(EmpPayElement.EmpID, EmpID);
//                 //     If EmpPayElement.FINDFIRST THEN
//                 //         EmpPayElement.DELETEALL;
//                 //     repeat
//                 //         EmpPayElement.INIT
//                 //     EmpPayElement.EmpID := EmpID;
//                 //         EmpPayElement.TRANSFERFIELDS(GradePayElement);
//                 //         EmpPayElement.INSERT;

//                 //         EmpPayHistory.INIT;
//                 //         EmpPayHistory.TRANSFERFIELDS(EmpPayElement);
//                 //         EmpPayHistory.Grade := Grade;
//                 //         EmpPayHistory.Date := "Last Pay Revision Date";
//                 //         EmpPayHistory.INSERT;
//                 //     until GradePayElement.NEXT = 0;
//                 // end
//                 // else begin
//                 //     EmpPayElement.RESET;
//                 //     EmpPayElement.SETRANGE(EmpPayElement.EmpID, EmpID);
//                 //     if EmpPayElement.FINDFIRST THEN
//                 //         EmpPayElement.DELETEALL;
//                 // end;
//                 // GradePerquisites.RESET;
//                 // GradePerquisites.SETRANGE(GradePerquisites."Grade Code", Grade);
//                 // if GradePerquisites.FINDFIRST THEN begin
//                 //     EmpPerquisites.RESET;
//                 //     EmpPerquisites.SETRANGE(EmpPerquisites.EmpID, EmpID);
//                 //     if EmpPerquisites.Findfirst THEN
//                 //         EmpPerquisites.DELETEALL;
//                 //     repeat
//                 //         EmpPerquisites.INIT;
//                 //         EmpPerquisites.EmpID := EmpID;
//                 //         EmpPerquisites.TRANSFERFIELDS(GradePerquisites);
//                 //         EmpPerquisites.INSERT;
//                 //         EmpPerHistory.INIT;
//                 //         EmpPerHistory.TRANSFERFIELDS(EmpPerquisites);
//                 //         EmpPerHistory.Grade := Grade;
//                 //         EmpPerHistory.Date := "Last Pay Revision Date";
//                 //         EmpPerHistory.INSERT;
//                 //     until GradePerquisites.NEXT = 0;
//                 // end
//                 // else begin
//                 //     EmpPerquisites.RESET;
//                 //     EmpPerquisites.SETRANGE(EmpPerquisites.EmpID, EmpID);
//                 //     if EmpPerquisites.Findfirst THEN
//                 //         EmpPerquisites.DELETEALL;
//                 // end;
//             end;
//         }
//         field(75; "OT Hours"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Daily Attendance Details"."OT Hours" where(EmpID = field(EmpID), Date = field(DateFilter)));
//         }
//         field(76; "Late Hours"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Daily Attendance Details"."Late Hours" WHERE(EmpID = FIELD(EmpID), Date = FIELD(DateFilter)));
//         }
//         field(77; "80CCE Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Deductible Amount" WHERE(EmpID = FIELD(EmpID), "Section Type" = FILTER(80CCE)));
//         }
//         field(78; "Last Pay Revision Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(79; "Net Change"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Emp. Ledger Entry".Amount WHERE(EmpID = FIELD(EmpID), "Posting Date" = FIELD(DateFilter)));
//         }
//         field(80; Imprest; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Emp. Ledger Entry".Amount WHERE(EmpID = FIELD(EmpID), "Element Type" = CONST(Imprest), "Posting Date" = FIELD(DateFilter)));

//         }
//         field(81; Advance; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Emp. Ledger Entry".Amount WHERE(EmpID = FIELD(EmpID), "Element Type" = CONST(Advance), "Posting Date" = FIELD(DateFilter)));
//         }
//         field(82; "80D Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Deductible Amount" WHERE(EmpID = FIELD(EmpID), "Section Type" = FILTER("80D Amount"), 80D=FILTER(Normal)));
//         }
//         field(83; "80D Amount (Spl.)"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormlua = Sum("Emp. DeductionsUnderChapter-VI"."Deductible Amount" WHERE(EmpID=FIELD(EmpID),"Section Type"=FILTER("80D Amount (Spl.)"),80D=FILTER(Special)));
//         }
//         field(84; "80DD Amount"; Decimal)
//         {
//             FieldClass = flowfield;
//             // CalcFormla = Sum("Emp. DeductionsUnderChapter-VI"."Deducible Amount" where (EmpID = Field(EmpID), "Section Type"= FILTER(80DD),80D=FILTER(Normal)));
//         }
//         field(85; "80DD Amount (Spl.)"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Deductible Amount" WHERE(EmpID = FIELD(EmpID), Section Type=FILTER(80DD),80D=FILTER(Special)));
//         }
//         field(86; "80DDB Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Sum("Emp. DeductionsUnderChapter-VI"."Deductible Amount" WHERE (EmpID=FIELD(EmpID),Section Type=FILTER(80DDB),80D=FILTER(Normal)));
//         }
//         field(87; "80DDB Amount (Spl.)"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Deductible Amount" WHERE(EmpID = FIELD(EmpID), "Section Type" = FILTER(80DDB),80D=FILTER(Special)));

//         }
//         field(88; "Form 16 80CCE Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Form 16 Deductible Amount" WHERE(EmpID = FIELD(EmpID), "Section Type" = FILTER(80CCE)));
//         }
//         field(89; "Form 16 80D Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Form 16 Deductible Amount" WHERE(EmpID = FIELD(EmpID), "Section Type" = FILTER(80D),80D=FILTER(Normal)));
//         }
//         field(90; "Form 16 80D Amount (Spl.)"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Sum("Emp. DeductionsUnderChapter-VI"."Form 16 Deductible Amount" WHERE (EmpID=FIELD(EmpID),"Section Type"=FILTER(80D),80D=FILTER(Special)));
//         }
//         field(91; "Form 16 80DD Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Sum("Emp. DeductionsUnderChapter-VI"."Form 16 Deductible Amount" WHERE (EmpID=FIELD(EmpID),"Section Type"=FILTER(80DD),80D=FILTER(Normal)));
//         }
//         field(92; "Form 16 80DD Amount (Spl.)"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Form 16 Deductible Amount" WHERE(EmpID = FIELD(EmpID), Section Type=FILTER(80DD),80D=FILTER(Special)));
//         }
//         field(93; "Form 16 80DDB Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Form 16 Deductible Amount" WHERE(EmpID = FIELD(EmpID), Section Type=FILTER(80DDB),80D=FILTER(Normal)));
//         }
//         field(94; "Form 16 80DDB Amount (Spl.)"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Emp. DeductionsUnderChapter-VI"."Form 16 Deductible Amount" WHERE(EmpID = FIELD(EmpID), "Section Type" = FILTER(80DDB),80D=FILTER(Special)));
//         }
//         field(95; "Single Shift"; Code[10])
//         {
//             DataClassification = ToBeClassified;
//             // TableRelation = "Shift Master"."Shift Code";
//         }
//         field(96; "Search Name"; Code[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(97; "Salary Payment A/C Type"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = " ","G/L Account","Bank Account";
//             trigger OnValidate()
//             begin
//                 if ("Salary Payment A/C Type" = "Salary Payment A/C Type"::" ") or ("Salary Payment A/C Type" <> xRec."Salary Payment A/C Type") then
//                     "Salary Payment A/C No." := ' ';
//             end;
//         }
//         field(98; "Salary Payment A/C No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             // TableRelation=IF ("Salary Payment A/C Type"=CONST("G/L Account")) "G/L Account".No.
//             //                                                      ELSE IF (Salary Payment A/C Type=CONST(Bank Account)) "Bank Account".No.
//         }
//         field(99; Picture; Blob)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(100; "Standard Offdays"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(101; "Holidays Applicable"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(102; "Overlook PF Salary Limit"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(103; "Overlook ESI Salary Limit"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(104; "Earning Element Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Gen. Journal Line".Amount WHERE("Emp ID" = FIELD(EmpID), "Pay Element" = FIELD(Element Filter),Element Type=FILTER(<>Employer PF&<>Employer ESI&<>Employer CMPF),Type2=CONST(Earning)));
//         }
//         field(105; "Salary Period"; text[30])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(106; "Salary Days"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(107; "Actual Salary Days"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(108; "Element Filter"; code[20])
//         {
//             FieldClass = FlowFilter;
//         }
//         field(109; "Deduction Element Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = - Sum("Gen. Journal Line".Amount WHERE(Emp ID=FIELD(EmpID),Pay Element=FIELD(Element Filter),Element Type=FILTER(<>Employer PF&<>Employer ESI&<>Employer CMPF),Type2=CONST(Deduction)));

//         }
//         field(110; "Total Earning"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Payroll Journal Line".Amount WHERE(Emp ID=FIELD(EmpID),Element Type=FILTER(<>Employer PF&<>Employer ESI&<>Employer CMPF),Type=CONST(Earning),Arrear Pay Element=FIELD(Arrear Type)));
//         }
//         field(111; "Total Deduction"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = - Sum("Payroll Journal Line".Amount WHERE(Emp ID=FIELD(EmpID),Element Type=FILTER(<>Employer PF&<>Employer ESI&<>Employer CMPF),Type=CONST(Deduction),Pay Element=FILTER(<>LOAN),Arrear Pay Element=FIELD(Arrear Type)));
//         }
//         field(112; "Net Salary"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Sum("Emp. Ledger Entry".Amount WHERE (EmpID=FIELD(EmpID),Posting Date=FIELD(Date Filter),Salary Entry=FILTER(Yes)));
//             Editable = false;
//         }
//         field(113; "Dispensary(ESI)"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(114; "Anniversary Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(115; "Loan Deduction"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = - Sum("Gen. Journal Line".Amount WHERE(Journal Template Name=CONST(PAYROLL),Loan=FILTER(<>'')));
//         }
//         field(116; "Notice Period"; DateFormula)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(117; "Resignation Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(118; "Final Settlement"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(119; "PF Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Emp. PF Entry"."Total PF Amount" WHERE (EmpID=FIELD(EmpID),Posting Date=FIELD(Date Filter)));
//             Editable = false;
//         }
//         field(120; "No. of Off/Holidays"; Integer)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Count("Daily Attendance Details" WHERE(EmpID = FIELD(EmpID), Date = FIELD(Date Filter),Type=FILTER(Offday|Holiday)));
//         }
//         field(121; "Final Settlement Processed"; Boolean)
//         {
//             Editable = false;
//         }
//         field(122; "Final Settlement Posted"; Boolean)
//         {
//             Editable = false;
//         }
//         field(123; Type; option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = " ","Employee","Contract","Retainer","Consultant";
//             trigger OnValidate()
//             begin
//                 // IF Type = Type::Employee THEN
//                 //     "Vendor Code" := ' ';
//                 // if Type <> type::Contract then
//                 //     "Rate per Manday" := 0;
//                 // if Type <> type::Employee then begin
//                 //     EmpPayElement.RESET;
//                 //     EmpPayElement.SETRANGE(EmpPayElement.EmpID, EmpID);
//                 //     EmpPayElement.SETRANGE(EmpPayElement."Element Type", EmpPayElement."Element Type"::TDS);
//                 //     if EmpPayElement.FINDFIRST THEN
//                 //         Error(Text007, EmpID, Type);
//                 // end;
//                 // if Type in [Type::Retainer, Type::Consultant] then begin
//                 //     EmpPayElement.RESET;
//                 //     EmpPayElement.SETRANGE(EmpPayElement.EmpID, EmpID);
//                 //     EmpPayElement.SETFILTER(EmpPayElement."Element Type", '%1|%2|%3',
//                 //     EmpPayElement."Element Type"::PF, EmpPayElement."Element Type"::CMPF, EmpPayElement."Element Type"::ESI);
//                 //     if EmpPayElement.FINDFIRST THEN
//                 //         Error(Text008, EmpID, type);
//                 // end;
//             end;
//         }
//         field(124; "Vendor Code"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Vendor;
//         }
//         field(125; "Current Instance"; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(126; "Rate per Manday"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 TestField(Type, Type::Contract);
//             end;
//         }
//         field(127; "Calender Code"; Code[10])
//         {
//             // TableRelation = Calender.Code;
//             DataClassification = ToBeClassified;
//         }
//         field(128; "Comp. Off Balance"; Integer)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = count("Daily Attendance Details" WHERE(EmpID = FIELD(EmpID), "Comp Off" = CONST(Yes), Comp Off Assigned=CONST(No)));
//             Editable = false;
//         }
//         field(129; "Half Comp. Off Balance"; Integer)
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Count("Daily Attendance Details" WHERE (EmpID=FIELD(EmpID),"Comp Off" (Half)=CONST(Yes),Comp Off Assigned=CONST(No)));
//             Editable = false;
//         }
//         field(130; "Leave Filter"; code[20])
//         {
//             FieldClass = FlowFilter;
//         }
//         field(131; "Availed Leaves in Current Year"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Daily Attendance Details"."Leave Weight" WHERE (EmpID=FIELD(EmpID),Leave Code=FIELD(Leave Filter),Leave Closed=CONST(No),Date=FIELD(Date Filter)));
//         }
//         field(132; "Comp. Off Availed in Curr. Yr"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Sum("Daily Attendance Details"."Leave Weight" WHERE (EmpID=FIELD(EmpID),Leave Code=CONST(COMPOFF),Leave Closed=CONST(No)));
//             Editable = false;
//         }
//         field(133; "Card No."; Code[10])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(134; "Employer PF"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Sum("Payroll Journal Line".Amount WHERE (Emp ID=FIELD(EmpID),Element Type=FILTER(Employer PF|Employer CMPF),Arrear Pay Element=FIELD(Arrear Type)));
//         }
//         field(135; "Employer ESI "; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Sum("Payroll Journal Line".Amount WHERE (Emp ID=FIELD(EmpID),Element Type=FILTER(Employer ESI),Arrear Pay Element=FIELD(Arrear Type)));
//             DecimalPlaces = 2 : 5;
//         }
//         field(136; "Working (Full Days)"; Integer)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Count("Daily Attendance Details" WHERE(EmpID = FIELD(EmpID), Date = FIELD(Date Filter),Type=FILTER(Working),Paid=FILTER(Yes),Leave Code=FILTER('')));
//             Editable = false;
//         }
//         field(137; "Off Days"; Integer)
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Count("Daily Attendance Details" WHERE (EmpID=FIELD(EmpID),Date=FIELD(Date Filter),Type=FILTER(Offday),Paid=FILTER(Yes)));
//             Editable = false;
//         }
//         field(138; Holidays; Integer)
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Count("Daily Attendance Details" WHERE (EmpID=FIELD(EmpID),Date=FIELD(Date Filter),Type=FILTER(Holiday)));
//             Editable = false;
//         }
//         field(139; "Working (Half Days)"; Integer)
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Count("Daily Attendance Details" WHERE (EmpID=FIELD(EmpID),Date=FIELD(Date Filter),Type=FILTER(Working),Half Paid=FILTER(Yes),Leave Code=FILTER('')));
//             Editable = false;
//         }
//         field(140; "Earned Element Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Sum("Emp. Ledger Entry".Amount WHERE (EmpID=FIELD(EmpID),Pay Element=FIELD(Element Filter),Element Type=FILTER(<>Employer PF&<>Employer ESI&<>Employer CMPF),Type=FILTER(Earning),Posting Date=FIELD(Date Filter)));
//         }
//         field(141; "Deducted Element Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = - Sum("Emp. Ledger Entry".Amount WHERE(EmpID = FIELD(EmpID), Pay Element=FIELD(Element Filter),Element Type=FILTER(<>Employer PF&<>Employer ESI&<>Employer CMPF),Type=FILTER(Deduction),Posting Date=FIELD(Date Filter)));
//             Editable = false;
//         }
//         field(142; "Posted Employer PF"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Sum("Emp. PF Entry"."Total PF Amount" WHERE (EmpID=FIELD(EmpID),Element Type=FILTER(Employer PF),Posting Date=FIELD(Date Filter)));
//             Editable = false;
//         }
//         field(143; "Posted Employer ESI"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Sum("Emp. ESI Entry"."Total ESI Amount" WHERE (EmpID=FIELD(EmpID),Element Type=FILTER(Employer ESI),Posting Date=FIELD(Date Filter)));
//             DecimalPlaces = 2 : 5;
//         }
//         field(144; "Posted Total Earning"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Emp. Ledger Entry".Amount WHERE(EmpID = FIELD(EmpID), Element Type=FILTER(<>Employer PF&<>Employer ESI&<>Employer CMPF),Type=CONST(Earning), Posting Date=FIELD(Date Filter)));
//         }
//         field(145; "Posted Total Deduction"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = - Sum("Emp. Ledger Entry".Amount WHERE(EmpID = FIELD(EmpID), Element Type=FILTER(<>Employer PF&<>Employer ESI&<>Employer CMPF),Type=CONST(Deduction),Posting Date=FIELD(Date Filter)));
//         }
//         field(146; "Posted Loan Deduction"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = -Sum("Emp. Ledger Entry".Amount WHERE (EmpID=FIELD(EmpID), Loan=FILTER(<>''),Posting Date=FIELD(Date Filter),Type=FILTER(Deduction)));
//         }
//         field(147; "Working(Half Leave)"; Integer)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Count("Daily Attendance Details" WHERE (EmpID=FIELD(EmpID),Date=FIELD(Date Filter),Type=FILTER(Working),Status=FILTER(Half Leave),Leave Code=FILTER(<>'')));
//             Editable = False;
//         }
//         field(148; "Bank Account No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(149; "Payment Type"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = " ","Bank Transfer","Cheque","Cash","NEFT";
//         }
//         field(150; "Arrear Type"; Boolean)
//         {
//             FieldClass = FlowFilter;
//         }
//         field(151; "Hold for Payment"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(152; "Permanent Address 1"; text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(153; "Permanent Address 2"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(154; "Loan Eligible Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(155; "Approval Authoirty"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = EmployeeMaster;
//         }
//         field(156; "PT Calculation Mandatory"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(157; "IFSC Code"; Code[30])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(158; "Bank Name"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(159; "Base Earning"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Sum("Employee Pay Element"."Calculation Value" WHERE (EmpID=FIELD(EmpID),Pay Element=FIELD(Element Filter),Type=FILTER(Earning)));
//         }
//         field(160; "Base Deduction"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Employee Pay Element".Structure WHERE(EmpID = FIELD(EmpID), Pay Element=FIELD(Element Filter),Type=FILTER(Deduction)));
//         }
//         field(161; "Approval Authoirty2"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = EmployeeMaster;

//         }
//         field(162; "Approval Authoirty2mail"; Text[80])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(163; "Aadhar Card No"; Code[12])
//         {
//             // DataClassification = ToBeClassified;
//         }
//         field(164; "UAN No"; Code[112])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(165; "App Password"; Text[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(166; "Location 1"; Code[50])
//         {
//             TableRelation = Location.Code;
//         }
//         field(167; "Location 2"; Code[50])
//         {
//             TableRelation = Location.Code;
//         }
//         field(168; "Location 3"; Code[50])
//         {
//             TableRelation = Location.Code;
//         }
//         field(169; "Location 4"; Code[50])
//         {
//             TableRelation = Location.Code;
//         }
//         field(170; "District Code"; Code[20])
//         {
//             // TableRelation = "Geographical Setup".District WHERE (Zone=FIELD(Zone),State=FIELD(State Code),Region=FIELD(Region Code));
//             // ValidateTableRelation = false;
//             DataClassification = ToBeClassified;
//         }
//         field(171; "Reion Code"; Code[20])
//         {
//             // TableRelation="Geographical Setup".Region WHERE (Zone=FIELD(Zone),State=FIELD(State Code));
//             // ValidateTableRelation=No;
//             DataClassification = ToBeClassified;
//         }
//         field(172; Taluka; Text[30])
//         {
//             // TableRelation = TableRelation="Geographical Setup".Taluka WHERE (Zone=FIELD(Zone),State=FIELD(State Code),Region=FIELD(Region Code),District=FIELD(District Code));
//             // ValidateTableRelation = false;
//             DataClassification = ToBeClassified;
//         }
//         field(173; Zone; Code[20])
//         {
//             // TableRelation="Geographical Setup".Zone;
//             // ValidateTableRelation = false;
//             DataClassification = ToBeClassified;
//         }
//         field(174; Village; Text[30])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(175; "Zone Name"; Text[100])
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Lookup("Zone Master".Description WHERE(Code = FIELD(Zone)));
//             Editable = false;
//         }
//         field(176; "State Name"; Text[100])
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Lookup(State.Description WHERE (Code=FIELD(State Code)));
//             Editable = false;
//         }
//         field(177; "District Name"; Text[100])
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Lookup("District Master".Name WHERE (Code=FIELD(District Code)));
//             Editable = false;
//         }
//         field(178; "Region Name"; Text[100])
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Lookup("Region Master".Name WHERE (Code=FIELD(Region Code)));
//             Editable = false;
//         }
//         field(179; "Taluka Name"; Text[100])
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Lookup("Taluka Master".Description WHERE (Code=FIELD(Taluka)));
//             Editable = false;
//         }
//         field(180; "Perm Taluka"; Text[30])
//         {
//             // TableRelation = "Geographical Setup".Taluka WHERE (Zone=FIELD(Perm Zone),State=FIELD(Perm State Code),Region=FIELD(Perm Region Code),District=FIELD(Perm District Code));
//             DataClassification = ToBeClassified;
//         }
//         field(181; "Perm Zone"; Code[20])
//         {
//             // TableRelation="Geographical Setup".Zone;
//             // ValidateTableRelation = false;
//             DataClassification = ToBeClassified;
//         }
//         field(182; "Perm Village"; Text[30])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(183; "Perm Zone Name"; Text[100])
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Lookup("Zone Master".Description WHERE (Code=FIELD(Perm Zone)));
//             Editable = false;
//         }
//         field(184; "Perm State Name"; Text[100])
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Lookup(State.Description WHERE (Code=FIELD(Perm State Code)));
//             // ValidateTableRelation=No;
//             Editable = false;
//         }
//         field(185; "Perm District Name"; Text[100])
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Lookup("District Master".Name WHERE (Code=FIELD(Perm District Code)));
//             Editable = false;
//         }
//         field(186; "Perm Region Name"; Text[100])
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Lookup("Region Master".Name WHERE (Code=FIELD(Perm Region Code)));
//             Editable = false;
//         }
//         field(187; "Perm Taluka Name"; Text[100])
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Lookup("Taluka Master".Description WHERE (Code=FIELD(Perm Taluka)));
//             Editable = false;
//         }
//         field(188; "Perm District Code"; Code[20])
//         {
//             // TableRelation = "Geographical Setup".District WHERE (Zone=FIELD(Perm Zone),State=FIELD(Perm State Code),Region=FIELD(Perm Region Code));
//             DataClassification = ToBeClassified;
//         }
//         field(189; "Perm Region Code"; Code[20])
//         {
//             // TableRelation="Geographical Setup".Region WHERE (Zone=FIELD(Perm Zone),State=FIELD(Perm State Code));
//             DataClassification = ToBeClassified;
//         }
//         field(190; "Perm State Code"; Code[20])
//         {
//             TableRelation = State;
//             DataClassification = ToBeClassified;
//         }
//         field(191; "Perm Post Code"; Code[20])
//         {
//             TableRelation = "Post Code";
//             DataClassification = ToBeClassified;
//         }
//         field(192; "Company Mobile No"; Code[10])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(193; "Department Name"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//             // TableRelation = "Dimension Value".Name WHERE (Dimension Code=FILTER(DEPARTMENT),Blocked=CONST(No),Dimension Value Type=CONST(Begin-Total));
//             // ValidateTableRelation = false;
//         }
//         field(194; "Sub Department Code"; Code[10])
//         {
//             // TableRelation = "Dimension Value".Code WHERE (Dimension Code=FILTER(DEPARTMENT),Blocked=CONST(No),Dimension Value Type=CONST(Standard));
//             DataClassification = ToBeClassified;
//         }
//         field(195; "Loan Net Change"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Emp. Ledger Entry".Amount WHERE(EmpID = FIELD(EmpID), Posting Date=FIELD(Date Filter),Loan=FILTER(<>'')));
//         }
//         field(196; "Without Loan Net Change"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Emp. Ledger Entry".Amount WHERE (EmpID=FIELD(EmpID),Posting Date=FIELD(Date Filter),Pay Element=FILTER(ADV|DED|IMPREST)));
//             Editable = false;
//         }
//         field(197; "Full Name"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(198; HO; Code[30])
//         {
//             // TableRelation="Employee HO Master".HO;
//             DataClassification = ToBeClassified;
//         }
//         field(199; Branch; Code[20])
//         {
//             // TableRelation="Employee Branch Master";
//             DataClassification = ToBeClassified;
//         }
//         field(200; "Branch Name"; Text[30])
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Lookup("Employee Branch Master".Description WHERE (Branch=FIELD(Branch)));
//         }
//         field(201; "Sub Dep Name"; Code[100])
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Lookup("Dimension Value".Name WHERE (Code=FIELD(Sub Department Code),Dimension Code=FILTER(DEPARTMENT)));
//         }
//         field(202; "Incoming Document Entry No."; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//     }
//     keys
//     {
//         key(Key1; EmpID)
//         {
//             Clustered = true;
//         }
//         key(Key2; Block, "Final Settlement Processed")
//         { }
//         key(Key3; Type, "Vendor Code")
//         { }
//         key(Key4; Block, "Global Dimension 2 Code")
//         { }
//         key(Key5; FirstName)
//         { }
//         key(Key6; "Full Name")
//         { }
//         key(Key7; "Department Name")
//         { }
//         key(Key8; "Card No.")
//         { }
//         key(Key9; "PF / CMPF No.")
//         { }
//         key(Key10; "Global Dimension 1 Code", Grade)
//         { }
//         key(Key11; "Global Dimension 1 Code", "Terminating Date", "Joining Date")
//         { }
//         key(Key12; "Global Dimension 1 Code", "Terminating Date")
//         { }
//         key(Key13; "Global Dimension 1 Code", "Joining Date")
//         { }
//         key(Key14; "Joining Date")
//         { }
//         key(Key15; BrithDate)
//         { }
//         key(Key16; Block, "E-Mail", EmpID)
//         { }


//     }
//     // fieldgroups
//     // {
//     //     {1; DropDown; EmpID,FullName, "Department Name"}
//     // }

//     var
//         PostCode: Record 225;
//         HRSetup: Record "Human Resource Setup";
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//         Emp: Record EmployeeMaster;
//         Location: Record 14;
//         DimensionValue: record 349;
//         GLSetup: record 98;
//         // EmpLeaveDetails: Record 60006;
//         // GradePayElement: Record 60020;
//         // GradePerquisites: Record 60021;
//         EmpPayElement: Record "Employee Pay Element";
//         // EmpPayHistory: Record 60025;
//         // EmpPerHistory: Record 60026;
//         // EmpHistory: Record 60039;
//         // EmpDir: Record 60040;
//         Text000: TextConst ENU = 'Do you want to update Form 16 Income-House Property?';
//         Text001: TextConst ENU = 'Do you want to update Form 16 Income-Business/Prof.?';
//         Text002: TextConst ENU = 'Do you want to update Form 16 Short Term Cap. Gains?';
//         Text003: TextConst ENU = 'Do you want to update Form 16 Long Term Cap. Gains?';
//         Text004: TextConst ENU = 'Do you want to update Form 16 Income-Other Sources?';
//         Text005: TextConst ENU = 'Do you want to update Form 16 Relief U/S 89?';
//         Text006: TextConst ENU = 'Do you want to update Form 16 Income Special Rate?';
//         Text007: TextConst ENU = 'Please remove the TDS type element from the Pay Structure of the Employee %1 beefore converting to %2.';
//         Text008: TextConst ENU = 'Please remove the PF/CMPF/ESI type elements from the Pay Structure of the Employee %1 before converting to %2.';
//         EmpRc: Record EmployeeMaster;

//     trigger OnInsert()
//     begin
//         if EmpID = '' then begin
//             HRSetup.GET;
//             HRSetup.TESTFIELD("Employee No.");
//             NoSeriesMgt.InitSeries(HRSetup."Employee No.", xRec."No. Series", 0D, EmpID, "No. Series");
//         end;
//         // IF NOT EmpDir.GET(EmpID, COMPANYNAME) THEN BEGIN
//         //     EmpDir.TRANSFERFIELDS(Rec);
//         //     EmpDir."Company Name" := COMPANYNAME;
//         //     EmpDir.INSERT;
//         // END;
//         // IF NOT EmpHistory.GET(EmpID, COMPANYNAME, Type, "Current Instance") THEN BEGIN
//         //     EmpHistory.INIT;
//         //     EmpHistory.TRANSFERFIELDS(Rec);
//         //     EmpHistory."Company Name" := COMPANYNAME;
//         //     EmpHistory.INSERT;
//         // END;
//     end;

//     trigger OnModify()
//     begin
//         // TestField("Final Settlement Posted", false);
//         // if IF EmpHistory.GET(EmpID, COMPANYNAME, Type, "Current Instance") THEN BEGIN
//         //     EmpHistory.TRANSFERFIELDS(Rec);
//         //     EmpHistory."Company Name" := COMPANYNAME;
//         //     EmpHistory.MODIFY;
//         // END;
//         // IF EmpDir.GET(EmpID, COMPANYNAME) THEN BEGIN
//         //     EmpDir.TRANSFERFIELDS(Rec);
//         //     EmpDir.MODIFY;
//         // END;
//     end;

//     trigger OnDelete()
//     begin
//         // TestField("Final Settlement Posted", false);
//         // EmpLedgerEntry.RESET;
//         // EmpLedgerEntry.SETRANGE(EmpLedgerEntry.EmpID, EmpID);
//         // IF EmpLedgerEntry.Findfirst THEN
//         //     ERROR('Records in Emp. Ledger Entry exist for the employee %1. You can not delete this employee.', EmpID);

//         // EmpHistory.RESET;
//         // EmpHistory.SETRANGE(EmpID, EmpID);
//         // EmpHistory.SETRANGE("Company Name", COMPANYNAME);
//         // IF EmpHistory.FIND('-') THEN BEGIN
//         //     EmpHistory.DELETEALL;
//         // END;

//         // IF EmpDir.GET(EmpID, COMPANYNAME) THEN BEGIN
//         //     EmpDir.DELETE;
//         // END;
//     end;

//     trigger OnRename()
//     begin
//         // TESTFIELD("Final Settlement Posted", FALSE);
//         // EmpLedgerEntry.RESET;
//         // EmpLedgerEntry.SETRANGE(EmpLedgerEntry.EmpID, xRec.EmpID);
//         // IF EmpLedgerEntry.Findfirst THEN
//         //     ERROR('Records in Emp. Ledger Entry exist for the employee %1. You can not modify this employee.', EmpID);

//         // IF EmpHistory.GET(xRec.EmpID, COMPANYNAME, Type, "Current Instance") THEN BEGIN
//         //     EmpHistory.RENAME(EmpID, COMPANYNAME, Type, "Current Instance");
//         // END;

//         // IF EmpDir.GET(xRec.EmpID, COMPANYNAME) THEN BEGIN
//         //     EmpDir.RENAME(EmpID, COMPANYNAME);
//         // END;
//     end;

//     procedure AssistEdit(OldEmp: Record EmployeeMaster): Boolean
//     begin
//         WITH Emp DO BEGIN
//             Emp := Rec;
//             HRSetup.GET;
//             HRSetup.TESTFIELD("Employee No.");
//             IF NoSeriesMgt.SelectSeries(HRSetup."Employee No.", OldEmp."No. Series", "No. Series") THEN BEGIN
//                 NoSeriesMgt.SetSeries(EmpID);
//                 Rec := Emp;
//                 EXIT(TRUE);
//             END;
//         END;
//     end;

//     procedure ValidateShortcutDimCode(FieldNo: Integer; ShortcutDimCode: Code[20])
//     begin

//     end;

//     procedure MF();
//     var
//         Tofile: Text[250];
//         PdfDownloaded: Boolean;
//         mail: Codeunit 397;
//         Name: Text[100];
//         FileDirectory: Text[250];
//         smtp: Codeunit 400;
//         mailsetup: Record 409;
//         subject: Text[250];
//         address: Text[250];
//         Emp: Record 5200;
//         reclinks: Record 2000000068;
//         CRLF: text[2];
//         SIH: Record 112;
//         em: Record EmployeeMaster;
//     begin
//         IF "Company E-Mail" <> '' THEN BEGIN
//             mailsetup.GET;
//             subject := 'Salary Slip - Your Employee No.' + ' ' + FORMAT(EmpID);
//             FileDirectory := 'D:\Inv\attachments\Report60009.pdf';
//             // address := FORMAT('Hi') + ' ' + ' ' + FORMAT("First Name") + ' ,';
//             // smtp.CreateMessage('Operations HR', 'info@eagleseeds.com', "Company E-Mail", subject, address, FALSE);
//             // smtp.AddCC('girvendra.jhala@eagleseeds.com');
//             // //SLEEP(1500);
//             // //IF FILE.EXISTS(FileDirectory) THEN
//             // smtp.AddAttachment(FileDirectory, '');
//             // //SLEEP(1500);
//             smtp.Send;

//             //SLEEP(1500);
//             //FILE.ERASE(FileDirectory);
//         END;
//     end;

//     procedure MFALLEmp(empmaster: Record EmployeeMaster)
//     var
//         Tofile: Text[250];
//         PdfDownloaded: Boolean;
//         mail: Codeunit 397;
//         Name: Text[100];
//         FileDirectory: Text[250];
//         smtp: Codeunit 400;
//         mailsetup: Record 409;
//         subject: text[250];
//         address: Text[250];
//         EmpRec: Record EmployeeMaster;
//         reclinks: Record 2000000068;
//         CRLF: Text[2];
//         SIH: Record 112;
//         empRec1: Record EmployeeMaster;
//         HRSetup: Record "Human Resource Setup";
//     begin
//         //     mailsetup.Get();
//         //     HRSetup.Get();
//         //     EmpRec.Reset();
//         //     EmpRc.SETRANGE(EmpID, empmaster.EmpID);
//         //     IF EmpRc.FIND('-') THEN BEGIN
//         //         Name := STRSUBSTNO('Salary Slip-EmpID %1.pdf', EmpRc.EmpID);
//         //         subject := 'Salary Slip - For Month' + ' ' + FORMAT(HRSetup."Month Name");//+' '+FORMAT(EmpRc."Company E-Mail");
//         //         Tofile := Name;
//         //         FileDirectory := 'D:\Inv\attachments\' + Tofile;
//         //         address := FORMAT('Dear Sir/Mam ,');// +' '+FORMAT(EmpRc."First Name")+' ,';
//         //         REPORT.SAVEASPDF(REPORT::"Salary Slip_old", FileDirectory, EmpRc);
//         //         IF EXISTS(FileDirectory) THEN BEGIN
//         //             smtp.CreateMessage('Salary Slip', 'info@eagleseeds.com', EmpRc."Company E-Mail", subject, address, FALSE);
//         //             //smtp.AppendBody(CRLF+CRLF+'Salary For Month'+' '+FORMAT(HRSetup."Month Name"));
//         //             CRLF[1] := 13;
//         //             CRLF[2] := 10;
//         //             smtp.AppendBody(CRLF + CRLF + 'Please find attched Salary Slip For Month ' + FORMAT(HRSetup."Month Name"));
//         //             //smtp.AddCC('girvendra.jhala@eagleseeds.com');
//         //             //smtp.AddCC('shiv.galbha@eagleseeds.com');
//         //             //pbs sagar migration add '' in filedirectory//
//         //             smtp.AddAttachment(FileDirectory, '');
//         //             smtp.Send;
//         //             FILE.ERASE(FileDirectory);
//         //         END;
//         // END;


//     end;

// }