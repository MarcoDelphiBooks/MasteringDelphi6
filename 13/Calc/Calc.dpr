program Calc;

uses
  Forms,
  CalcF in 'CalcF.pas' {CalcForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TCalcForm, CalcForm);
  Application.Run;
end.
