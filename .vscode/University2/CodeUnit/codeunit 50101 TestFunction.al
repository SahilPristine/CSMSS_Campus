codeunit 50101 TestFunction
{
    trigger OnRun()
    begin
        No := DecStr(55);
        Message('%1', Number);
    end;

    procedure DecStr(No: Integer): Integer
    begin
        If No > 0 then begin
            Number := No - 1

        end;
    end;

    var
        No: Integer;
        Number: Integer;
}