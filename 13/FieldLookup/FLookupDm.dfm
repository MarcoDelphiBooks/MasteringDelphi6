object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 225
  Top = 149
  Height = 150
  Width = 215
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'orders.db'
    Left = 40
    Top = 16
    object Table1OrderNo: TFloatField
      FieldName = 'OrderNo'
      DisplayFormat = #39'#'#39'0000'
    end
    object Table1CustNo: TFloatField
      Alignment = taLeftJustify
      CustomConstraint = 'CustNo IS NOT NULL'
      ConstraintErrorMessage = 'CustNo cannot be blank'
      FieldName = 'CustNo'
      Required = True
      DisplayFormat = 'CN 0000'
      MaxValue = 9999
      MinValue = 1000
    end
    object Table1Employee: TStringField
      FieldKind = fkLookup
      FieldName = 'Employee'
      LookupDataSet = Table2
      LookupKeyFields = 'EmpNo'
      LookupResultField = 'LastName'
      KeyFields = 'EmpNo'
      Size = 30
      Lookup = True
    end
    object Table1SaleDate: TDateTimeField
      FieldName = 'SaleDate'
    end
    object Table1ShipDate: TDateTimeField
      FieldName = 'ShipDate'
    end
    object Table1EmpNo: TIntegerField
      CustomConstraint = 'Value > 0'
      ConstraintErrorMessage = 'EmpNo cannot be 0 or negative'
      FieldName = 'EmpNo'
      Required = True
      Visible = False
      DisplayFormat = 'Emp'#39'#'#39' 0000'
      MaxValue = 9999
      MinValue = 1
    end
    object Table1ShipToContact: TStringField
      FieldName = 'ShipToContact'
    end
    object Table1ShipToAddr1: TStringField
      FieldName = 'ShipToAddr1'
      Size = 30
    end
    object Table1ShipToAddr2: TStringField
      FieldName = 'ShipToAddr2'
      Size = 30
    end
    object Table1ShipToCity: TStringField
      FieldName = 'ShipToCity'
      Size = 15
    end
    object Table1ShipToState: TStringField
      FieldName = 'ShipToState'
    end
    object Table1ShipToZip: TStringField
      FieldName = 'ShipToZip'
      Size = 10
    end
    object Table1ShipToCountry: TStringField
      FieldName = 'ShipToCountry'
    end
    object Table1ShipToPhone: TStringField
      FieldName = 'ShipToPhone'
      Size = 15
    end
    object Table1ShipVIA: TStringField
      FieldName = 'ShipVIA'
      Size = 7
    end
    object Table1PO: TStringField
      FieldName = 'PO'
      Size = 15
    end
    object Table1Terms: TStringField
      FieldName = 'Terms'
      Size = 6
    end
    object Table1PaymentMethod: TStringField
      FieldName = 'PaymentMethod'
      Size = 7
    end
    object Table1ItemsTotal: TCurrencyField
      FieldName = 'ItemsTotal'
    end
    object Table1TaxRate: TFloatField
      FieldName = 'TaxRate'
      DisplayFormat = '0.00%'
      MaxValue = 100
    end
    object Table1Freight: TCurrencyField
      FieldName = 'Freight'
    end
    object Table1AmountPaid: TCurrencyField
      FieldName = 'AmountPaid'
    end
  end
  object Table2: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'employee.db'
    Left = 40
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 88
    Top = 16
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 88
    Top = 64
  end
end
