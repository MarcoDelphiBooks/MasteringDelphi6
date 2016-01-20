unit BabelForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Rio, SoapHTTPClient;

type
  TForm1 = class(TForm)
    HTTPRIO1: THTTPRIO;
    Button1: TButton;
    EditSource: TEdit;
    EditTarget: TEdit;
    ComboBoxType: TComboBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Babelintf;

procedure TForm1.Button1Click(Sender: TObject);
begin
  EditTarget.Text := (HTTPRIO1 as BabelFishPortType).
    BabelFish(ComboBoxType.Text, EditSource.Text);
end;

end.
