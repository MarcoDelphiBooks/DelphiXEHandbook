unit TranslateMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TTranslateForm = class(TForm)
    edSourceText: TEdit;
    German: TButton;
    Memo1: TMemo;
    Italian: TButton;
    bntPick: TButton;
    ListBox1: TListBox;
    procedure GermanClick(Sender: TObject);
    procedure ItalianClick(Sender: TObject);
    procedure bntPickClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TranslateForm: TTranslateForm;

implementation

uses
  BabelGoogle;

{$R *.dfm}

procedure TTranslateForm.bntPickClick(Sender: TObject);
var
  strLang: string;
begin
  if ListBox1.ItemIndex > -1 then
  begin
    strLang := ListBox1.Items.Names [ListBox1.ItemIndex];
    Memo1.Lines.Add (TBabelGoogleRest.
      Translate(edSourceText.Text, 'en', strLang));
  end
  else
    ShowMessage ('Select a language');
end;

procedure TTranslateForm.GermanClick(Sender: TObject);
begin
  Memo1.Lines.Add (TBabelGoogleRest.
    Translate(edSourceText.Text, 'en', 'de'));
end;

procedure TTranslateForm.ItalianClick(Sender: TObject);
begin
  Memo1.Lines.Add (TBabelGoogleRest.
    Translate(edSourceText.Text, 'en', 'it'));
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
