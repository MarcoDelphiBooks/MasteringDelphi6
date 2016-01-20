program DbCross;

uses
  Forms,
  DbCrossF in 'DbCrossF.pas' {DbCrossForm},
  HtmlData in 'HtmlData.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDbCrossForm, DbCrossForm);
  Application.Run;
end.
