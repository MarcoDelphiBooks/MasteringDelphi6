object Form1: TForm1
  Left = 227
  Top = 222
  Width = 613
  Height = 438
  Caption = 'MapTable'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    605
    411)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 589
    Height = 169
    Anchors = [akLeft, akTop, akRight]
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btnMap: TButton
    Left = 8
    Top = 184
    Width = 588
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Map'
    TabOrder = 1
    OnClick = btnMapClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 216
    Width = 588
    Height = 192
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'customer.db'
    Left = 24
    Top = 24
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Table1
    Constraints = True
    Left = 24
    Top = 80
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 32
    Top = 136
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = ClientDataSet1
    Constraints = True
    Left = 32
    Top = 192
  end
  object XMLTransformClient1: TXMLTransformClient
    ProviderName = 'DataSetProvider2'
    TransformGetData.TransformationFile = 'C:\md6code\23\MapTable\CustomersToXml.xtr'
    Left = 32
    Top = 256
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 104
    Top = 136
  end
end
