unit ConvertWebMod;

interface

uses
  SysUtils, Classes, HTTPApp, WSDLPub, SOAPPasInv, SOAPHTTPPasInv,
  SoapHTTPDisp, WebBrokerSOAP;

type
  TWebModule1 = class(TWebModule)
    HTTPSoapDispatcher1: THTTPSoapDispatcher;
    HTTPSoapPascalInvoker1: THTTPSoapPascalInvoker;
    WSDLHTMLPublish1: TWSDLHTMLPublish;
    procedure WebModule1WebActionItem1Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.DFM}

uses
  InvokeRegistry, ConvertIntf;

procedure TWebModule1.WebModule1WebActionItem1Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<h3>GetMethExternalName - ToEuro</h3><p>' +
    InvRegistry.GetMethExternalName(TypeInfo(IConvert), 'ToEuro') +

    '<h3>GetInterfaceExternalName - IConvert</h3><p>' +
    InvRegistry.GetInterfaceExternalName(TypeInfo(IConvert)) +

    '<h3>GetNamespaceByGUID - IConvert</h3><p>' +
    InvRegistry.GetNamespaceByGUID (IConvert);
end;

end.
