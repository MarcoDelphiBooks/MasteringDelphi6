unit TestDm;

interface

uses
  SysUtils, Classes, HTTPApp;

type
  TWebModule2 = class(TWebModule)
    procedure WebModule2WebActionItem1Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule2: TWebModule2;

implementation

uses WebReq;

{$R *.DFM}

procedure TWebModule2.WebModule2WebActionItem1Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := '<h1>Hello</h1>';
end;

initialization
  WebRequestHandler.WebModuleClass := TWebModule2;

end.
