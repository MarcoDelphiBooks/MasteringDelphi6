unit SoapServerIntf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, SoapConn, Grids, DBGrids, StdCtrls,
  Rio, SoapHTTPClient, Midas, InvokeRegistry;

type
  ISoapTestDm = interface(IAppServer)
    ['{1F109687-6D8B-4F85-9BF5-EFFC87A9F10F}']
    function GetRecordCount: Integer;
  end;

implementation

initialization
  InvRegistry.RegisterInterface(TypeInfo(ISoapTestDm));

end.

