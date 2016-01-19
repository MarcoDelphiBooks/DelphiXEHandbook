unit AlignTest_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm10 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
    procedure AddToLog (const strMsg: string);
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

{$ALIGN 16}
type
  TMyRecord16 = record
    c: AnsiChar;
    w: Word;
    b: Boolean;
    I: Integer;
    d: Double;
  end;

{$ALIGN 4}
type
  TMyRecord4 = record
    c: AnsiChar;
    w: Word;
    b: Boolean;
    I: Integer;
    d: Double;
  end;

{$ALIGN 1}
type
  TMyRecord1 = record
    c: AnsiChar;
    w: Word;
    b: Boolean;
    I: Integer;
    d: Double;
  end;

procedure TForm10.AddToLog(const strMsg: string);
begin
  Memo1.Lines [Memo1.Lines.Count-1] := Memo1.Lines [Memo1.Lines.Count-1] +
    ' ' + strMsg;
end;

procedure TForm10.FormCreate(Sender: TObject);
var
  MyRec1: TMyRecord1;
  MyRec4: TMyRecord4;
  MyRec16: TMyRecord16;
begin
  Log ('ALIGN 1 -- sizeof: ' + IntToStr (sizeof(TMyRecord1)));
  Log ('c: ' + IntToStr (Integer(@MyRec1.c) - Integer(@MyRec1)));
  AddToLog ('w: ' + IntToStr (Integer(@MyRec1.w) - Integer(@MyRec1)));
  AddToLog ('b: ' + IntToStr (Integer(@MyRec1.b) - Integer(@MyRec1)));
  AddToLog ('i: ' + IntToStr (Integer(@MyRec1.i) - Integer(@MyRec1)));
  AddToLog ('d: ' + IntToStr (Integer(@MyRec1.d) - Integer(@MyRec1)));

  Log ('ALIGN 4 -- sizeof: ' + IntToStr (sizeof(TMyRecord4)));
  Log ('c: ' + IntToStr (Integer(@MyRec4.c) - Integer(@MyRec4)));
  AddToLog ('w: ' + IntToStr (Integer(@MyRec4.w) - Integer(@MyRec4)));
  AddToLog ('b: ' + IntToStr (Integer(@MyRec4.b) - Integer(@MyRec4)));
  AddToLog ('i: ' + IntToStr (Integer(@MyRec4.i) - Integer(@MyRec4)));
  AddToLog ('d: ' + IntToStr (Integer(@MyRec4.d) - Integer(@MyRec4)));

  Log ('ALIGN 16 -- sizeof: ' + IntToStr (sizeof(TMyRecord16)));
  Log ('c: ' + IntToStr (Integer(@MyRec16.c) - Integer(@MyRec16)));
  AddToLog ('w: ' + IntToStr (Integer(@MyRec16.w) - Integer(@MyRec16)));
  AddToLog ('b: ' + IntToStr (Integer(@MyRec16.b) - Integer(@MyRec16)));
  AddToLog ('i: ' + IntToStr (Integer(@MyRec16.i) - Integer(@MyRec16)));
  AddToLog ('d: ' + IntToStr (Integer(@MyRec16.d) - Integer(@MyRec16)));
end;

procedure TForm10.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

end.
