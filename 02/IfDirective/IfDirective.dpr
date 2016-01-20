program ifdirective;

uses
  Forms,
  IfDirectiveForm in 'IfDirectiveForm.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
