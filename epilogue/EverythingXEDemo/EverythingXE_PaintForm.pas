unit EverythingXE_PaintForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Direct2D, IniFiles, Menus, DSAzure, DSAzureTable, DSAzureBlob,
  ExtCtrls;

type
  TFormPaint = class(TForm)
    PopupMenu1: TPopupMenu;
    itemToAzure: TMenuItem;
    itemNewFolder: TMenuItem;
    AzureConnectionString1: TAzureConnectionString;
    procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure itemNewFolderClick(Sender: TObject);
    procedure itemToAzureClick(Sender: TObject);
  private
    d2dCanvas: TDirect2DCanvas;
    FTextToDisplay: string;
    BlobService: TAzureBlobService;
    FLanguage: string;
    procedure SetTextToDisplay(const Value: string);
    function JpegContentOf: TBytes;
    procedure SetLanguage(const Value: string);
  public
    property TextToDisplay: string read FTextToDisplay write SetTextToDisplay;
    property Language: string read FLanguage write SetLanguage;
  end;

var
  FormPaint: TFormPaint;

implementation

{$R *.dfm}

uses
  D2D1, jpeg, ClipBrd;

const
  strFolderName = 'translations';

{ TFormPaint }

procedure TFormPaint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormPaint.FormCreate(Sender: TObject);
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
  BlobService := TAzureBlobService.Create(AzureConnectionString1);
  BlobService.SetUp;
end;

procedure TFormPaint.FormPaint(Sender: TObject);
var
  gradColors: array of TColor;
  Center: TD2D1Point2F;
  strText: string;
  matrix, defMatrix: TD2DMatrix3x2F;
  I: Integer;
begin
  d2dCanvas := TDirect2DCanvas.Create(Canvas, ClientRect);
  d2dCanvas.BeginDraw;
  try
    d2dCanvas.RenderTarget.GetTransform (defMatrix);

    // define the gradient colors
    SetLength (gradColors, 4);
    gradColors [0] := clRed;
    gradColors [1] := clYellow;
    gradColors [2] := clPurple;
    gradColors [3] := clWhite;

    // create the gradient brush, using colors and points
    Center := D2D1PointF (100, 100);
    d2dCanvas.Brush.Handle :=
      d2dCanvas.CreateBrush (gradColors, Center,
      D2D1PointF (300, 200), 1200, 1200);

    // paint the entire form with the gradient brush
    d2dCanvas.Rectangle(0, 0, ClientWidth + 50, ClientHeight + 50);

    // define a font with a gradient brush
    d2dCanvas.Font.Size := 30;
    d2dCanvas.Font.Brush.Handle :=
      d2dCanvas.CreateBrush (gradColors, Center,
        D2D1PointF (300, 300), 450, 350);;
    d2dCanvas.Font.Style := [fsBold];
    d2dCanvas.Brush.Style := bsClear;

    // output some text with the current font
    d2dCanvas.TextOut(200, 100, FTextToDisplay);

    for I := 1 to 10 do
    begin
      D2D1MakeRotateMatrix (I * 6, D2D1PointF(50, 50), @matrix);
      d2dCanvas.RenderTarget.SetTransform(matrix);
      d2dCanvas.Font.Brush.Handle.SetOpacity(1 - I * 0.1);
      d2dCanvas.TextOut(200, 100, FTextToDisplay);
    end;
    // reset standard transformation
    d2dCanvas.RenderTarget.SetTransform (defMatrix);
  finally
    d2dCanvas.EndDraw;
  end;
  d2dCanvas.Free;
end;

procedure TFormPaint.itemNewFolderClick(Sender: TObject);
begin
  BlobService.CreateContainer(strFolderName);
end;

procedure TFormPaint.SetLanguage(const Value: string);
begin
  FLanguage := Value;
end;

procedure TFormPaint.SetTextToDisplay(const Value: string);
begin
  FTextToDisplay := Value;
end;

function TFormPaint.JpegContentOf: TBytes;
var
  jpgImg: TJPEGImage;
  aStream: TMemoryStream;
begin
  jpgImg := TJPEGImage.Create;
  aStream := TMemoryStream.Create;
  try
    jpgImg.Assign(GetFormImage);
    jpgImg.SaveToStream (aStream);
    aStream.Position := 0;
    SetLength(Result, aStream.Size);
    aStream.ReadBuffer(Result[0], aStream.Size);
  finally
     jpgImg.Free;
     aStream.Free;
  end;
end;

procedure TFormPaint.itemToAzureClick(Sender: TObject);
begin
  BlobService.PutBlockBlob(strFolderName,
    Language + '.jpg', JpegContentOf, '', nil, 'image/jpeg');
  Clipboard.AsText := AzureConnectionString1.BlobURL +
    '/' + strFolderName + '/' + Language + '.jpg';
end;

end.
