object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'WebActionItem1'
      PathInfo = '/InetXPageProducer1'
      Producer = InetXPageProducer1
    end>
  Left = 338
  Top = 194
  Height = 250
  Width = 210
  object XMLBroker1: TXMLBroker
    Params = <>
    ProviderName = 'ProviderCustomer'
    RemoteServer = DCOMConnection1
    WebDispatch.PathInfo = 'XMLBroker1'
    Left = 48
    Top = 64
  end
  object InetXPageProducer1: TInetXPageProducer
    IncludePathURL = '/jssource/'
    HTMLDoc.Strings = (
      '<HTML>'
      '<HEAD>'
      '</HEAD>'
      '<BODY>'
      '<#INCLUDES><#STYLES><#WARNINGS><#FORMS><#SCRIPT>'
      '</BODY>'
      '</HTML>')
    Left = 56
    Top = 128
    object DataForm1: TDataForm
      object LayoutGroup1: TLayoutGroup
        DisplayColumns = 2
        object DataNavigator1: TDataNavigator
          XMLComponent = FieldGroup1
          object FirstButton1: TFirstButton
            XMLComponent = FieldGroup1
            XMLUseParent = False
            Caption = '|<'
          end
          object PriorButton1: TPriorButton
            XMLComponent = FieldGroup1
            XMLUseParent = False
            Caption = '<'
          end
          object NextButton1: TNextButton
            XMLComponent = FieldGroup1
            XMLUseParent = False
            Caption = '>'
          end
          object LastButton1: TLastButton
            XMLComponent = FieldGroup1
            XMLUseParent = False
            Caption = '>|'
          end
          object UndoButton1: TUndoButton
            XMLComponent = FieldGroup1
            XMLUseParent = False
            Caption = 'Undo'
          end
          object ApplyUpdatesButton1: TApplyUpdatesButton
            Caption = 'Apply Updates'
            XMLBroker = XMLBroker1
            XMLUseParent = True
          end
        end
        object DataNavigator2: TDataNavigator
          XMLComponent = DataGrid1
          object FirstButton2: TFirstButton
            XMLComponent = DataGrid1
            XMLUseParent = False
            Caption = '|<'
          end
          object PriorPageButton1: TPriorPageButton
            XMLComponent = DataGrid1
            XMLUseParent = False
            Caption = '<<'
          end
          object PriorButton2: TPriorButton
            XMLComponent = DataGrid1
            XMLUseParent = False
            Caption = '<'
          end
          object NextButton2: TNextButton
            XMLComponent = DataGrid1
            XMLUseParent = False
            Caption = '>'
          end
          object NextPageButton1: TNextPageButton
            XMLComponent = DataGrid1
            XMLUseParent = False
            Caption = '>>'
          end
          object LastButton2: TLastButton
            XMLComponent = DataGrid1
            XMLUseParent = False
            Caption = '>|'
          end
        end
        object FieldGroup1: TFieldGroup
          XMLBroker = XMLBroker1
          object FieldText11: TFieldText
            DisplayWidth = 10
            FieldName = 'Zip'
          end
          object FieldText12: TFieldText
            DisplayWidth = 20
            FieldName = 'Country'
          end
          object FieldText13: TFieldText
            DisplayWidth = 15
            FieldName = 'Phone'
          end
          object FieldText14: TFieldText
            DisplayWidth = 10
            FieldName = 'TaxRate'
          end
          object FieldText15: TFieldText
            DisplayWidth = 20
            FieldName = 'Contact'
          end
          object FieldStatus1: TFieldStatus
            Caption = 'Updated'
          end
          object FieldText16: TFieldText
            DisplayWidth = 10
            FieldName = 'CustNo'
          end
          object FieldText17: TFieldText
            DisplayWidth = 30
            FieldName = 'Company'
          end
          object FieldText18: TFieldText
            DisplayWidth = 30
            FieldName = 'Addr1'
          end
          object FieldText19: TFieldText
            DisplayWidth = 20
            FieldName = 'State'
          end
          object FieldText20: TFieldText
            DisplayWidth = 15
            FieldName = 'City'
          end
        end
        object DataGrid1: TDataGrid
          XMLBroker = XMLBroker1
          XMLDataSetField = 'TableOrders'
          DisplayRows = 9
          object TextColumn8: TTextColumn
            DisplayWidth = 10
            FieldName = 'OrderNo'
          end
          object TextColumn9: TTextColumn
            DisplayWidth = 18
            FieldName = 'SaleDate'
          end
          object TextColumn10: TTextColumn
            DisplayWidth = 10
            FieldName = 'EmpNo'
          end
          object TextColumn11: TTextColumn
            DisplayWidth = 15
            FieldName = 'PO'
          end
          object TextColumn12: TTextColumn
            DisplayWidth = 6
            FieldName = 'Terms'
          end
          object TextColumn13: TTextColumn
            DisplayWidth = 10
            FieldName = 'ItemsTotal'
          end
          object TextColumn14: TTextColumn
            DisplayWidth = 10
            FieldName = 'AmountPaid'
          end
        end
      end
    end
  end
  object DCOMConnection1: TDCOMConnection
    ServerGUID = '{E31849A9-4A82-11D3-B9F1-00000100A27B}'
    ServerName = 'AppSPlus.AppServerPlus'
    Left = 48
    Top = 16
  end
end
