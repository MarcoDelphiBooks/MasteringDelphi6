object customers: Tcustomers
  OldCreateOrder = False
  PageProducer = XSLPageProducer
  AppServices = WebAppComponents
  Left = 254
  Top = 107
  Height = 296
  Width = 233
  object XSLPageProducer: TXSLPageProducer
    Active = True
    XMLData = XMLBroker1
    Left = 48
    Top = 8
    DOMVendorDesc = 'MSXML'
  end
  object WebAppComponents: TWebAppComponents
    PageDispatcher = PageDispatcher
    AdapterDispatcher = AdapterDispatcher
    ApplicationAdapter = ApplicationAdapter
    Left = 48
    Top = 56
  end
  object ApplicationAdapter: TApplicationAdapter
    Left = 48
    Top = 104
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object PageDispatcher: TPageDispatcher
    Left = 48
    Top = 152
  end
  object AdapterDispatcher: TAdapterDispatcher
    Left = 48
    Top = 200
  end
  object XMLBroker1: TXMLBroker
    Params = <>
    ProviderName = 'DataSetProvider1'
    WebDispatch.PathInfo = 'XMLBroker1'
    Left = 144
    Top = 40
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'customer.db'
    Left = 144
    Top = 160
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Table1
    Constraints = True
    Left = 152
    Top = 104
  end
end
