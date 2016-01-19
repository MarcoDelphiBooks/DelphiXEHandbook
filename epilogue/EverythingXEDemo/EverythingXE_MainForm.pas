unit EverythingXE_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormMain = class(TForm)
    edSourceText: TEdit;
    Label1: TLabel;
    ListBox1: TListBox;
    btnTranslate: TButton;
    edTranslated: TEdit;
    Label2: TLabel;
    btnPaint: TButton;
    procedure btnTranslateClick(Sender: TObject);
    procedure btnPaintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses
  BabelGoogle, EverythingXE_PaintForm;

procedure TFormMain.btnTranslateClick(Sender: TObject);
var
  strLang: string;
begin
  if ListBox1.ItemIndex > -1 then
  begin
    strLang := ListBox1.Items.Names [ListBox1.ItemIndex];
    TThread.CreateAnonymousThread(
      procedure()
      var
        strTra: string;
      begin
        strTra := TBabelGoogleRest.
          Translate(edSourceText.Text, 'en', strLang);
        TThread.Synchronize (TThread.CurrentThread,
        procedure
        begin
          edTranslated.Text := strTra;
          btnPaint.Enabled := True;
        end);
      end).Start;
  end
  else
    ShowMessage ('Select a language');
end;

procedure TFormMain.btnPaintClick(Sender: TObject);
var
  formP: TFormPaint;
begin
  formP := TFormPaint.Create(self);
  formP.TextToDisplay := edTranslated.Text;
  formP.Language := ListBox1.Items.Names [ListBox1.ItemIndex];
  formP.Show;
end;

end.
