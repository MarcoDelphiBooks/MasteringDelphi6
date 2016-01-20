unit CheckF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, ComCtrls;

type
  TDbaForm = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    Table1LastName: TStringField;
    Table1FirstName: TStringField;
    Table1Department: TSmallintField;
    Table1Branch: TStringField;
    Table1Senior: TBooleanField;
    Table1HireDate: TDateField;
    DBGrid1: TDBGrid;
    DBCheckBox1: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  end;

var
  DbaForm: TDbaForm;

implementation

{$R *.DFM}

procedure TDbaForm.FormCreate(Sender: TObject);
begin
  if not Table1.Exists then
  begin
    Table1.CreateTable;
    ShowMessage ('You can add data to this table'#13 +
      'by using the DbAware example of Chapter 9');
  end;
  Table1.Open;
end;

procedure TDbaForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (gdFocused in State) and
    (Column.Field = Table1Senior) then
  begin
    DBCheckBox1.SetBounds (
      Rect.Left + DBGrid1.Left + 1,
      Rect.Top + DBGrid1.Top + 1,
      Rect.Right - Rect.Left + 1,
      Rect.Bottom - Rect.Top + 1);
  end;
end;

procedure TDbaForm.DBGrid1ColEnter(Sender: TObject);
begin
  if DBGrid1.Columns [DBGrid1.SelectedIndex].
      Field = Table1Senior then
    DBCheckBox1.Visible := True
  else
    DBCheckBox1.Visible := False;
end;

procedure TDbaForm.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if DBCheckBox1.Visible and (Ord (Key) > 31) then
  begin
    Key := #0;
    Table1.Edit;
    DBCheckBox1.Checked := not
      DBCheckBox1.Checked;
    DBCheckBox1.Field.AsBoolean :=
      DBCheckBox1.Checked;
  end;
end;

end.
