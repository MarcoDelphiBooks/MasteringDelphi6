unit SearchF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Variants,
  StdCtrls, Forms, DBCtrls, DB, Buttons, DBTables, Mask, ExtCtrls,
  Dialogs, DBActns, ActnList, ImgList, ComCtrls, ToolWin;

type
  TSearchForm = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    Table1Salary: TFloatField;
    Table1EmpNo: TIntegerField;
    Table1LastName: TStringField;
    Table1FirstName: TStringField;
    Table1PhoneExt: TStringField;
    Table1HireDate: TDateTimeField;
    ActionList1: TActionList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ImageList1: TImageList;
    DataSetFirst1: TDataSetFirst;
    DataSetLast1: TDataSetLast;
    DataSetNext1: TDataSetNext;
    DataSetPrior1: TDataSetPrior;
    EditName: TEdit;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ActionGoto: TAction;
    ActionGoNear: TAction;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditEmpNo: TDBEdit;
    EditLastName: TDBEdit;
    EditFirstName: TDBEdit;
    EditPhoneExt: TDBEdit;
    EditHireDate: TDBEdit;
    EditSalary: TDBEdit;
    ActionMulti: TAction;
    ToolButton8: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure ActionGoNearExecute(Sender: TObject);
    procedure ActionGotoExecute(Sender: TObject);
    procedure ActionGotoUpdate(Sender: TObject);
    procedure ActionGoNearUpdate(Sender: TObject);
    procedure ActionMultiExecute(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  SearchForm: TSearchForm;

implementation

{$R *.DFM}

procedure TSearchForm.FormCreate(Sender: TObject);
begin
  Table1.First;
end;

procedure TSearchForm.ActionGoNearExecute(Sender: TObject);
begin
  if not Table1.Locate ('LastName', EditName.Text, [loPartialKey]) then
    MessageDlg ('No name begins with "' + EditName.Text + '"', mtError, [mbOk], 0);
end;

procedure TSearchForm.ActionGotoExecute(Sender: TObject);
begin
  if not Table1.Locate ('LastName', EditName.Text, []) then
    MessageDlg ('"' + EditName.Text + '" not found', mtError, [mbOk], 0);
end;

procedure TSearchForm.ActionGotoUpdate(Sender: TObject);
begin
  ActionGoto.Enabled := EditName.Text <> '';
end;

procedure TSearchForm.ActionGoNearUpdate(Sender: TObject);
begin
  ActionGoNear.Enabled := EditName.Text <> '';
end;

procedure TSearchForm.ActionMultiExecute(Sender: TObject);
begin
  if not Table1.Locate ('LastName;FirstName',
      VarArrayOf (['Cook', 'Kevin']), []) then
    MessageDlg ('Not found', mtError, [mbOk], 0);
end;

end.
