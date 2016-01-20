object WebDataModule1: TWebDataModule1
  OldCreateOrder = False
  Left = 500
  Top = 109
  Height = 283
  Width = 235
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterPost = ClientDataSet1AfterPost
    AfterDelete = ClientDataSet1AfterDelete
    Left = 64
    Top = 32
  end
  object SQLConnection1: TSQLConnection
    Connected = True
    ConnectionName = 'IBLocal'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'CommitRetain=False'
      
        'Database=c:\program files\interbase corp\interbase6\examples\dat' +
        'abase\employee.gdb'
      'DriverName=Interbase'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet=ASCII'
      'SQLDialect=1'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True')
    VendorLib = 'GDS32.DLL'
    Left = 64
    Top = 168
  end
  object SQLDataSet1: TSQLDataSet
    SQLConnection = SQLConnection1
    CommandText = 
      'select CUST_NO, CUSTOMER, ADDRESS_LINE1, CITY, STATE_PROVINCE, C' +
      'OUNTRY from CUSTOMER'
    Params = <>
    Left = 64
    Top = 120
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Constraints = True
    Left = 64
    Top = 80
  end
end
