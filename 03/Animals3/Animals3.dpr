program Animals3;

uses
  Forms,
  AnimF in 'AnimF.pas' {FormAnimals},
  Anim in 'Anim.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormAnimals, FormAnimals);
  Application.Run;
end.

