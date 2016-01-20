unit NonAwF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, StdCtrls, Grids, DBGrids, ComCtrls, DBActns, ActnList,
  Mask, DBCtrls;

type
  TForm1 = class(TForm)
    Table1: TTable;
    EditName: TEdit;
    Table1Name: TStringField;
    Table1Capital: TStringField;
    Table1Continent: TStringField;
    Table1Area: TFloatField;
    Table1Population: TFloatField;
    EditCapital: TEdit;
    EditPopulation: TEdit;
    EditArea: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboContinent: TComboBox;
    Button1: TButton;
    Button2: TButton;
    StatusBar1: TStatusBar;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ActionList1: TActionList;
    DBEdit1: TDBEdit;
    ActionNext: TAction;
    ActionPrior: TAction;
    ActionInsert: TAction;
    ActionPost: TAction;
    ActionCancel: TAction;
    DataSource1: TDataSource;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure ComboContinentDropDown(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure EditNameExit(Sender: TObject);
    procedure EditCapitalExit(Sender: TObject);
    procedure ComboContinentExit(Sender: TObject);
    procedure EditPopulationExit(Sender: TObject);
    procedure EditAreaExit(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionPriorExecute(Sender: TObject);
    procedure ActionInsertExecute(Sender: TObject);
    procedure ActionPostExecute(Sender: TObject);
    procedure ActionNextExecute(Sender: TObject);
    procedure ActionNextUpdate(Sender: TObject);
    procedure ActionPriorUpdate(Sender: TObject);
    procedure ActionInsertUpdate(Sender: TObject);
    procedure ActionPostUpdate(Sender: TObject);
    procedure ActionCancelUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  EditName.Text := Table1Name.AsString;
  EditCapital.Text := Table1Capital.AsString;
  ComboContinent.Text := Table1Continent.AsString;
  EditArea.Text := Table1Area.AsString;
  EditPopulation.Text := Table1Population.AsString;
end;

procedure TForm1.Table1BeforePost(DataSet: TDataSet);
begin
  if Table1Area.Value < 100 then
    raise Exception.Create ('Area too small');
end;

procedure TForm1.Table1AfterInsert(DataSet: TDataSet);
begin
  Table1Continent.Value := 'Asia'; 
end;

procedure TForm1.EditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Table1.State in [dsEdit, dsInsert]) then
    Table1.Edit;
end;

procedure TForm1.ComboContinentDropDown(Sender: TObject);
begin
  if not (Table1.State in [dsEdit, dsInsert]) then
    Table1.Edit;
end;

procedure TForm1.DataSource1StateChange(Sender: TObject);
var
  strStatus: string;
begin
  case Table1.State of
    dsBrowse: strStatus := 'Browse';
    dsEdit: strStatus := 'Edit';
    dsInsert: strStatus := 'Insert';
  else
    strStatus := 'Other state';
  end;
  StatusBar1.SimpleText := strStatus;
end;

procedure TForm1.EditNameExit(Sender: TObject);
begin
  if Table1.State in [dsEdit, dsInsert] then
    if EditName.Text <> '' then
      Table1Name.AsString := EditName.Text
    else
    begin
      EditName.SetFocus;
      raise Exception.Create ('Undefined Country');
    end;
end;

procedure TForm1.EditCapitalExit(Sender: TObject);
begin
  if Table1.State in [dsEdit, dsInsert] then
    Table1Capital.AsString := EditCapital.Text;
end;

procedure TForm1.ComboContinentExit(Sender: TObject);
begin
  if Table1.State in [dsEdit, dsInsert] then
    Table1Continent.AsString := ComboContinent.Text;
end;

procedure TForm1.EditPopulationExit(Sender: TObject);
begin
  if Table1.State in [dsEdit, dsInsert] then
    Table1Population.AsString := EditPopulation.Text;
end;

procedure TForm1.EditAreaExit(Sender: TObject);
begin
  if Table1.State in [dsEdit, dsInsert] then
    Table1Area.AsString := EditArea.Text;
end;

procedure TForm1.ActionCancelExecute(Sender: TObject);
begin
  Table1.Cancel;
end;

procedure TForm1.ActionPriorExecute(Sender: TObject);
begin
  Table1.Prior
end;

procedure TForm1.ActionInsertExecute(Sender: TObject);
begin
  Table1.Insert;
end;

procedure TForm1.ActionPostExecute(Sender: TObject);
begin
  Table1.Post;
end;

procedure TForm1.ActionNextExecute(Sender: TObject);
begin
  Table1.Next;
end;

procedure TForm1.ActionNextUpdate(Sender: TObject);
begin
  ActionNext.Enabled := not Table1.EOF; 
end;

procedure TForm1.ActionPriorUpdate(Sender: TObject);
begin
  ActionPrior.Enabled := not Table1.BOF;
end;

procedure TForm1.ActionInsertUpdate(Sender: TObject);
begin
  ActionInsert.Enabled := Table1.State = dsBrowse;
end;

procedure TForm1.ActionPostUpdate(Sender: TObject);
begin
  ActionPost.Enabled := Table1.State in [dsEdit, dsInsert];
end;

procedure TForm1.ActionCancelUpdate(Sender: TObject);
begin
  ActionCancel.Enabled := Table1.State in [dsEdit, dsInsert];
end;

end.
