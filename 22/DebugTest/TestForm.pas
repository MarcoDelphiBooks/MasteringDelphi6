unit TestForm;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ComApp;

{$R *.DFM}

const
  CLASS_ComWebApp: TGUID = '{14831543-7FC0-4310-B037-FAF572EB322C}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'DebugTest', 'DebugTest Object');

end.
