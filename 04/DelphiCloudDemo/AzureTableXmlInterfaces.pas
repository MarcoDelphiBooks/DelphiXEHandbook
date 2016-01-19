
{***************************************************************************}
{                                                                           }
{                             XML Data Binding                              }
{                                                                           }
{         Generated on: 5/11/2011 10:56:34 PM                               }
{       Generated from: C:\code\ddd2011\DelphiCloudDemo\SampleXmlData.xml   }
{   Settings stored in: C:\code\ddd2011\DelphiCloudDemo\SampleXmlData.xdb   }
{                                                                           }
{***************************************************************************}

unit AzureTableXmlInterfaces;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLFeedType = interface;
  IXMLTitleType = interface;
  IXMLLinkType = interface;
  IXMLEntryType = interface;
  IXMLEntryTypeList = interface;
  IXMLAuthorType = interface;
  IXMLCategoryType = interface;
  IXMLContentType = interface;
  IXMLPropertiesType = interface;
  IXMLTimestampType = interface;
  IXMLNotesType = interface;

{ IXMLFeedType }

  IXMLFeedType = interface(IXMLNode)
    ['{7A4C3AD6-9080-4A84-A6FB-38992709B3E9}']
    { Property Accessors }
    function Get_Xmlns: UnicodeString;
    function Get_Title: IXMLTitleType;
    function Get_Id: UnicodeString;
    function Get_Updated: UnicodeString;
    function Get_Link: IXMLLinkType;
    function Get_Entry: IXMLEntryTypeList;
    procedure Set_Xmlns(Value: UnicodeString);
    procedure Set_Id(Value: UnicodeString);
    procedure Set_Updated(Value: UnicodeString);
    { Methods & Properties }
    property Xmlns: UnicodeString read Get_Xmlns write Set_Xmlns;
    property Title: IXMLTitleType read Get_Title;
    property Id: UnicodeString read Get_Id write Set_Id;
    property Updated: UnicodeString read Get_Updated write Set_Updated;
    property Link: IXMLLinkType read Get_Link;
    property Entry: IXMLEntryTypeList read Get_Entry;
  end;

