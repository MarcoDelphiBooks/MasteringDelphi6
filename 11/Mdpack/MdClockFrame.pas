unit MdClockFrame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TMdFramedClock = class(TFrame)
    Label1: TLabel;
    Timer1: TTimer;
    Bevel1: TBevel;
    procedure Timer1Timer(Sender: TObject);
  public
    constructor Create(AOnwer: TComponent); override;
  published
    property SubLabel: TLabel read Label1;
    property SubTimer: TTimer read Timer1;
  end;

procedure Register;

implementation

{$R *.DFM}

constructor TMdFramedClock.Create(AOnwer: TComponent);
begin
  inherited;
  Timer1.SetSubComponent (true);
  Label1.SetSubComponent (true);
end;

procedure TMdFramedClock.Timer1Timer(Sender: TObject);
begin
  Label1.Caption := TimeToStr (Time);
end;

procedure Register;
begin
  RegisterComponents ('Md', [TMdFramedClock]);
end;

end.
