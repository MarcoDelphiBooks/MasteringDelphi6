object Form1: TForm1
  Left = 280
  Top = 180
  Width = 332
  Height = 188
  Caption = 'MyBase1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 324
    Height = 161
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    FileName = 'C:\md6code\14\MyBase1\test'
    FieldDefs = <
      item
        Name = 'one'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'two'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 128
    Top = 16
    Data = {
      3E0000009619E0BD0100000018000000020000000000030000003E00036F6E65
      01004900000001000557494454480200020014000374776F0200010000000000
      0000}
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 192
    Top = 16
  end
end
