program DebugTest;

{$APPTYPE GUI}

uses
  Forms,
  ComApp,
  TestForm in 'TestForm.pas' {Form1},
  TestDm in 'TestDm.pas' {WebModule2: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule2, WebModule2);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
