library XFUser;

uses
  ComServ,
  XFUser_TLB in 'XFUser_TLB.pas',
  XUserF in 'XUserF.pas' {XFormUser: TActiveForm} {XFormUser: CoClass};

{$E ocx}

{$WARN SYMBOL_PLATFORM OFF} 

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
