library ToDoShll;

uses
  ComServ,
  ToDoMenu in 'ToDoMenu.pas',
  ToDoShll_TLB in 'ToDoShll_TLB.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
