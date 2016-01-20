unit AnimF;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Anim;

type
  TFormAnimals = class(TForm)
    LabelKind: TLabel;
    BtnKind: TButton;
    RadioAnimal: TRadioButton;
    RadioDog: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnKindClick(Sender: TObject);
    procedure RadioAnimalClick(Sender: TObject);
    procedure RadioDogClick(Sender: TObject);
  private
    MyAnimal: TAnimal;
  end;

var
  FormAnimals: TFormAnimals;

implementation

{$R *.DFM}

procedure TFormAnimals.FormCreate(Sender: TObject);
begin
  MyAnimal := TAnimal.Create;
end;

procedure TFormAnimals.FormDestroy(Sender: TObject);
begin
  MyAnimal.Free;
end;

procedure TFormAnimals.BtnKindClick(Sender: TObject);
begin
  LabelKind.Caption := MyAnimal.GetKind;
end;

procedure TFormAnimals.RadioAnimalClick(Sender: TObject);
begin
  MyAnimal.Free;
  MyAnimal := TAnimal.Create;
end;

procedure TFormAnimals.RadioDogClick(Sender: TObject);
begin
  MyAnimal.Free;
  MyAnimal := TDog.Create;
end;

end.

