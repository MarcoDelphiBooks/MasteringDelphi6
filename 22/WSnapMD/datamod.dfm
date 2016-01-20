object WDataMod: TWDataMod
  OldCreateOrder = False
  Left = 631
  Top = 320
  Height = 354
  Width = 356
  object ibConnection: TSQLConnection
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
    Left = 40
    Top = 24
  end
  object dsDepartment: TDataSource
    DataSet = cdsDepartment
    Left = 128
    Top = 72
  end
  object cdsDepartment: TSQLClientDataSet
    Active = True
    CommandText = 
      'select DEPARTMENT, DEPT_NO, HEAD_DEPT, LOCATION, BUDGET from DEP' +
      'ARTMENT'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    DBConnection = ibConnection
    Left = 48
    Top = 88
  end
  object cdsEmployee: TSQLClientDataSet
    Active = True
    CommandText = 
      'select EMP_NO, FIRST_NAME, LAST_NAME, DEPT_NO, JOB_CODE, JOB_COU' +
      'NTRY, SALARY from EMPLOYEE'
    Aggregates = <>
    IndexFieldNames = 'DEPT_NO'
    MasterFields = 'DEPT_NO'
    MasterSource = dsDepartment
    Options = [poAllowCommandText]
    ObjectView = True
    PacketRecords = 0
    Params = <
      item
        DataType = ftString
        Name = 'DEPT_NO'
        ParamType = ptInput
        Value = '000'
      end>
    DBConnection = ibConnection
    Left = 48
    Top = 144
  end
  object dsaDepartment: TDataSetAdapter
    DataSet = cdsDepartment
    Left = 216
    Top = 32
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
      object AdaptDEPARTMENT: TDataSetAdapterField
        DataSetField = 'DEPARTMENT'
      end
      object AdaptDEPT_NO2: TDataSetAdapterField
        DataSetField = 'DEPT_NO'
      end
      object AdaptHEAD_DEPT: TDataSetAdapterField
        DataSetField = 'HEAD_DEPT'
      end
      object AdaptLOCATION: TDataSetAdapterField
        DataSetField = 'LOCATION'
      end
      object AdaptBUDGET: TDataSetAdapterField
        DataSetField = 'BUDGET'
      end
    end
  end
  object dsaEmployee: TDataSetAdapter
    DataSet = cdsEmployee
    MasterAdapter = dsaDepartment
    Left = 216
    Top = 96
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
      object AdaptEMP_NO: TDataSetAdapterField
        DataSetField = 'EMP_NO'
      end
      object AdaptFIRST_NAME: TDataSetAdapterField
        DataSetField = 'FIRST_NAME'
      end
      object AdaptLAST_NAME: TDataSetAdapterField
        DataSetField = 'LAST_NAME'
      end
      object AdaptDEPT_NO: TDataSetAdapterField
        DataSetField = 'DEPT_NO'
      end
      object AdaptJOB_CODE: TDataSetAdapterField
        DataSetField = 'JOB_CODE'
      end
      object AdaptJOB_COUNTRY: TDataSetAdapterField
        DataSetField = 'JOB_COUNTRY'
      end
      object AdaptSALARY: TDataSetAdapterField
        DataSetField = 'SALARY'
      end
    end
  end
end
