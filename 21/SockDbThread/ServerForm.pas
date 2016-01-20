unit ServerForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ScktComp, StdCtrls, Grids, DBGrids, Db, DBTables, ComCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    lbClients: TListBox;
    lbLog: TListBox;
    ServerSocket1: TServerSocket;
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Table1Company: TStringField;
    Table1CompID: TFloatField;
    Table1Address: TStringField;
    Table1State: TStringField;
    Table1Country: TStringField;
    Table1Email: TStringField;
    Table1Contact: TStringField;
    Table1LoggedBy: TStringField;
    Table1LoggetOn: TDateField;
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure ServerSocket1GetThread(Sender: TObject;
      ClientSocket: TServerClientWinSocket;
      var SocketThread: TServerClientThread);
    procedure ServerSocket1Accept(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  end;

var
  Form1: TForm1;

implementation

type
  TDbServerThread = class(TServerClientThread)
  private
    strCommand: string;
    strFeedback: string;
  public
    procedure ClientExecute; override;
    procedure Log;
    procedure LogFeedback;
    procedure AddRecord;
  end;

var
  ID: Integer;

{$R *.DFM}

procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  lbLog.Items.Add ('Connected: ' +
    Socket.RemoteHost + ' (' + Socket.RemoteAddress + ')' );
end;

procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  lbLog.Items.Add ('Disconnected: ' +
    Socket.RemoteHost + ' (' + Socket.RemoteAddress + ')' );
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // use a table in the current directory
  Table1.DatabaseName :=
    ExtractFilePath (Application.ExeName);
  // create the table, if it doens't exist
  if not Table1.Exists then
    Table1.CreateTable;
  Table1.Active := True;
  // setup first ID
end;

{ TDbServerThread }

procedure TDbServerThread.Log;
begin
  Form1.lbLog.Items.Add ('Request: ' + strCommand);
end;

procedure TDbServerThread.LogFeedback;
begin
  Form1.lbLog.Items.Add ('Response: ' + strFeedback);
end;

procedure TDbServerThread.AddRecord;
var
  Data: TStringList;
  I: Integer;
begin
  Data := TStringList.Create;
  try
    Data.Text := strCommand;
    // new record
    Form1.Table1.Insert;
    // set the fields using the strings
    for I := 0 to Form1.Table1.FieldCount - 1 do
      Form1.Table1.Fields [I].AsString :=
        Data.Values [Form1.Table1.Fields[I].FieldName];
    // complete with random ID, sender, and date

    Form1.Table1CompID.AsInteger := ID;
    Inc(ID);
    Form1.Table1LoggedBy.AsString := ClientSocket.RemoteAddress;
    Form1.Table1LoggetOn.AsDateTime := Date;
    Form1.Table1.Post;
    // get the value to return
    strFeedback := Form1.Table1CompID.AsString;
  finally
    Data.Free;
  end;
end;

procedure TDbServerThread.ClientExecute;
var
  Stream: TWinSocketStream;
  Buffer, strIn: string;
  nRead: Integer;
begin
  // keep going
  Stream := TWinSocketStream.Create(ClientSocket, 5000);
  try
    while not Terminated and ClientSocket.Connected do
    begin
      // initialize (thread might be reused)
      Buffer := '';
      strIn := '';
      SetLength(Buffer, 64);
      repeat
        nRead := Stream.Read(Buffer[1], 64);
        if nRead = 0 then
        begin
          ClientSocket.Close;
          Break;
        end;
        SetLength (Buffer, nRead);
        StrIn := StrIn + Buffer;
      until (Pos(#10#13'.'#10#13, Buffer) > 0);

      if strIn = '' then
        Continue // keep going
      else
      begin
        // handle the request, if anything arrived
        StrCommand := Copy (strIn, 1, Pos (#10#13'.'#10#13, strIn) -1);
        Synchronize(Log);
        Synchronize(AddRecord);
        // send results back
        Synchronize(LogFeedback);
        Stream.Write(strFeedback[1], Length (strFeedback));
      end;
    end;
  finally
    Stream.Free;
  end;
end;

procedure TForm1.ServerSocket1GetThread(Sender: TObject;
  ClientSocket: TServerClientWinSocket;
  var SocketThread: TServerClientThread);
begin
  lbLog.Items.Add ('GetThread: ' +
    ClientSocket.RemoteHost + ' (' + ClientSocket.RemoteAddress + ')' );
  SocketThread := TDbServerThread.Create(False, ClientSocket);
end;

procedure TForm1.ServerSocket1Accept(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  lbLog.Items.Add ('Accepted: ' +
    Socket.RemoteHost + ' (' + Socket.RemoteAddress + ')' );
end;


initialization
  // Setup first ID for this session
  ID := GetTickCount;

end.
