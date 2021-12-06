// codeunit 50101 TestFunction
// {
//     trigger OnRun()
//     begin
//         //     No := DecStr(55);
//         //     Message('%1', Number);
//         //     // No := DecStr(str51stfgfhj55);
//         //     // Message('%1', Number);
//         //     // No := DecStr(ster550);
//         //     // Message('%1', Number);
//         // end;

//         // procedure DecStr(No: Integer): Integer
//         // begin
//         //     If No > 0 then begin
//         //         Number := No - 1


//         //     end;
//         // end;


//         DocNo := DecStr(‘AB-00010’);
//         MESSAGE(DocNo);

//     procedure DecStr(DocNo: Code[20]): Code[20]
// // loc. variables


// Prefix := Regex.Replace(DocNo,’\d+’,”);
// NoString := Regex.Match(DocNo,’\d+’).Value;
// Number := DotNetInt.Parse(NoString);
// IF Number > 0 THEN BEGIN
// Number := Number – 1;
// PadLength := STRLEN(DocNo) – STRLEN(Prefix) – STRLEN(FORMAT(Number));
// EXIT(Prefix + PADSTR(”,PadLength,’0′) + FORMAT(Number));
// END;



//     var
//         DocNo: Code[20]
//         // No: Integer;
//         // Number: Integer;
//         Prefix: Text
//     NoString: Text
//     Number: Integer
//     Regex: DotNet //System.Text.RegularExpressions.Regex.’System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089′
//     DotNetInt: DotNet //System.Int32.’mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089′
//     PadLength: Integer
//     }