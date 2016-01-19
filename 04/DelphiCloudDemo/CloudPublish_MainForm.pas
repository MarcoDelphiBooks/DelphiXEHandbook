unit CloudPublish_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBClient, DSAzure, DSAzureTable, DSAzureBlob,
  ExtCtrls;

type
  TFormCloudPublish = class(TForm)
    cdsBio: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnPostOne: TButton;
    btnPostAll: TButton;
    AzureConnectionString1: TAzureConnectionString;
    btnCreateTable: TButton;
    btnDeleteTable: TButton;
    cdsBioSpeciesNo: TFloatField;
    cdsBioCategory: TStringField;
    cdsBioCommon_Name: TStringField;
    cdsBioSpeciesName: TStringField;
    cdsBioLengthcm: TFloatField;
    cdsBioLength_In: TFloatField;
    cdsBioNotes: TMemoField;
    cdsBioGraphic: TGraphicField;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnPostOneClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCreateTableClick(Sender: TObject);
    procedure btnDeleteTableClick(Sender: TObject);
    procedure btnPostAllClick(Sender: TObject);
  private
    TableService: TAzureTableService;
    BlobService: TAzureBlobService;
    function JpegContentOf: TBytes;
  public
    { Public declarations }
  end;

var
  FormCloudPublish: TFormCloudPublish;

implementation

{$R *.dfm}

uses
  IniFiles, DBXJSON, DSAzureTableDialog, jpeg;

const
  tablename = 'biolife';

procedure TFormCloudPublish.btnCreateTableClick(Sender: TObject);
begin
  TableService.CreateTable (tablename);
  BlobService.CreateContainer(tablename)
end;

procedure TFormCloudPublish.btnDeleteTableClick(Sender: TObject);
begin
  TableService.DeleteTable (tablename);
end;

procedure TFormCloudPublish.btnPostAllClick(Sender: TObject);
begin
  cdsBio.First;
  while not cdsBio.Eof do
  begin
    Application.ProcessMessages;
    btnPostOneClick (Sender);
    cdsBio.Next;
  end;
end;

function TFormCloudPublish.JpegContentOf: TBytes;
var
  jpgImg: TJPEGImage;
  aStream: TMemoryStream;
begin
  Image1.Picture.Assign(cdsBioGraphic);

  jpgImg := TJPEGImage.Create;
  aStream := TMemoryStream.Create;
  try
    jpgImg.Assign(Image1.Picture.Graphic);
    jpgImg.SaveToStream (aStream);
    aStream.Position := 0;
    SetLength(Result, aStream.Size);
    aStream.ReadBuffer(Result[0], aStream.Size);
  finally
     jpgImg.Free;
     aStream.Free;
  end;
end;

procedure TFormCloudPublish.btnPostOneClick(Sender: TObject);
var
  strTable: string;
  RowObj: TJSONObject;
  content: TBytes;
begin
  RowObj := TJSONObject.Create;
  RowObj.AddPair (XML_ROWKEY, TJSONString.Create (cdsBioSpeciesNo.AsString));
  RowObj.AddPair (XML_PARTITION, TJSONString.Create (TimeToStr (now)));

  RowObj.AddPair('category',  TJSONString.Create(cdsBioCategory.AsString));
  RowObj.AddPair('commonname',  TJSONString.Create(cdsBioCommon_Name.AsString));
  RowObj.AddPair('speciesname',  TJSONString.Create(cdsBioSpeciesName.AsString));
  RowObj.AddPair('length',  TJSONString.Create(cdsBioLengthcm.AsString));
  RowObj.AddPair('notes',  TJSONString.Create(cdsBioNotes.AsString));

  BlobService.PutBlockBlob(tablename,
    cdsBioSpeciesNo.AsString + '.jpg',
    JpegContentOf,
    '', nil, 'image/jpeg');
  TableService.InsertEntity(tablename, RowObj);
end;

procedure TFormCloudPublish.FormCreate(Sender: TObject);
var
  fIni: TMemIniFile;
begin
  // open the table
  cdsBio.LoadFromFile('../../biolife.cds');
  cdsBio.Open;

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

procedure TFormCloudPublish.FormDestroy(Sender: TObject);
begin
  TableService.Free;
end;

end.
