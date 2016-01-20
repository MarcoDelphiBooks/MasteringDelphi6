program QDynaMenu;

uses
  QForms,
  MenuF in 'MenuF.pas' {FormColorText}; {FormColorText}

{$R *.res}

begin
  Application.CreateForm(TFormColorText, FormColorText);
  Application.Run;
end.

