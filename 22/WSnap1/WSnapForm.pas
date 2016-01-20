unit WSnapForm;

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
  CLASS_ComWebApp: TGUID = '{3B672D3F-F633-4F70-B377-E862448F6F9B}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'WSnap1', 'WSnap1 Object');

end.
