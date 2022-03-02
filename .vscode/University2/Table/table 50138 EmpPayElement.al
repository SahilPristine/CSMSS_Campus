// table 50138 "Employee Pay Element"
// {
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; EmpID; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = EmployeeMaster.EmpID;
//             NotBlank = true;
//             Editable = true;
//         }
//         field(2; "Calculation Order"; Integer)
//         {
//             MinValue = 1;
//             MaxValue = 100;
//             Editable = true;
//         }
//         field(3; "Pay Element"; Code[20])
//         {
//             NotBlank = false;
//             Editable = true;
//             TableRelation = "Pay Element".code where("Salary Component" = CONST(Yes));
//             trigger OnValidate()
//             begin
//                 if PayElement.Get("Pay Element") then begin
//                     if PayElement."Element Type" IN [PayElement."Element Type"::"Prof. Tax", PayElement."Element Type"::Gratuity, PayElement."Element Type"::"Leave Encash."] THEN
//                         ERROR(Text000);
//                     Description := PayElement.Description;
//                     Type := PayElement.Type;
//                     Period := PayElement.Period;
//                     "Element Type" := PayElement."Element Type";
//                     "Debit A/C" := PayElement."Debit A/C";
//                     "Credit A/C" := PayElement."Credit A/C";
//                     "Monthly Exemption Amount" := PayElement."Monthly Exemption Amount";
//                     "Exempt U/S 10" := PayElement."Exempt U/S 10";
//                     Taxable := PayElement.Taxable;
//                     "Pay Without Bill" := PayElement."Pay Without Bill";
//                     Emp1.GET(EmpID);
//                     IF ("Element Type" IN ["Element Type"::PF, "Element Type"::CMPF, "Element Type"::ESI]) AND
//                     (Emp1.Type IN [Emp1.Type::Retainer, Emp1.Type::Consultant]) THEN
//                         ERROR(Text001);
//                     IF "Element Type" = "Element Type"::TDS THEN BEGIN
//                         Emp1.TESTFIELD(Type, Emp1.Type::Employee);
//                         "Calculation Type" := "Calculation Type"::"Fixed Amount";
//                         IF Emp1."Employer's T.A.N. No." = '' THEN
//                             ERROR('First enter T.A.N. No. of the employee %1, for entering TDS type elements.', EmpID);

//                     end
//                     else
//                         "Calculation Type" := "Calculation Type"::" ";
//                 end
//                 else
//                     "Calculation Type" := "Calculation Type"::" ";
//                 if xRec."Pay Element" <> "Pay Element" THEN begin
//                     "Calculation Formula" := '';
//                     "Calculation Value" := 0;
//                     Quantity := 0;
//                     "Actual Value" := 0;
//                     "Exemption Formula" := '';
//                 end;
//             end;
//         }
//         field(4; Decription; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(5; Type; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = " ",Earning,Deduction;
//         }
//         field(6; Period; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = " ",Hourly,Daily,Weekly,Monthly,Yearly,Occasional;
//         }
//         field(7; "Element Type"; option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = " ",PF,ESI,HRA,TDS,OT,Reimbursement,Late,"Entertainment Allowance","Tax on Employment",Advance,Imprest,"Employer PF","Employer ESI","Prof. Tax","Leave Encash.",Gratuity,CMPF,"Employer CMPF";
//             trigger onvalidate()
//             begin

//             end;
//         }
//         field(8; "Calculation Type"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = " ","Fixed Amount","%age","Amount per Qty.";
//         }
//         field(9; "Calculation Formula"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(10; "Debit A/C"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "G/L Account";
//         }
//         field(11; "Credit A/C"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "G/L Account";
//         }
//         field(12; "Calculation Value"; Code[20])
//         {
//             DataClassification = ToBeClassified;

//         }
//         field(13; Quantity; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(14; "Actual Value"; Decimal)
//         {

