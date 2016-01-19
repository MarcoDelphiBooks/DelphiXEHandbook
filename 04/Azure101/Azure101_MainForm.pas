unit Azure101_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, AzureUI, DSAzureTable, DSAzure, DSAzureBlob;

type
  TForm9 = class(TForm)
    btnConnect: TButton;
    AzureConnectionString1: TAzureConnectionString;
    AzureTableManagement1: TAzureTableManagement;
    AzureBlobManagement1: TAzureBlobManagement;
    btnEntities: TButton;
    Memo1: TMemo;
    btnAddRow: TButton;
    btnBlobUrl: TButton;
    CheckBox1: TCheckBox;
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEntitiesClick(Sender: TObject);
    procedure btnAddRowClick(Sender: TObject);
    procedure btnBlobUrlClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

uses
  DBXJson, DSAzureTableDialog, Clipbrd, IniFiles;

procedure TForm9.btnAddRowClick(Sender: TObject);
var
  TableService: TAzureTableService;
  RowObj: TJSONObject;
  Key: String;
begin
  TableService := TAzureTableService.Create(AzureConnectionString1);
  try
    RowObj := TJSONObject.Create;

    RowObj.AddPair(XML_ROWKEY,  TJSONString.Create('ID' + IntToStr (Random (100000))));
    RowObj.AddPair(XML_PARTITION,  TJSONString.Create(TimeToStr (now)));

    RowObj.AddPair('name',  TJSONString.Create('marco'));
    RowObj.AddPair('site',  TJSONString.Create('www.marcocantu.com'));
    if CheckBox1.Checked then
      RowObj.AddPair('twitter',  TJSONString.Create('marcocantu'));

    Log (TableService.InsertEntity('marco1', RowObj));
  finally
    TableService.Free;
  end;
end;

procedure TForm9.btnBlobUrlClick(Sender: TObject);
var
  str1: string;
begin
  str1 := AzureConnectionString1.BlobURL;
  ShowMessage (str1 + ' is on the clipboard');
  Clipboard.AsText := str1;
end;

procedure TForm9.btnConnectClick(Sender: TObject);
begin
  // AzureConnectionString1.AccountName := '';
  // AzureConnectionString1.AccountKey := '';
  Caption := 'Connected to ' +
    AzureConnectionString1.TableURL;
  AzureTableManagement1.Active := True;
  AzureBlobManagement1.Active := True;
end;

procedure TForm9.btnEntitiesClick(Sender: TObject);
var
  TableService: TAzureTableService;
begin
  TableService := TAzureTableService.Create(AzureConnectionString1);
  try
    Log(TableService.QueryEntities('marco1'));
  finally
    TableService.Free;
  end;
end;

procedure TForm9.FormCreate(Sender: TObject);
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
end;

procedure TForm9.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

initialization
  Randomize;

end.
