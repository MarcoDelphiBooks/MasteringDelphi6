unit OrderF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, DBTables, ExtCtrls, DBLookup,
  Grids, Mask;

type
  TOrdersForm = class(TForm)
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
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    dsOrders: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    QueryOrders: TQuery;
    QueryItems: TQuery;
    dsItems: TDataSource;
    Label2: TLabel;
    DBEdit1: TDBEdit;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  OrdersForm: TOrdersForm;

implementation

{$R *.DFM}

end.
