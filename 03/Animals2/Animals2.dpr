program Animals2;

uses
  Forms,
  AnimF in 'AnimF.pas' {FormAnimals},
  Anim in 'Anim.pas';

{$R *.RES}

begin
  Application.CreateForm(TFormAnimals, FormAnimals);
  Application.Run;
end.

