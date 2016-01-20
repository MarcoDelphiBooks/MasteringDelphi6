object XSLPageProducerPage1: TXSLPageProducerPage1
  OldCreateOrder = False
  PageProducer = XSLPageProducer
  Left = 254
  Top = 107
  Height = 201
  Width = 244
  object XSLPageProducer: TXSLPageProducer
    Active = True
    XMLData = XMLBroker1
    Left = 48
    Top = 8
    DOMVendorDesc = 'MSXML'
  end
  object XMLBroker1: TXMLBroker
    Params = <>
    ProviderName = 'DataSetProvider1'
    WebDispatch.PathInfo = 'XMLBroker1'
    Left = 56
    Top = 80
  end
  object Table1: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'country.db'
    Left = 144
    Top = 32
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Table1
    Constraints = True
    Left = 144
    Top = 104
  end
end
