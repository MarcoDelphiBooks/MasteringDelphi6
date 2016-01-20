unit LookupForm;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, ExtCtrls, DBLookup,
  Grids, Mask;

type
  TFormLookup = class(TForm)
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditOrderNo: TDBEdit;
    Label3: TLabel;
    EditSaleDate: TDBEdit;
    Label4: TLabel;
    EditShipToContact: TDBEdit;
    Label5: TLabel;
    EditShipToAddr: TDBEdit;
    Label6: TLabel;
    EditShipToAddr2: TDBEdit;
    Label7: TLabel;
    EditShipToCity: TDBEdit;
    Label8: TLabel;
    EditShipToState: TDBEdit;
    Label9: TLabel;
    EditShipToZip: TDBEdit;
    Label10: TLabel;
    EditShipToCountry: TDBEdit;
    Label11: TLabel;
    EditPaymentMethod: TDBEdit;
    Label12: TLabel;
    EditItemsTotal: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    DataSourceOrders: TDataSource;
    Panel2: TPanel;
    QueryOrders: TQuery;
    Label13: TLabel;
    DataSourceCustomer: TDataSource;
    TableCustomers: TTable;
    DBLookupComboBox1: TDBLookupComboBox;
    DBText1: TDBText;
    Label2: TLabel;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormLookup: TFormLookup;

implementation

{$R *.DFM}

end.
