object FormDrag: TFormDrag
  Left = 243
  Top = 107
  Width = 609
  Height = 345
  Caption = 'DragToGrid'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelDrag: TLabel
    Left = 24
    Top = 16
    Width = 314
    Height = 13
    Caption = 
      'Enter a value in the edit and drag the label over the target gri' +
      'd cell:'
    DragMode = dmAutomatic
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 56
    Width = 553
    Height = 225
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDragDrop = DBGrid1DragDrop
    OnDragOver = DBGrid1DragOver
  end
  object EditDrag: TEdit
    Left = 24
    Top = 32
    Width = 313
    Height = 21
    Color = clWindow
    TabOrder = 1
    Text = 'New Value'
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 496
    Top = 72
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'country.db'
    Left = 496
    Top = 16
  end
end
