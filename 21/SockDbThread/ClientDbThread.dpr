program ClientDbThread;

uses
  Forms,
  ClientForm in 'ClientForm.pas' {Form1},
  ClientThread in 'ClientThread.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
