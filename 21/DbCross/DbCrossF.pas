unit DbCrossF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ComCtrls;

type
  TDbCrossForm = class(TForm)
    TableCustomers: TTable;
    TableOrders: TTable;
    TableItems: TTable;
    BtnGenerate: TButton;
    DataSource1: TDataSource;
    TableCustomersCustNo: TFloatField;
    TableCustomersCompany: TStringField;
    TableCustomersAddr1: TStringField;
    TableCustomersAddr2: TStringField;
    TableCustomersCity: TStringField;
    TableCustomersState: TStringField;
    TableCustomersZip: TStringField;
    TableCustomersCountry: TStringField;
    TableCustomersPhone: TStringField;
    TableCustomersFAX: TStringField;
    TableCustomersTaxRate: TFloatField;
    TableCustomersContact: TStringField;
    TableCustomersLastInvoiceDate: TDateTimeField;
    DataSource2: TDataSource;
    TableOrdersOrderNo: TFloatField;
    TableOrdersCustNo: TFloatField;
    TableOrdersSaleDate: TDateTimeField;
    TableOrdersShipDate: TDateTimeField;
    TableOrdersEmpNo: TIntegerField;
    TableOrdersShipToContact: TStringField;
    TableOrdersShipToAddr1: TStringField;
    TableOrdersShipToAddr2: TStringField;
    TableOrdersShipToCity: TStringField;
    TableOrdersShipToState: TStringField;
    TableOrdersShipToZip: TStringField;
    TableOrdersShipToCountry: TStringField;
    TableOrdersShipToPhone: TStringField;
    TableOrdersShipVIA: TStringField;
    TableOrdersPO: TStringField;
    TableOrdersTerms: TStringField;
    TableOrdersPaymentMethod: TStringField;
    TableOrdersItemsTotal: TCurrencyField;
    TableOrdersTaxRate: TFloatField;
    TableOrdersFreight: TCurrencyField;
    TableOrdersAmountPaid: TCurrencyField;
    TableItemsOrderNo: TFloatField;
    TableItemsItemNo: TFloatField;
    TableItemsPartNo: TFloatField;
    TableItemsQty: TIntegerField;
    TableItemsDiscount: TFloatField;
    EditPath: TEdit;
    Label1: TLabel;
    TableParts: TTable;
    TableItemsPart: TStringField;
    TablePartsPartNo: TFloatField;
    TablePartsVendorNo: TFloatField;
    TablePartsDescription: TStringField;
    TablePartsOnHand: TFloatField;
    TablePartsOnOrder: TFloatField;
    TablePartsCost: TCurrencyField;
    TablePartsListPrice: TCurrencyField;
    ButtonMain: TButton;
    ButtonCross: TButton;
    BtnPath: TButton;
    ProgressBar1: TProgressBar;
    procedure BtnGenerateClick(Sender: TObject);
    procedure ButtonMainClick(Sender: TObject);
    procedure ButtonCrossClick(Sender: TObject);
    procedure BtnPathClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  DbCrossForm: TDbCrossForm;

implementation

{$R *.DFM}

{$WARN UNIT_PLATFORM OFF}

uses
  Shellapi, HtmlData, FileCtrl;

// partial version (with no cross reference)
{procedure TDbCrossForm.BtnGenerateClick(Sender: TObject);
var
  HtmlCust, HtmlOrd, HtmlItem: THtmlData;
begin
  // initialize
  Screen.Cursor := crHourglass;
  ProgressBar1.Max := TableCustomers.RecordCount;

  // create the string lists
  HtmlCust := THtmlData.Create (TableCustomers);
  HtmlOrd := THtmlData.Create (TableOrders);
  HtmlItem := THtmlData.Create (TableItems);

  try
    // the main file (customers)
    HtmlCust.AddHeader ('All the Customers');

    // for each customer
    TableCustomers.First;
    while not TableCustomers.EOF do
    begin
      // add a row to the html customers table,
      // linked with the orders of the customer
      HtmlCust.AddTableRow ('Cust');

      // create an order file for each customer
      HtmlOrd.AddHeader (TableCustomersCompany.AsString +
        ' Orders');

      // for each order of the current customer
      TableOrders.First;
      while not TableOrders.EOF do
      begin
        // add the data of the order file,
        // linked with the items of each order
        HtmlOrd.AddTableRow ('Ord');

        // create an item file for each order
        HtmlItem.AddHeader (
          TableCustomersCompany.AsString + ' Order No. ' +
          TableOrders.FieldByName('OrderNo').AsString);

        // for each item of the current order
        while not TableItems.EOF do
        begin
          // add the data of the current item
          // (with no further links)
          HtmlItem.AddTableRow ('');
          TableItems.Next;
        end;

        // save the html file with the items of the order
        HtmlItem.AddFooter;
        HtmlItem.SaveToFile (EditPath.Text + 'Ord' +
          TableOrders.FieldByName('OrderNo').AsString +
          '.htm');
        TableOrders.Next;
      end;

      // save the html file with the orders of the customer
      HtmlOrd.AddFooter;
      HtmlOrd.SaveToFile (EditPath.Text + 'Cust' +
        TableCustomersCustNo.AsString + '.htm');
      TableCustomers.Next;

      // update the UI
      ProgressBar1.Position := TableCustomers.RecNo;
      Application.ProcessMessages;
    end;

    // save the main file with the list of customers
    HtmlCust.AddFooter;
    HtmlCust.SaveToFile (EditPath.Text + 'main.htm');
  finally
    HtmlCust.Free;
    HtmlOrd.Free;
    HtmlItem.Free;
    Beep;
    Screen.Cursor := crDefault;
  end;
end;}

