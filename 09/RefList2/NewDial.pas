unit NewDial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFormItem = class(TForm)
    EditReference: TEdit;
    EditAuthor: TEdit;
    EditCountry: TEdit;
    ComboType: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    procedure Clear;
  end;

var
  FormItem: TFormItem;

implementation

{$R *.DFM}

{ TFormItem }

procedure TFormItem.Clear;
var
  I: Integer;
begin
  // clear each edit box
  for I := 0 to ControlCount - 1 do
    if Controls [I] is TEdit then
      TEdit (Controls[I]).Text := '';
end;

end.
  