{ IXMLTitleType }

  IXMLTitleType = interface(IXMLNode)
    ['{7AE87617-63A3-4DF0-8E3E-94ACF4C33C00}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
  end;

{ IXMLLinkType }

  IXMLLinkType = interface(IXMLNode)
    ['{493144F9-3CB0-4B99-9441-3FFE48D80921}']
    { Property Accessors }
    function Get_Rel: UnicodeString;
    function Get_Title: UnicodeString;
    function Get_Href: UnicodeString;
    procedure Set_Rel(Value: UnicodeString);
    procedure Set_Title(Value: UnicodeString);
    procedure Set_Href(Value: UnicodeString);
    { Methods & Properties }
    property Rel: UnicodeString read Get_Rel write Set_Rel;
    property Title: UnicodeString read Get_Title write Set_Title;
    property Href: UnicodeString read Get_Href write Set_Href;
  end;

{ IXMLEntryType }

  IXMLEntryType = interface(IXMLNode)
    ['{9E33AB78-FBDA-48D0-8B4C-EC967DD5A171}']
    { Property Accessors }
    function Get_Etag: UnicodeString;
    function Get_Id: UnicodeString;
    function Get_Title: IXMLTitleType;
    function Get_Updated: UnicodeString;
    function Get_Author: IXMLAuthorType;
    function Get_Link: IXMLLinkType;
    function Get_Category: IXMLCategoryType;
    function Get_Content: IXMLContentType;
    procedure Set_Etag(Value: UnicodeString);
    procedure Set_Id(Value: UnicodeString);
    procedure Set_Updated(Value: UnicodeString);
    { Methods & Properties }
    property Etag: UnicodeString read Get_Etag write Set_Etag;
    property Id: UnicodeString read Get_Id write Set_Id;
    property Title: IXMLTitleType read Get_Title;
    property Updated: UnicodeString read Get_Updated write Set_Updated;
    property Author: IXMLAuthorType read Get_Author;
    property Link: IXMLLinkType read Get_Link;
    property Category: IXMLCategoryType read Get_Category;
    property Content: IXMLContentType read Get_Content;
  end;

{ IXMLEntryTypeList }

  IXMLEntryTypeList = interface(IXMLNodeCollection)
    ['{04680BFA-81F7-454B-BDFF-731DC8BD0404}']
    { Methods & Properties }
    function Add: IXMLEntryType;
    function Insert(const Index: Integer): IXMLEntryType;

    function Get_Item(Index: Integer): IXMLEntryType;
    property Items[Index: Integer]: IXMLEntryType read Get_Item; default;
  end;

{ IXMLAuthorType }

  IXMLAuthorType = interface(IXMLNode)
    ['{AEF225C8-3640-4FEF-BF90-8615FA2C7DF1}']
    { Property Accessors }
    function Get_Name: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Name: UnicodeString read Get_Name write Set_Name;
  end;

{ IXMLCategoryType }

  IXMLCategoryType = interface(IXMLNode)
    ['{E6BF6C3B-D83A-4BA8-B27A-95C3D906268D}']
    { Property Accessors }
    function Get_Term: UnicodeString;
    function Get_Scheme: UnicodeString;
    procedure Set_Term(Value: UnicodeString);
    procedure Set_Scheme(Value: UnicodeString);
    { Methods & Properties }
    property Term: UnicodeString read Get_Term write Set_Term;
    property Scheme: UnicodeString read Get_Scheme write Set_Scheme;
  end;

{ IXMLContentType }

  IXMLContentType = interface(IXMLNode)
    ['{1626CE37-6084-456A-AECD-44EA8DBE5F4F}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Properties: IXMLPropertiesType;
    procedure Set_Type_(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Properties: IXMLPropertiesType read Get_Properties;
  end;

{ IXMLPropertiesType }

  IXMLPropertiesType = interface(IXMLNode)
    ['{DA52CCC8-853B-4A47-B62D-63BD419DCE71}']
    { Property Accessors }
    function Get_PartitionKey: UnicodeString;
    function Get_RowKey: Integer;
    function Get_Timestamp: IXMLTimestampType;
    function Get_Category: UnicodeString;
    function Get_Commonname: UnicodeString;
    function Get_Speciesname: UnicodeString;
    function Get_Length: Integer;
    function Get_Notes: IXMLNotesType;
    procedure Set_PartitionKey(Value: UnicodeString);
    procedure Set_RowKey(Value: Integer);
    procedure Set_Category(Value: UnicodeString);
    procedure Set_Commonname(Value: UnicodeString);
    procedure Set_Speciesname(Value: UnicodeString);
    procedure Set_Length(Value: Integer);
    { Methods & Properties }
    property PartitionKey: UnicodeString read Get_PartitionKey write Set_PartitionKey;
    property RowKey: Integer read Get_RowKey write Set_RowKey;
    property Timestamp: IXMLTimestampType read Get_Timestamp;
    property Category: UnicodeString read Get_Category write Set_Category;
    property Commonname: UnicodeString read Get_Commonname write Set_Commonname;
    property Speciesname: UnicodeString read Get_Speciesname write Set_Speciesname;
    property Length: Integer read Get_Length write Set_Length;
    property Notes: IXMLNotesType read Get_Notes;
  end;

{ IXMLTimestampType }

  IXMLTimestampType = interface(IXMLNode)
    ['{26E311D9-7E43-4CDC-90F1-2F5957B6ABE2}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
  end;

{ IXMLNotesType }

  IXMLNotesType = interface(IXMLNode)
    ['{7463F2DF-6DA0-40CF-9EE5-AB86B4335DD0}']
    { Property Accessors }
    function Get_Space: UnicodeString;
    procedure Set_Space(Value: UnicodeString);
    { Methods & Properties }
    property Space: UnicodeString read Get_Space write Set_Space;
  end;

{ Forward Decls }

  TXMLFeedType = class;
  TXMLTitleType = class;
  TXMLLinkType = class;
  TXMLEntryType = class;
  TXMLEntryTypeList = class;
  TXMLAuthorType = class;
  TXMLCategoryType = class;
  TXMLContentType = class;
  TXMLPropertiesType = class;
  TXMLTimestampType = class;
  TXMLNotesType = class;

{ TXMLFeedType }

  TXMLFeedType = class(TXMLNode, IXMLFeedType)
  private
    FEntry: IXMLEntryTypeList;
  protected
    { IXMLFeedType }
    function Get_Xmlns: UnicodeString;
    function Get_Title: IXMLTitleType;
    function Get_Id: UnicodeString;
    function Get_Updated: UnicodeString;
    function Get_Link: IXMLLinkType;
    function Get_Entry: IXMLEntryTypeList;
    procedure Set_Xmlns(Value: UnicodeString);
    procedure Set_Id(Value: UnicodeString);
    procedure Set_Updated(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTitleType }

  TXMLTitleType = class(TXMLNode, IXMLTitleType)
  protected
    { IXMLTitleType }
    function Get_Type_: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
  end;

{ TXMLLinkType }

  TXMLLinkType = class(TXMLNode, IXMLLinkType)
  protected
    { IXMLLinkType }
    function Get_Rel: UnicodeString;
    function Get_Title: UnicodeString;
    function Get_Href: UnicodeString;
    procedure Set_Rel(Value: UnicodeString);
    procedure Set_Title(Value: UnicodeString);
    procedure Set_Href(Value: UnicodeString);
  end;

{ TXMLEntryType }

  TXMLEntryType = class(TXMLNode, IXMLEntryType)
  protected
    { IXMLEntryType }
    function Get_Etag: UnicodeString;
    function Get_Id: UnicodeString;
    function Get_Title: IXMLTitleType;
    function Get_Updated: UnicodeString;
    function Get_Author: IXMLAuthorType;
    function Get_Link: IXMLLinkType;
    function Get_Category: IXMLCategoryType;
    function Get_Content: IXMLContentType;
    procedure Set_Etag(Value: UnicodeString);
    procedure Set_Id(Value: UnicodeString);
    procedure Set_Updated(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLEntryTypeList }

  TXMLEntryTypeList = class(TXMLNodeCollection, IXMLEntryTypeList)
  protected
    { IXMLEntryTypeList }
    function Add: IXMLEntryType;
    function Insert(const Index: Integer): IXMLEntryType;

    function Get_Item(Index: Integer): IXMLEntryType;
  end;

{ TXMLAuthorType }

  TXMLAuthorType = class(TXMLNode, IXMLAuthorType)
  protected
    { IXMLAuthorType }
    function Get_Name: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
  end;

{ TXMLCategoryType }

  TXMLCategoryType = class(TXMLNode, IXMLCategoryType)
  protected
    { IXMLCategoryType }
    function Get_Term: UnicodeString;
    function Get_Scheme: UnicodeString;
    procedure Set_Term(Value: UnicodeString);
    procedure Set_Scheme(Value: UnicodeString);
  end;

{ TXMLContentType }

  TXMLContentType = class(TXMLNode, IXMLContentType)
  protected
    { IXMLContentType }
    function Get_Type_: UnicodeString;
    function Get_Properties: IXMLPropertiesType;
    procedure Set_Type_(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPropertiesType }

  TXMLPropertiesType = class(TXMLNode, IXMLPropertiesType)
  protected
    { IXMLPropertiesType }
    function Get_PartitionKey: UnicodeString;
    function Get_RowKey: Integer;
    function Get_Timestamp: IXMLTimestampType;
    function Get_Category: UnicodeString;
    function Get_Commonname: UnicodeString;
    function Get_Speciesname: UnicodeString;
    function Get_Length: Integer;
    function Get_Notes: IXMLNotesType;
    procedure Set_PartitionKey(Value: UnicodeString);
    procedure Set_RowKey(Value: Integer);
    procedure Set_Category(Value: UnicodeString);
    procedure Set_Commonname(Value: UnicodeString);
    procedure Set_Speciesname(Value: UnicodeString);
    procedure Set_Length(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTimestampType }

  TXMLTimestampType = class(TXMLNode, IXMLTimestampType)
  protected
    { IXMLTimestampType }
    function Get_Type_: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
  end;

{ TXMLNotesType }

  TXMLNotesType = class(TXMLNode, IXMLNotesType)
  protected
    { IXMLNotesType }
    function Get_Space: UnicodeString;
    procedure Set_Space(Value: UnicodeString);
  end;

{ Global Functions }

function Getfeed(Doc: IXMLDocument): IXMLFeedType;
function Loadfeed(const FileName: string): IXMLFeedType;
function Newfeed: IXMLFeedType;

const
  TargetNamespace = 'http://www.w3.org/2005/Atom';

implementation

{ Global Functions }

function Getfeed(Doc: IXMLDocument): IXMLFeedType;
begin
  Result := Doc.GetDocBinding('feed', TXMLFeedType, TargetNamespace) as IXMLFeedType;
end;

function Loadfeed(const FileName: string): IXMLFeedType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('feed', TXMLFeedType, TargetNamespace) as IXMLFeedType;
end;

function Newfeed: IXMLFeedType;
begin
  Result := NewXMLDocument.GetDocBinding('feed', TXMLFeedType, TargetNamespace) as IXMLFeedType;
end;

{ TXMLFeedType }

procedure TXMLFeedType.AfterConstruction;
begin
  RegisterChildNode('title', TXMLTitleType);
  RegisterChildNode('link', TXMLLinkType);
  RegisterChildNode('entry', TXMLEntryType);
  FEntry := CreateCollection(TXMLEntryTypeList, IXMLEntryType, 'entry') as IXMLEntryTypeList;
  inherited;
end;

function TXMLFeedType.Get_Xmlns: UnicodeString;
begin
  Result := AttributeNodes['xmlns'].Text;
end;

procedure TXMLFeedType.Set_Xmlns(Value: UnicodeString);
begin
  SetAttribute('xmlns', Value);
end;

function TXMLFeedType.Get_Title: IXMLTitleType;
begin
  Result := ChildNodes['title'] as IXMLTitleType;
end;

function TXMLFeedType.Get_Id: UnicodeString;
begin
  Result := ChildNodes['id'].Text;
end;

procedure TXMLFeedType.Set_Id(Value: UnicodeString);
begin
  ChildNodes['id'].NodeValue := Value;
end;

function TXMLFeedType.Get_Updated: UnicodeString;
begin
  Result := ChildNodes['updated'].Text;
end;

procedure TXMLFeedType.Set_Updated(Value: UnicodeString);
begin
  ChildNodes['updated'].NodeValue := Value;
end;

function TXMLFeedType.Get_Link: IXMLLinkType;
begin
  Result := ChildNodes['link'] as IXMLLinkType;
end;

function TXMLFeedType.Get_Entry: IXMLEntryTypeList;
begin
  Result := FEntry;
end;

{ TXMLTitleType }

function TXMLTitleType.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLTitleType.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

{ TXMLLinkType }

function TXMLLinkType.Get_Rel: UnicodeString;
begin
  Result := AttributeNodes['rel'].Text;
end;

procedure TXMLLinkType.Set_Rel(Value: UnicodeString);
begin
  SetAttribute('rel', Value);
end;

function TXMLLinkType.Get_Title: UnicodeString;
begin
  Result := AttributeNodes['title'].Text;
end;

procedure TXMLLinkType.Set_Title(Value: UnicodeString);
begin
  SetAttribute('title', Value);
end;

function TXMLLinkType.Get_Href: UnicodeString;
begin
  Result := AttributeNodes['href'].Text;
end;

procedure TXMLLinkType.Set_Href(Value: UnicodeString);
begin
  SetAttribute('href', Value);
end;

{ TXMLEntryType }

procedure TXMLEntryType.AfterConstruction;
begin
  RegisterChildNode('title', TXMLTitleType);
  RegisterChildNode('author', TXMLAuthorType);
  RegisterChildNode('link', TXMLLinkType);
  RegisterChildNode('category', TXMLCategoryType);
  RegisterChildNode('content', TXMLContentType);
  inherited;
end;

function TXMLEntryType.Get_Etag: UnicodeString;
begin
  Result := AttributeNodes['etag'].Text;
end;

procedure TXMLEntryType.Set_Etag(Value: UnicodeString);
begin
  SetAttribute('etag', Value);
end;

function TXMLEntryType.Get_Id: UnicodeString;
begin
  Result := ChildNodes['id'].Text;
end;

procedure TXMLEntryType.Set_Id(Value: UnicodeString);
begin
  ChildNodes['id'].NodeValue := Value;
end;

function TXMLEntryType.Get_Title: IXMLTitleType;
begin
  Result := ChildNodes['title'] as IXMLTitleType;
end;

function TXMLEntryType.Get_Updated: UnicodeString;
begin
  Result := ChildNodes['updated'].Text;
end;

procedure TXMLEntryType.Set_Updated(Value: UnicodeString);
begin
  ChildNodes['updated'].NodeValue := Value;
end;

function TXMLEntryType.Get_Author: IXMLAuthorType;
begin
  Result := ChildNodes['author'] as IXMLAuthorType;
end;

function TXMLEntryType.Get_Link: IXMLLinkType;
begin
  Result := ChildNodes['link'] as IXMLLinkType;
end;

function TXMLEntryType.Get_Category: IXMLCategoryType;
begin
  Result := ChildNodes['category'] as IXMLCategoryType;
end;

function TXMLEntryType.Get_Content: IXMLContentType;
begin
  Result := ChildNodes['content'] as IXMLContentType;
end;

{ TXMLEntryTypeList }

function TXMLEntryTypeList.Add: IXMLEntryType;
begin
  Result := AddItem(-1) as IXMLEntryType;
end;

function TXMLEntryTypeList.Insert(const Index: Integer): IXMLEntryType;
begin
  Result := AddItem(Index) as IXMLEntryType;
end;

function TXMLEntryTypeList.Get_Item(Index: Integer): IXMLEntryType;
begin
  Result := List[Index] as IXMLEntryType;
end;

{ TXMLAuthorType }

function TXMLAuthorType.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLAuthorType.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

{ TXMLCategoryType }

function TXMLCategoryType.Get_Term: UnicodeString;
begin
  Result := AttributeNodes['term'].Text;
end;

procedure TXMLCategoryType.Set_Term(Value: UnicodeString);
begin
  SetAttribute('term', Value);
end;

function TXMLCategoryType.Get_Scheme: UnicodeString;
begin
  Result := AttributeNodes['scheme'].Text;
end;

procedure TXMLCategoryType.Set_Scheme(Value: UnicodeString);
begin
  SetAttribute('scheme', Value);
end;

{ TXMLContentType }

procedure TXMLContentType.AfterConstruction;
begin
  RegisterChildNode('properties', TXMLPropertiesType);
    // 'http://schemas.microsoft.com/ado/2007/08/dataservices/metadata'); // fixup
  inherited;
end;

function TXMLContentType.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLContentType.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLContentType.Get_Properties: IXMLPropertiesType;
begin
  Result := ChildNodes['properties'] as IXMLPropertiesType;
end;

{ TXMLPropertiesType }

procedure TXMLPropertiesType.AfterConstruction;
begin
  RegisterChildNode('Timestamp', TXMLTimestampType); // , 'http://schemas.microsoft.com/ado/2007/08/dataservices');
  RegisterChildNode('notes', TXMLNotesType); //, 'http://schemas.microsoft.com/ado/2007/08/dataservices');
  inherited;
end;

function TXMLPropertiesType.Get_PartitionKey: UnicodeString;
begin
  Result := ChildNodes['PartitionKey'].Text;
end;

procedure TXMLPropertiesType.Set_PartitionKey(Value: UnicodeString);
begin
  ChildNodes['PartitionKey'].NodeValue := Value;
end;

function TXMLPropertiesType.Get_RowKey: Integer;
begin
  Result := ChildNodes['RowKey'].NodeValue;
end;

procedure TXMLPropertiesType.Set_RowKey(Value: Integer);
begin
  ChildNodes['RowKey'].NodeValue := Value;
end;

function TXMLPropertiesType.Get_Timestamp: IXMLTimestampType;
begin
  Result := ChildNodes['Timestamp'] as IXMLTimestampType;
end;

function TXMLPropertiesType.Get_Category: UnicodeString;
begin
  Result := ChildNodes['category'].Text;
end;

procedure TXMLPropertiesType.Set_Category(Value: UnicodeString);
begin
  ChildNodes['category'].NodeValue := Value;
end;

function TXMLPropertiesType.Get_Commonname: UnicodeString;
begin
  Result := ChildNodes['commonname'].Text;
end;

procedure TXMLPropertiesType.Set_Commonname(Value: UnicodeString);
begin
  ChildNodes['commonname'].NodeValue := Value;
end;

function TXMLPropertiesType.Get_Speciesname: UnicodeString;
begin
  Result := ChildNodes['speciesname'].Text;
end;

procedure TXMLPropertiesType.Set_Speciesname(Value: UnicodeString);
begin
  ChildNodes['speciesname'].NodeValue := Value;
end;

function TXMLPropertiesType.Get_Length: Integer;
begin
  Result := ChildNodes['length'].NodeValue;
end;

procedure TXMLPropertiesType.Set_Length(Value: Integer);
begin
  ChildNodes['length'].NodeValue := Value;
end;

function TXMLPropertiesType.Get_Notes: IXMLNotesType;
begin
  Result := ChildNodes['notes'] as IXMLNotesType;
end;

{ TXMLTimestampType }

function TXMLTimestampType.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLTimestampType.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

{ TXMLNotesType }

function TXMLNotesType.Get_Space: UnicodeString;
begin
  Result := AttributeNodes['space'].Text;
end;

procedure TXMLNotesType.Set_Space(Value: UnicodeString);
begin
  SetAttribute('space', Value);
end;

end.