program Dates1;

uses
  Forms,
  Dates1Form in 'Dates1Form.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
