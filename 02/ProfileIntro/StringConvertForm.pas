unit StringConvertForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormStringConvert = class(TForm)
    btnLatin1: TButton;
    Memo1: TMemo;
    btnConcat: TButton;
    btnWarning: TButton;
    Button1: TButton;
    procedure btnLatin1Click(Sender: TObject);
    procedure btnConcatClick(Sender: TObject);
    procedure btnWarningClick(Sender: TObject);
    procedure btnToFileClick(Sender: TObject);
    procedure btnFromFileClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnEnsureClick(Sender: TObject);
  private
    function Concat1: string;
    function Concat2: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormStringConvert: TFormStringConvert;

implementation

uses
  Character;

{$R *.dfm}

const MaxLoop = 10000;

function TFormStringConvert.Concat1: string;
var
  str1, str2: string;
  I: Integer;
begin
  str1 := 'Marco ';
  str2 := 'Cantù ';
  for I := 1 to MaxLoop do
    str1 := str1 + str2;
  Result := str1;
end;

function TFormStringConvert.Concat2: string;
var
  I: Integer;
  str3: Utf8String;
  str4: AnsiString;
begin
  str3 := 'Marco ';
  str4 := 'Cantù ';
  for I := 1 to MaxLoop do
    str3 := str3 + str4;
  Result := str3;
end;

procedure TFormStringConvert.btnConcatClick(Sender: TObject);
var
  str1, str2: string;
  t1: TDateTime;
begin
  t1 := Now;
  Concat1;
  t1 := now - t1;
  Memo1.Lines.Add ('plain: ' + FormatDateTime('nn:ss.zzz', t1));

  t1 := Now;
  Concat2;
  t1 := now - t1;
  Memo1.Lines.Add ('mixed: ' + FormatDateTime('nn:ss.zzz', t1));
end;

{$INLINE OFF}
{$STRINGCHECKS ON}

function DoubleLengthOn(const S: UnicodeString): Integer;
begin
  Result := Length(S);
end;

function DoubleLengthUpperOn(const S: UnicodeString): Integer;
begin
  Result := Length(AnsiUppercase(S));
end;

{$STRINGCHECKS OFF}

function DoubleLengthOff(const S: UnicodeString): Integer;
begin
  Result := Length(S);
end;

function DoubleLengthUpperOff(const S: UnicodeString): Integer;
begin
  Result := Length(AnsiUppercase(S));
end;

{$STRINGCHECKS ON}

procedure TFormStringConvert.btnEnsureClick(Sender: TObject);
var
  str1: string;
  I, tot: Integer;
  t1: TDateTime;
begin
  str1 := 'Marco Cantù';

  t1 := Now;
  tot := 0;
  for I := 1 to MaxLoop * 1000 do
    Inc (tot, DoubleLengthUpperOn (str1));
  t1 := now - t1;
  Memo1.Lines.Add ('UpperOn: ' + FormatDateTime('nn:ss.zzz', t1));

  t1 := Now;
  tot := 0;
  for I := 1 to MaxLoop do
    Inc (tot, DoubleLengthUpperOff (str1));
  t1 := now - t1;
  Memo1.Lines.Add ('UpperOff: ' + FormatDateTime('nn:ss.zzz', t1));

  t1 := Now;
  tot := 0;
  for I := 1 to MaxLoop do
    Inc (tot, DoubleLengthOn (str1));
  t1 := now - t1;
  Memo1.Lines.Add ('On: ' + FormatDateTime('nn:ss.zzz', t1));

  t1 := Now;
  tot := 0;
  for I := 1 to MaxLoop do
    Inc (tot, DoubleLengthOff (str1));
  t1 := now - t1;
  Memo1.Lines.Add ('Off: ' + FormatDateTime('nn:ss.zzz', t1));
end;

procedure TFormStringConvert.btnFromFileClick(Sender: TObject);
begin
  Memo1.Lines.LoadFromFile('test.txt'{, TEncoding.UTF8});
end;

procedure TFormStringConvert.btnToFileClick(Sender: TObject);
begin
  // TEncoding.UTF8.GetPreamble;
  Memo1.Lines.SaveToFile('test.txt', TEncoding.Unicode);
end;

procedure TFormStringConvert.btnWarningClick(Sender: TObject);
var
  str1: AnsiString;
  str3: string;
begin
  str3 := 'any string with a ' + ConvertFromUtf32 (16536);
  str1 := str3;
  Memo1.Lines.Add (str1);
  Memo1.Lines.Add (str3);
end;

procedure TFormStringConvert.Button1Click(Sender: TObject);
var
  str1: string;
  str2: AnsiString;
  I: Integer;
  t1: TDateTime;
  str3: Utf8String;
  str4: AnsiString;
begin
  str1 := 'Marco Cantù';
  t1 := Now;
  for I := 1 to MaxLoop do
    str1 := AnsiUpperCase (str1);
  t1 := now - t1;
  Memo1.Lines.Add ('AnsiUpperCase (string): ' + FormatDateTime('nn:ss.zzz', t1));

  str2 := 'Marco Cantù';
  t1 := Now;
  for I := 1 to MaxLoop do
    str2 := AnsiUpperCase (str2);
  t1 := now - t1;
  Memo1.Lines.Add ('AnsiUpperCase (AnsiString): ' + FormatDateTime('nn:ss.zzz', t1));
end;

type
  Latin1String = type AnsiString(28591);

procedure TFormStringConvert.btnLatin1Click(Sender: TObject);
var
  str1: AnsiString;
  str2: Latin1String;
  rbs: RawByteString;
begin
  str1 := 'any string with a €';
  str2 := str1; // 'any string with a €';

  Memo1.Lines.Add (str1);
  Memo1.Lines.Add (IntToStr (Ord (str1[19])));

  Memo1.Lines.Add (str2);
  Memo1.Lines.Add (IntToStr (Ord (str2[19])));

  rbs := str1;
  SetCodePage(rbs{str1}, 28591, True);
  Memo1.Lines.Add (rbs{str1});
  Memo1.Lines.Add (IntToStr (Ord (rbs{str1}[19])));
end;

end.
