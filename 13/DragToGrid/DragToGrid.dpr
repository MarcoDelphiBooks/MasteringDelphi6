program dragtogrid;

uses
  Forms,
  DragToGridForm in 'DragToGridForm.pas' {FormDrag};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormDrag, FormDrag);
  Application.Run;
end.
