unit CloudBrowse_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DSAzure, StdCtrls, ExtCtrls, DB, DBClient, xmldom, XMLIntf, msxmldom,
  XMLDoc, jpeg, GIFImg;

type
  TForm13 = class(TForm)
    AzureConnectionString1: TAzureConnectionString;
    Image1: TImage;
    btnList: TButton;
    Memo1: TMemo;
    XMLDocument1: TXMLDocument;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure btnListClick(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    TableService: TAzureTableService;
    BlobService: TAzureBlobService;
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

uses
  IniFiles, AzureTableXmlInterfaces, IDUri;

const
  tablename = 'biolife';

procedure TForm13.btnListClick(Sender: TObject);
var
  strXml: string;
  iFeeed: IXMLFeedType;
  iEntry: IXMLEntryType;
  I: Integer;
  strContent: string;
  initPos: Integer;
  countPos: Integer;
  strRowKey: string;
  strPartKey: string;
begin
  // ask for the entities
  strXml := TableService.QueryEntities(tablename);
  // memo1.Lines.Text := strXml;
  XMLDocument1.LoadFromXML(strXml);
  XMLDocument1.Active := True;

  iFeeed := AzureTableXmlInterfaces.Getfeed(XmlDocument1);
  for I := 0 to iFeeed.Entry.Count - 1 do
  begin
    // fixup (namespace issues workaround)
    strContent := iFeeed.Entry[I].Content.XML;

    initPos := Pos ('<d:RowKey xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices">', strContent) + Length ('<d:RowKey xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices">');
    countPos := Pos ('</d:RowKey>', strContent) - initPos;
    strRowKey := copy (strContent, initPos, countPos);

    initPos := Pos ('<d:PartitionKey xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices">', strContent) + Length ('<d:PartitionKey xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices">');
    countPos := Pos ('</d:PartitionKey>', strContent) - initPos;
    strPartKey := copy (strContent, initPos, countPos);

    ListBox1.Items.Add(strRowKey + '=' + strPartKey);
  end;
end;

procedure TForm13.FormCreate(Sender: TObject);
var
  fIni: TMemIniFile;
begin
  fIni := TMemIniFile.Create(GetHomePath + PathDelim + 'azure.ini');
  try
    AzureConnectionString1.AccountName :=
      fIni.ReadString('azure', 'AccountName', '');
    AzureConnectionString1.AccountKey :=
      fIni.ReadString('azure', 'AccountKey', '');
  finally
    FreeAndNil (fIni);
  end;

  Caption := Caption + ' - ' + AzureConnectionString1.TableURL;
  TableService := TAzureTableService.Create(AzureConnectionString1);
  TableService.SetUp;

  BlobService := TAzureBlobService.Create(AzureConnectionString1);
  BlobService.SetUp;
end;

procedure TForm13.ListBox1DblClick(Sender: TObject);
var
  strRowKey: string;
  strXml: string;
  memStream: TMemoryStream;
  strPartKey: string;
begin
  strRowKey := ListBox1.Items.Names [ListBox1.ItemIndex];
  strPartKey := ListBox1.Items.ValueFromIndex [ListBox1.ItemIndex];
  strXml := TableService.QueryEntities(tablename, TIDUri.ParamsEncode(strPartKey), strRowKey);
  memo1.Lines.Text := strXml;

  memStream := TMemoryStream.Create;
  BlobService.GetBlob(tablename, strRowKey + '.jpg', memStream);
  memStream.Position := 0;
  Image1.Picture.Graphic.LoadFromStream(memStream);
  MemStream.Free;
end;

end.
