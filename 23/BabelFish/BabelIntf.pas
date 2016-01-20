unit BabelIntf;

interface

uses Types, XSBuiltIns;
type

  BabelFishPortType = interface(IInvokable)
    ['{DF96B8F8-DD8E-43A1-9276-4F821D9EA3FA}']
    function BabelFish(const translationmode: String;
      const sourcedata: String): String; stdcall;
  end;


implementation

uses InvokeRegistry;

initialization
  InvRegistry.RegisterInterface(
    TypeInfo(BabelFishPortType), '', '');

end.