//         }
//         field(15; "Calculate on Paid "; Boolean)
//         { }
//         field(16; Open; Boolean)
//         { }
//         field(17; "Monthly Exemption Amount"; Decimal)
//         { }
//         field(18; "Exemption Formula"; Text[100])
//         { }
//         field(19; "TDS Amount"; Decimal)
//         { }
//         field(20; Surcharge; Decimal)
//         { }
//         field(21; eCess; Decimal)
//         { }
//         field(22; "Exempt U/S 10"; Boolean)
//         {
//             Editable = false;
//         }
//         field(23; Taxable; Boolean)
//         {
//             Editable = true;
//         }
//         field(24; "Currency Code"; Code[20])
//         {
//             TableRelation = Currency;
//         }
//         field(25; Date; Date)
//         { }
//         field(26; "Date Filter"; Date)
//         { }
//         field(27; "Ledg. Amount"; Decimal)
//         { }
//         field(28; "Ledg. Exempt Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Employee Ledger Entry"."Exemption Amount" WHERE (EmpID=FIELD(EmpID),Pay Element=FIELD(Pay Element),"Posting Date"=FIELD(Date Filter)));
//         }
//         field(29; "From Date"; Date)
//         { }
//         field(30; "To Date"; Date)
//         { }
//         field(31; "Max. Amount"; Decimal)
//         { }
//         field(32; "Ledg. Amount(FCY)"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula=Sum("Emp. Ledger Entry"."Amount (FCY)" WHERE (EmpID=FIELD(EmpID),Pay Element=FIELD(Pay Element),Posting Date=FIELD(Date Filter)));
//             Editable = false;
//         }
//         field(33; "Bill Amount"; Decimal)
//         { }
//         field(34; "Reimbursement Balance"; Decimal)
//         {
//             FieldClass = FlowField;
//             // CalcFormula = Sum("Reimbursement Adjmt. Entry".Amount WHERE(EmpID = FIELD(EmpID), Pay Element=FIELD(Pay Element),Closed=CONST(No)));
//         }
//         field(35; "Include Previous Amount"; Decimal)
//         { }
//         field(36; "Emplopyer Contribution"; Decimal)
//         { }
//         field(37; "Pay Without Bill"; Boolean)
//         { }
//         field(38; "Emp Name"; Text[100])
//         {
//             FieldClass = FlowField;
//             // CalcFormula = lookup("Employee Master"."First Name" WHERE (EmpID=FIELD(EmpID)));

//             Editable = false;
//         }
//         field(39; "Last Date of Revision"; Date)
//         { }
//         field(40; "Revision From Date"; Date)
//         {
//             Editable = false;
//         }
//         field(41; "Revision To Date"; Date)
//         {
//             Editable = false;
//         }
//         field(42; "Arrear Amount"; Decimal)
//         { }
//         field(43; "Change After Revision"; Boolean)
//         {
//             Editable = false;
//         }
//         field(44; "Arrear Pay Element"; Boolean)
//         { }
//         field(45; "Original Calculation Order"; Integer)
//         {
//             Editable = false;
//         }
//         field(46; "Update Pay Element"; Boolean)
//         {
//             Editable = false;
//         }
//         field(47; "Updated Formula"; Text[250])
//         {
//             Editable = false;
//         }
//         field(48; "Include in Arrears"; Boolean)
//         { }
//         field(49; Structure; Decimal)
//         { }
//         field(50; "Arrear From Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(51; "Arrear To Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//     }

//     keys
//     {
//         key(Key1; EmpID, "Pay Element")
//         {
//             Clustered = true;
//         }
//         key(key2; EmpID, "Calculation Order")
//         { }
//     }

//     var
//         EmpPayElement: Record 50138;
//         PayElement: Record 50139;
//         Emp1: Record 50136;
//         ExAmt1: Decimal;
//         ExAmt2: Decimal;
//         ExAmt3: Decimal;
//         ExPer: Decimal;
//         HRSetup: Record 50137;
//         TaxSetup: Record 60035;
//         Text000: TextConst ENU = 'You don''t need to select Professional Tax, Gratuity, Leave Encash. type pay element.';
//         Text001: textconst ENU = 'You can not define PF/CMPF/ESI type Element for Retainer and Consultant.';

//     trigger OnInsert()
//     begin

//     end;

//     trigger OnModify()
//     begin

//     end;

//     trigger OnDelete()
//     begin

//     end;

//     trigger OnRename()
//     begin

//     end;

// }