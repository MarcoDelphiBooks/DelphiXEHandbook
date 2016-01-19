unit Logging_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CodeSiteLogging {csl template};

type
  TForm9 = class(TForm)
    btnSimpleLogs: TButton;
    BtnMethodsTracing: TButton;
    procedure btnSimpleLogsClick(Sender: TObject);
    procedure BtnMethodsTracingClick(Sender: TObject);
  private
    procedure One;
    procedure Two;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure TForm9.btnSimpleLogsClick(Sender: TObject);
begin
  {css template}
  CodeSite.Send( 'button1' );
  CodeSite.Send( 'data', Sender );
  CodeSite.Send( 'boolean', Sender is TObject);
  CodeSite.Send( csmCheckPoint, 'warning', Left);

  {csw template}
  CodeSite.SendWarning( 'msg' );

  {cns template}
  CodeSite.SendNote( 'this is an interesting note' );

end;

{csn csx templates}

procedure TForm9.Two;
begin
  CodeSite.EnterMethod( Self, 'Two' );
  // do something
  CodeSite.ExitMethod( Self, 'Two' );
end;

procedure TForm9.One;
begin
  CodeSite.EnterMethod( Self, 'One' );
  Two;
  CodeSite.ExitMethod( Self, 'ONe' );
end;

procedure TForm9.BtnMethodsTracingClick(Sender: TObject);
begin
  CodeSite.EnterMethod( Self, 'Button2Click' );
  One;
  CodeSite.ExitMethod( Self, 'Button2Click' );
end;

end.
