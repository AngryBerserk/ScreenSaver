program ScreenSaver;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

begin
 If (ParamCount>=1) and (ParamStr(1)='/s') Then
  Begin
   Application.Initialize;
   Application.CreateForm(TForm1, Form1);
  Application.Run
  End Else If ParamStr(1)<>'/p' Then
  Begin
   Application.Initialize;
   Application.CreateForm(TForm1, Form1);
   Application.Run
  End
end.
