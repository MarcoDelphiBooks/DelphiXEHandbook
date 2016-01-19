unit SpinWaiting_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Diagnostics;

type
  TFormSpin = class(TForm)
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    ProgressBar4: TProgressBar;
    btnSleep: TButton;
    btnNoSync: TButton;
    btnSpin: TButton;
    Memo1: TMemo;
    procedure btnSleepClick(Sender: TObject);
    procedure btnNoSyncClick(Sender: TObject);
    procedure btnSpinClick(Sender: TObject);
  private
    stopWatch: Diagnostics.TStopwatch;
    procedure InitCycle;
  public
    procedure TerminateThread(Sender: TObject);
  end;

var
  FormSpin: TFormSpin;

implementation

uses
  SpinWaiting_Threads;

{$R *.dfm}

procedure TFormSpin.btnNoSyncClick(Sender: TObject);
var
  I: Integer;
begin
  InitCycle;
  for I := 1 to TBaseThread.ThreadCount do
  begin
    with TBaseThread.Create (True) do
    begin
      Progress := FindComponent ('ProgressBar' + IntToStr (I))
        as TProgressBar;
      OnTerminate := TerminateThread;
      Start;
    end;
  end;
end;

procedure TFormSpin.btnSleepClick(Sender: TObject);
var
  I: Integer;
begin
  InitCycle;
  for I := 1 to TBaseThread.ThreadCount do
  begin
    with TSleepThread.Create (True) do
    begin
      Progress := FindComponent ('ProgressBar' + IntToStr (I))
        as TProgressBar;
      OnTerminate := TerminateThread;
      Start;
    end;
  end;
end;

procedure TFormSpin.btnSpinClick(Sender: TObject);
var
  I: Integer;
begin
  InitCycle;
  for I := 1 to TBaseThread.ThreadCount do
  begin
    with TSpinThread.Create (True) do
    begin
      Progress := FindComponent ('ProgressBar' + IntToStr (I))
        as TProgressBar;
      OnTerminate := TerminateThread;
      Start;
    end;
  end;
end;

procedure TFormSpin.TerminateThread(Sender: TObject);
begin
  stopWatch.Stop;
  Memo1.Lines.Add (Sender.ClassName + ': ' +
    IntToStr (stopWatch.ElapsedMilliseconds));
end;

procedure TFormSpin.InitCycle;
begin
  TBaseThread.GlobalSteps := 0;
  stopWatch := TStopwatch.Create;
  stopWatch.Start;
end;

end.
