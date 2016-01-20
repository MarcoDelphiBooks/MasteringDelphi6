
unit datamod;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, DBXpress, FMTBcd,
  DB, SqlExpr, Provider, DBClient, DBLocal, DBLocalS, WebAdapt, DBAdapt,
  WebComp;

type
  TWDataMod = class(TWebDataModule)
    ibConnection: TSQLConnection;
    dsDepartment: TDataSource;
    cdsDepartment: TSQLClientDataSet;
    cdsEmployee: TSQLClientDataSet;
    dsaDepartment: TDataSetAdapter;
    AdaptDEPARTMENT: TDataSetAdapterField;
    AdaptDEPT_NO2: TDataSetAdapterField;
    AdaptHEAD_DEPT: TDataSetAdapterField;
    AdaptLOCATION: TDataSetAdapterField;
    AdaptBUDGET: TDataSetAdapterField;
    dsaEmployee: TDataSetAdapter;
    AdaptEMP_NO: TDataSetAdapterField;
    AdaptFIRST_NAME: TDataSetAdapterField;
    AdaptLAST_NAME: TDataSetAdapterField;
    AdaptDEPT_NO: TDataSetAdapterField;
    AdaptJOB_CODE: TDataSetAdapterField;
    AdaptJOB_COUNTRY: TDataSetAdapterField;
    AdaptSALARY: TDataSetAdapterField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function WDataMod: TWDataMod;

implementation

{$R *.dfm} 

uses WebReq, WebCntxt, WebFact, Variants;

function WDataMod: TWDataMod;
begin
  Result := TWDataMod(WebContext.FindModuleClass(TWDataMod));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebDataModuleFactory.Create(TWDataMod, crAlways, caCache));

end.
