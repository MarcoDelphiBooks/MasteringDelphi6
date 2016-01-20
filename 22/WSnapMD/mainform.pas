unit mainform;

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
  CLASS_ComWebApp: TGUID = '{F765A7C3-A7F9-4783-9AAB-5093BB22A168}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'WSnapMD', 'WSnapMD Object');

end.
