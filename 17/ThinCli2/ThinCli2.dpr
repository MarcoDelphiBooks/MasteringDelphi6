program ThinCli2;

uses
  Forms,
  ThinForm in 'ThinForm.pas' {Form1},
  DeltForm in 'DeltForm.pas' {FormDelta},
  Reconc in 'Reconc.pas' {ReconcileErrorForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormDelta, FormDelta);
  Application.Run;
end.
