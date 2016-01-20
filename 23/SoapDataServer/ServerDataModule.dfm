object SoapTestDm: TSoapTestDm
  OldCreateOrder = True
  Left = 193
  Top = 452
  Height = 159
  Width = 269
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Constraints = True
    Left = 80
    Top = 24
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
    Left = 152
    Top = 24
  end
  object SQLDataSet1: TSQLDataSet
    SQLConnection = SQLConnection1
    CommandText = 'select * from EMPLOYEE'
    Params = <>
    Left = 80
    Top = 72
  end
  object SQLDataSet2: TSQLDataSet
    SQLConnection = SQLConnection1
    CommandText = 'select count(*) from EMPLOYEE'
    Params = <>
    Left = 152
    Top = 72
  end
end
