unit XmlIniTest_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, xmldom, XMLIntf, msxmldom, XMLDoc;

type
  TForm13 = class(TForm)
    btnRead: TButton;
    XMLDocument1: TXMLDocument;
    Memo1: TMemo;
    btnWrite: TButton;
    procedure btnReadClick(Sender: TObject);
    procedure btnWriteClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

uses
  XmlIniFile;

procedure TForm13.btnReadClick(Sender: TObject);
var
  xmlIni: TXmlIniFile;
  sList: TStringList;
begin
  Log ('Reading test.xml');
  XMLDocument1.LoadFromFile('../../test.xml');
  XMLDocument1.Active := True;
  Memo1.Lines.AddStrings (XMLDocument1.XML);

  xmlIni := TXmlIniFile.Create(XMLDocument1.DocumentElement);
  sList := TStringList.Create;
  try
    Log ('List of sections:');
    xmlIni.ReadSections (sList);
    Memo1.Lines.AddStrings (sList);

    Log ('Section Values:');
    xmlIni.ReadSectionValues ('section1', sList);
    Memo1.Lines.AddStrings (sList);

    Log ('Specific value:');
    Log (xmlIni.ReadString('section1', 'FirstEntry', ''));
  finally
    sList.Free;
    xmlIni.Free;
  end;
end;

procedure TForm13.btnWriteClick(Sender: TObject);
var
  xmlIni: TXmlIniFile;
begin
  Log ('Writing a an XmlIniFile:');
  XMLDocument1.XML.Text := '<root></root>';
  XMLDocument1.Active := True;
  xmlIni := TXmlIniFile.Create(XMLDocument1.DocumentElement);
  try
    xmlIni.WriteString('aSession', 'item1', 'one');
    xmlIni.WriteInteger('aSession', 'item2', 2);

    Log (XMLDocument1.XML.Text);
  finally
    xmlIni.Free;
  end;
end;

procedure TForm13.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

end.
