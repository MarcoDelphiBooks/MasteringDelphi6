unit MdModule;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, MidItems, Db, DBClient,
  MConnect, CompProd, PagItems, MidProd, XMLBrokr, WebComp, HTTPProd;

type
  TWebModule1 = class(TWebModule)
    XMLBroker1: TXMLBroker;
    InetXPageProducer1: TInetXPageProducer;
    DCOMConnection1: TDCOMConnection;
    DataForm1: TDataForm;
    LayoutGroup1: TLayoutGroup;
    DataGrid1: TDataGrid;
    TextColumn8: TTextColumn;
    TextColumn9: TTextColumn;
    TextColumn10: TTextColumn;
    TextColumn11: TTextColumn;
    TextColumn12: TTextColumn;
    TextColumn13: TTextColumn;
    TextColumn14: TTextColumn;
    DataNavigator2: TDataNavigator;
    FirstButton2: TFirstButton;
    PriorPageButton1: TPriorPageButton;
    PriorButton2: TPriorButton;
    NextButton2: TNextButton;
    NextPageButton1: TNextPageButton;
    LastButton2: TLastButton;
    FieldGroup1: TFieldGroup;
    FieldText11: TFieldText;
    FieldText12: TFieldText;
    FieldText13: TFieldText;
    FieldText14: TFieldText;
    FieldText15: TFieldText;
    FieldStatus1: TFieldStatus;
    FieldText16: TFieldText;
    FieldText17: TFieldText;
    FieldText18: TFieldText;
    FieldText19: TFieldText;
    FieldText20: TFieldText;
    DataNavigator1: TDataNavigator;
    FirstButton1: TFirstButton;
    PriorButton1: TPriorButton;
    NextButton1: TNextButton;
    LastButton1: TLastButton;
    UndoButton1: TUndoButton;
    ApplyUpdatesButton1: TApplyUpdatesButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.DFM}

end.
