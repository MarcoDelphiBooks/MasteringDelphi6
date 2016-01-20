unit StrForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    EditResemble1: TEdit;
    EditResemble2: TEdit;
    ButtonResemble: TButton;
    ListBoxMatch: TListBox;
    EditMatch: TEdit;
    ButtonMatches: TButton;
    ButtonIndex: TButton;
    EditSample: TEdit;
    ButtonTriplicate: TButton;
    ButtonReverse: TButton;
    ButtonRandom: TButton;
    procedure ButtonResembleClick(Sender: TObject);
    procedure ButtonMatchesClick(Sender: TObject);
    procedure ButtonIndexClick(Sender: TObject);
    procedure ButtonTriplicateClick(Sender: TObject);
    procedure ButtonReverseClick(Sender: TObject);
    procedure ButtonRandomClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    strArray: array of string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  StrUtils;

procedure TForm1.ButtonResembleClick(Sender: TObject);
begin
  ShowMessage (BoolToStr (AnsiResemblesText (EditResemble1.Text, EditResemble2.Text), True));
end;

procedure TForm1.ButtonMatchesClick(Sender: TObject);
begin
  ShowMessage (BoolToStr (AnsiMatchText(EditMatch.Text, strArray), True));
end;

procedure TForm1.ButtonIndexClick(Sender: TObject);
var
  nMatch: Integer;
begin
  nMatch := AnsiIndexText(EditMatch.Text, strArray);
  ShowMessage (IfThen (nMatch >= 0,
    'Matches the string number ' + IntToStr (nMatch),
    'No match'));
end;

procedure TForm1.ButtonTriplicateClick(Sender: TObject);
begin
  ShowMessage (DupeString (EditSample.Text, 3));
end;

procedure TForm1.ButtonReverseClick(Sender: TObject);
begin
  ShowMessage (ReverseString (EditSample.Text));
end;

procedure TForm1.ButtonRandomClick(Sender: TObject);
begin
  ShowMessage (RandomFrom (strArray));
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  SetLength (strArray, ListBoxMatch.Items.Count);
  for I := 0 to ListBoxMatch.Items.Count - 1 do
    strArray [I] := ListBoxMatch.Items [I];

  // set the random seed, for the RandomFrom calls
  Randomize;
end;

end.
