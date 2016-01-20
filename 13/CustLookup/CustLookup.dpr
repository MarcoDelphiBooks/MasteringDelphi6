program CustLookup;

uses
  Forms,
  LookupForm in 'LookupForm.pas' {FormLookup};

{$R *.RES}

begin
  Application.CreateForm(TFormLookup, FormLookup);
  Application.Run;
end.
