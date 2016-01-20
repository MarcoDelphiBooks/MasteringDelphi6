unit ClientThread;

interface

uses
  Classes, ScktComp, DBTables;

type
  TLogEvent = procedure(Sender: TObject; LogMsg: String) of object;

  TSendThread = class(TThread)
  private
    ClientSocket: TClientSocket;
    FTable: TTable;
    FOnLog: TLogEvent;
    FLogMsg: String;
    FServerAddress: string;
    procedure SetOnLog(const Value: TLogEvent);
    procedure SetServerAddress(const Value: string);
  protected
    procedure Execute; override;
    procedure DoLog;
  public
    constructor Create(ATable: TTable);
    property OnLog: TLogEvent read FOnLog write SetOnLog;
    property ServerAddress: string read FServerAddress write SetServerAddress;
  end;

implementation

uses
  ClientForm;

constructor TSendThread.Create(ATable: TTable);
begin
  FTable := ATable;
  inherited Create(True);
  FreeOnTerminate := True;
end;

procedure TSendThread.DoLog;
begin
  if Assigned(FOnLog) then
    FOnLog(self, FLogMsg);
end;

procedure TSendThread.Execute;
var
  I: Integer;
  Data: TStringList;
  Stream: TWinSocketStream;
  Buf: String;
begin
  try
    Data := TStringList.Create;
    ClientSocket := TClientSocket.Create (nil);
    Stream := nil;
    try
      ClientSocket.Address := ServerAddress;
      ClientSocket.ClientType := ctBlocking;
      ClientSocket.Port := 51;
      ClientSocket.Active := True;
      Stream := TWinSocketStream.Create(ClientSocket.Socket, 30000);

      FTable.First;
      while not FTable.Eof do
      begin
        // if the record is still not logged
        if FTable.FieldByName('CompID').IsNull or (FTable.FieldByName('CompID').AsInteger = 0) then
        begin
          FLogMsg := 'Sending ' + FTable.FieldByName('Company').AsString;
          Synchronize(DoLog);
          Data.Clear;
          // create strings with structure "FieldName=Value"
          for I := 0 to FTable.FieldCount - 1 do
            Data.Values [FTable.Fields[I].FieldName] :=
              FTable.Fields [I].AsString;
          // send the record
          Buf := Data.Text + #10#13'.'#10#13;
          ClientSocket.Socket.SendText(Buf);
          // wait for reponse
          if Stream.WaitForData(30000) then
          begin
            FTable.Edit;
            SetLength(Buf, 256);
            SetLength(Buf, Stream.Read(Buf[1], Length(Buf)));

            FTable.FieldByName('CompID').AsString := Buf;
            FTable.Post;
            FLogMsg := FTable.FieldByName('Company').AsString +
              ' logged as ' + FTable.FieldByName('CompID').AsString;
          end
          else
            FlogMsg := 'No response for ' + FTable.FieldByName('Company').AsString;
          Synchronize(DoLog);
        end;
        FTable.Next;
      end;
    finally
      ClientSocket.Active := False;
      ClientSocket.Free;
      Stream.Free;
      Data.Free;
    end;
  except
    // trap exceptions
  end;
end;

procedure TSendThread.SetOnLog(const Value: TLogEvent);
begin
  FOnLog := Value;
end;

procedure TSendThread.SetServerAddress(const Value: string);
begin
  FServerAddress := Value;
end;

end.
