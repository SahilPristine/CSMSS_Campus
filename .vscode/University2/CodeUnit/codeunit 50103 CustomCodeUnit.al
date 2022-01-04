// codeunit 50103 CustomCodeUnit
// {

//     [EventSubscriber(ObjectType::table, 18, 'OnAssistEditOnBeforeExit', '', true, true)]

//     local procedure OnAssistEditOnBeforeExit(Customer: Record Customer)
//     var
//         Cust: Record Customer;
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//         SalesSetup: Record "Sales & Receivables Setup";
//     begin
//         if NoSeriesMgt.SelectSeries(SalesSetup.RegisterationNo, Customer."No. Series", ) then begin
//             NoSeriesMgt.SetSeries("No.");
//             Rec := Cust;
//         end;
//     end;




//     trigger OnRun()
//     begin

//     end;

//     var
//         myInt: Integer;
// }