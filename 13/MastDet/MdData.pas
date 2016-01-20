unit MdData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDataModule1 = class(TDataModule)
    TableCust: TTable;
    TableOrd: TTable;
    dsCust: TDataSource;
    dsOrd: TDataSource;
    procedure DataModule1Create(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.DFM}

procedure TDataModule1.DataModule1Create(Sender: TObject);
begin
  TableCust.Open;
  TableOrd.Open;
end;

end.
