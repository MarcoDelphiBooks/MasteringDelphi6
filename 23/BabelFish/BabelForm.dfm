object Form1: TForm1
  Left = 204
  Top = 215
  Width = 664
  Height = 175
  Caption = 'BabelFish'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 40
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Translate'
    TabOrder = 0
    OnClick = Button1Click
  end
  object EditSource: TEdit
    Left = 160
    Top = 32
    Width = 465
    Height = 21
    TabOrder = 1
    Text = 'This is a sample message for an automatic translation'
  end
  object EditTarget: TEdit
    Left = 160
    Top = 72
    Width = 465
    Height = 21
    TabOrder = 2
  end
  object ComboBoxType: TComboBox
    Left = 40
    Top = 72
    Width = 81
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = 'en_it'
    Items.Strings = (
      'en_it'
      'en_fr'
      'en_de'
      'en_pt'
      'en_es')
  end
  object HTTPRIO1: THTTPRIO
    WSDLLocation = 'C:\md6code\23\BabelFish\BabelFishService.xml'
    Service = 'BabelFish'
    Port = 'BabelFishPort'
    HTTPWebNode.Agent = 'Borland SOAP 1.1'
    HTTPWebNode.UseUTF8InHeader = False
    Converter.Options = [soSendMultiRefObj, soTryAllSchema]
    Left = 32
    Top = 24
  end
end
