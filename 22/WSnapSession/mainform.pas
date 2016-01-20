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
  CLASS_ComWebApp: TGUID = '{29F0C5DF-9ECA-4949-ADF5-4BA3A349A6BF}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'WSnapSession', 'WSnapSession Object');

end.