// complete version (with cross reference)
procedure TDbCrossForm.BtnGenerateClick(Sender: TObject);
var
  HtmlCust, HtmlOrd, HtmlItem, HtmlParts: THtmlData;
  HtmlMem: THtmlStrings;
  ListOfLists: TStringList;
  Index: Integer;
begin
  // initialize
  Screen.Cursor := crHourglass;
  ProgressBar1.Max := TableCustomers.RecordCount;

  // create the string lists
  HtmlCust := THtmlData.Create (TableCustomers);
  HtmlOrd := THtmlData.Create (TableOrders);
  HtmlItem := THtmlData.Create (TableItems);
  HtmlParts := THtmlData.Create (TableParts);
  ListOfLists := TStringList.Create;

  try
    // the main file (customers)
    HtmlCust.AddHeader ('All the Customers');

    // for each customer
    TableCustomers.First;
    while not TableCustomers.EOF do
    begin
      // add a row to the html customers table,
      // linked with the orders of the customer
      HtmlCust.AddTableRow ('Cust');

      // create an order file for each customer
      HtmlOrd.AddHeader (TableCustomersCompany.AsString +
        ' Orders');

      // for each order of the current customer
      TableOrders.First;
      while not TableOrders.EOF do
      begin
        // add the data of the order file,
        // linked with the items of each order
        HtmlOrd.AddTableRow ('Ord');

        // create an item file for each order
        HtmlItem.AddHeader (
          TableCustomersCompany.AsString + ' Order No. ' +
          TableOrders.FieldByName('OrderNo').AsString);

        // for each item of the current order
        while not TableItems.EOF do
        begin
          // add the data of the current item
          // (with no further links)
          HtmlItem.AddTableRow ('');

          // look for the part number in the cross
          // reference files in memory
          Index := ListOfLists.IndexOf (
            TableItemsPartNo.AsString);
          // if not found, create a new entry
          if Index < 0 then
          begin
            // create a new string list for this part
            HtmlMem := THtmlStrings.Create;
             HtmlMem.AddHeader ('Part: ' +
              TableItemsPart.AsString);
            // add it to the main list of parts
            Index := ListOfLists.AddObject (
              TableItemsPartNo.AsString, HtmlMem);
          end;
          // in any case, add a new reference to the
          // (existing or new) string list for this part
          THtmlStrings (ListOfLists.Objects[Index]).
            Add ('<a href="Ord' +
              TableItemsOrderNo.AsString + '.htm">' +
              TableCustomersCompany.AsString +
              ' Order No. ' +
              TableOrders.FieldByName('OrderNo').AsString +
              '</a><p>');
          TableItems.Next;
        end;

        // save the html file with the items of the order
        HtmlItem.AddFooter;
        HtmlItem.SaveToFile (EditPath.Text + 'Ord' +
          TableOrders.FieldByName('OrderNo').AsString +
          '.htm');
        TableOrders.Next;
      end;

      // save the html file with the orders of the customer
      HtmlOrd.AddFooter;
      HtmlOrd.SaveToFile (EditPath.Text + 'Cust' +
        TableCustomersCustNo.AsString + '.htm');
      TableCustomers.Next;

      // update the UI
      ProgressBar1.Position := TableCustomers.RecNo;
      Application.ProcessMessages;
    end;

    // save the main file with the list of customers
    HtmlCust.AddFooter;
    HtmlCust.SaveToFile (EditPath.Text + 'main.htm');

    // save each file of the cross reference
    for Index := 0 to ListOfLists.Count - 1 do
    begin
      HtmlMem := THtmlStrings (ListOfLists.Objects[Index]);
      HtmlMem.AddFooter;
      HtmlMem.SaveToFile (EditPath.Text + 'Itx' +
        ListOfLists [Index] + '.htm');
      HtmlMem.Free;
    end;

    // generate the index of the cross reference
    HtmlParts.AddHeader ('Parts Cross Reference');
    TableParts.First;
    while not TableParts.EOF do
    begin
      // add a row to the html customers table
      HtmlParts.AddTableRow ('Itx');
      TableParts.Next;
    end;
    HtmlParts.AddFooter;
    HtmlParts.SaveToFile (EditPath.Text +
      'Parts.htm');

  finally
    HtmlCust.Free;
    HtmlOrd.Free;
    HtmlItem.Free;
    HtmlParts.Free;
    ListOfLists.Free;
    Beep;
    Screen.Cursor := crDefault;
  end;
end;

procedure TDbCrossForm.ButtonMainClick(Sender: TObject);
begin
  // open the main file with the default browser
  ShellExecute (Handle, 'open',
    pChar (EditPath.Text + 'main.htm'),
    '', '', sw_ShowNormal);
end;

procedure TDbCrossForm.ButtonCrossClick(Sender: TObject);
begin
  // open the main file with the default browser
  ShellExecute (Handle, 'open',
    pChar (EditPath.Text + 'parts.htm'),
    '', '', sw_ShowNormal);
end;

procedure TDbCrossForm.BtnPathClick(Sender: TObject);
var
  SelDir: string;
begin
  SelDir := EditPath.Text;
  if SelectDirectory (SelDir,
      [sdAllowCreate, sdPerformCreate, sdPrompt], 0) then
    EditPath.Text := SelDir + '\';
end;

procedure TDbCrossForm.FormCreate(Sender: TObject);
begin
  EditPath.Text := ExtractFilePath (Application.Exename);
end;

end.
