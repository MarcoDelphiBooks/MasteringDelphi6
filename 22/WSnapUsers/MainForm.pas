unit MainForm;

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
  CLASS_ComWebApp: TGUID = '{069C0526-AAB6-4567-978A-210B961F9139}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'WSnapUsers', 'WSnapUsers Object');

end.
