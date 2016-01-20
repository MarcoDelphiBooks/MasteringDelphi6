unit MapTblForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, xmldom, StdCtrls, Grids, DBGrids, Xmlxform,
  DBClient, Provider, XMLDoc, ComCtrls;

type
  TForm1 = class(TForm)
    Table1: TTable;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DataSetProvider2: TDataSetProvider;
    XMLTransformClient1: TXMLTransformClient;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnMap: TButton;
    Memo1: TMemo;
    procedure btnMapClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnMapClick(Sender: TObject);
begin
  Memo1.Lines.Text := FormatXmlData (XMLTransformClient1.GetDataAsXml(''));
end;

end.
