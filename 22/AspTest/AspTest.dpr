library AspTest;

uses
  ComServ,
  AspObj1 in 'AspObj1.pas',
  TestDm in 'TestDm.pas' {DataModule1: TDataModule};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.RES}

{$R *.TLB}

begin
end.
