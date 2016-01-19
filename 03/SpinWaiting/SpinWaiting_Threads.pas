unit SpinWaiting_Threads;

interface

uses
  Classes, ComCtrls, SyncObjs, Math;

type
  TBaseThread = class(TThread)
  private
    function SomeThingSlow: Extended;
  public
    total: Double;
    Progress: TProgressBar;
  public const
    // try various values
//    EachCycle = 100;
    EachCycle = 400;
//    EachCycle = 2000;
    ThreadCount = 4; // or 2;
  public
    class var GlobalSteps: Integer;
  protected
    procedure Execute; override;
    // sync on shared value
    procedure PostValue (step: Integer); virtual;
  end;

  TSleepThread = class (TBaseThread)
    procedure PostValue (step: Integer); override;
  end;

  TSpinThread = class (TBaseThread)
    procedure PostValue (step: Integer); override;
  end;

implementation

{ TBaseThread }

procedure TBaseThread.Execute;
var
  I: Integer;
begin
  FreeOnTerminate := True;
  total := 0;
  for I := 1 to 10000 do
  begin
    // do something slow
    total := SomethingSlow;
    // udpate progress
    if I mod 200 = 0 then
      Synchronize(procedure ()
      begin
        Progress.Position := I div 100;
      end);
    // wait for other threads
    PostValue (I);
  end;
end;

procedure TBaseThread.PostValue (step: Integer);
begin
  // do nothing, don't sync
end;

function TBaseThread.SomeThingSlow: Extended;
var
  I: Integer;
begin
  Result := 0;
  for I := 1 to EachCycle do
    Result := Result + math.ArcTan2(Sin(Random), Random);
end;

{ TSleepThread }

procedure TSleepThread.PostValue(step: Integer);
begin
  TInterlocked.Increment(GlobalSteps);
  // wait all other threads by sleeping
  while step > (GlobalSteps div ThreadCount) do
    Sleep (1);
end;

{ TSpinThread }

procedure TSpinThread.PostValue(step: Integer);
begin
  TInterlocked.Increment(GlobalSteps);
  // wait all other threads by sleeping
  TSpinWait.SpinUntil(
    function (): Boolean
    begin
      Result := step <= (GlobalSteps div ThreadCount)
    end);
end;

initialization
  Randomize;

end.
