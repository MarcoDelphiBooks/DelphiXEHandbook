object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Everything XE'
  ClientHeight = 313
  ClientWidth = 756
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 35
    Width = 58
    Height = 13
    Caption = 'English Text'
  end
  object Label2: TLabel
    Left = 24
    Top = 128
    Width = 53
    Height = 13
    Caption = 'Translation'
  end
  object edSourceText: TEdit
    Left = 112
    Top = 32
    Width = 377
    Height = 21
    TabOrder = 0
    Text = 'Delphi can really do everything'
  end
  object ListBox1: TListBox
    Left = 528
    Top = 32
    Width = 201
    Height = 241
    ItemHeight = 13
    Items.Strings = (
      'ar=Arabic'
      'bg=Bulgarian'
      'ca=Catalan'
      'zh-CN=Chinese simpl.'
      'zh-TW=Chinese trad.'
      'hr=Croatian'
      'cs=Czech'
      'da=Danish'
      'nl=Dutch'
      'tl=Filipino'
      'fi=Finnish'
      'fr=French'
      'de=German'
      'el=Greek'
      'iw=Hebrew'
      'hi=Hindi'
      'id=Indonesian'
      'it=Italian'
      'ja=Japanese'
      'ko=Korean'
      'lv=Latvian'
      'lt=Lithuanian'
      'no=Norwegian'
      'pl=Polish'
      'pt=Portuguese'
      'ro=Romanian'
      'ru=Russian'
      'sr=Serbian'
      'sk=Slovak'
      'sl=Slovenian'
      'es=Spanish'
      'sv=Swedish'
      'uk=Ukrainian'
      'vi=Vietnamese'
      'en=English')
    TabOrder = 1
  end
  object btnTranslate: TButton
    Left = 256
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Translate'
    TabOrder = 2
    OnClick = btnTranslateClick
  end
  object edTranslated: TEdit
    Left = 112
    Top = 128
    Width = 361
    Height = 21
    TabOrder = 3
  end
  object btnPaint: TButton
    Left = 256
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Paint'
    Enabled = False
    TabOrder = 4
    OnClick = btnPaintClick
  end
end
