program BabelFish;

uses
  Forms,
  BabelForm in 'BabelForm.pas' {Form1},
  BabelIntf in 'BabelIntf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
