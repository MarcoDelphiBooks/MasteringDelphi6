unit DbxSingleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, Provider, SqlExpr, ToolWin, DBActns,
  ActnList, ComCtrls, DB, DBClient, DBLocal, DBLocalS, ImgList, StdCtrls,
  Grids, DBGrids, DBLocalB, ActnMan, ActnCtrls;

type
  TForm1 = class(TForm)
    SQLConnection1: TSQLConnection;
    SQLClientDataSet1: TSQLClientDataSet;
    SQLMonitor1: TSQLMonitor;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ActionToolBar2: TActionToolBar;
    ImageList1: TImageList;
    ActionManager1: TActionManager;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    DataSetRefresh1: TDataSetRefresh;
    DBGrid1: TDBGrid;
    Button1: TButton;
    DataSource1: TDataSource;
    MemoLog: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DoUpdate(DataSet: TDataSet);
    procedure SQLMonitor1LogTrace(Sender: TObject; CBInfo: pSQLTRACEDesc);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  MemoLog.Lines := SQLMonitor1.TraceList;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SQLMonitor1.Active := True;
  SQLClientDataSet1.Open;
end;

procedure TForm1.DoUpdate(DataSet: TDataSet);
begin
  // immediately apply local changes to the database
  SQLClientDataSet1.ApplyUpdates(0);
end;

procedure TForm1.SQLMonitor1LogTrace(Sender: TObject;
  CBInfo: pSQLTRACEDesc);
begin
  MemoLog.Lines.Add (CBInfo.pszTrace);
end;

end.
