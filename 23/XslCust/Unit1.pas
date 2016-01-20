
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, xmldom,
  XMLIntf, Provider, DB, DBTables, XMLBrokr, msxmldom, XMLDoc, XSLProd;

type
  TXSLPageProducerPage1 = class(TWebPageModule)
    XSLPageProducer: TXSLPageProducer;
    XMLBroker1: TXMLBroker;
    Table1: TTable;
    DataSetProvider1: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function XSLPageProducerPage1: TXSLPageProducerPage1;

implementation

{$R *.dfm}  {*.xsl}

uses WebReq, WebCntxt, WebFact, Variants;

function XSLPageProducerPage1: TXSLPageProducerPage1;
begin
  Result := TXSLPageProducerPage1(WebContext.FindModuleClass(TXSLPageProducerPage1));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TXSLPageProducerPage1, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.xsl'), crOnDemand, caCache));

end.
