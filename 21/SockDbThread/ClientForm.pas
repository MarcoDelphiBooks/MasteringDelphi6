unit ClientForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Db, Mask, DBTables, ScktComp;

type
  TForm1 = class(TForm)
    EditServer: TEdit;
    Server: TLabel;
    Table1: TTable;
    Table1Company: TStringField;
    Table1CompID: TFloatField;
    Table1Address: TStringField;
    Table1State: TStringField;
    Table1Country: TStringField;
    Table1Email: TStringField;
    Table1Contact: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    lbLog: TListBox;
    BtnDelete: TButton;
    Label8: TLabel;
    Bevel1: TBevel;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure OnLog(Sender: TObject; LogMsg: String);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  ClientThread;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // use a table in the current directory
  Table1.DatabaseName :=
    ExtractFilePath (Application.ExeName);
  // create it if it doesn't exist
  if not Table1.Exists then
    Table1.CreateTable;
  Table1.Active := True;

end;

procedure TForm1.BtnDeleteClick(Sender: TObject);
begin
  table1.First;
  while not Table1.Eof do
  begin
    // if the record is still logged
    if not Table1CompID.IsNull and (Table1CompId.AsInteger <> 0) then
      Table1.Delete;
    Table1.Next;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  SendThread: TSendThread;
begin
  SendThread := TSendThread.Create(Table1);
  SendThread.OnLog := OnLog;
  SendThread.ServerAddress := EditServer.Text;
  SendThread.Resume;
end;

procedure TForm1.OnLog(Sender: TObject; LogMsg: String);
begin
  lbLog.Items.Add(LogMsg);
end;

end.
