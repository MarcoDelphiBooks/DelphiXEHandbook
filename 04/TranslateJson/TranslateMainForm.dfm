object TranslateForm: TTranslateForm
  Left = 0
  Top = 0
  Caption = 'TranslateForm'
  ClientHeight = 332
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edSourceText: TEdit
    Left = 16
    Top = 24
    Width = 193
    Height = 21
    TabOrder = 0
    Text = 'Welcome to the new great Delphi XE'
  end
  object German: TButton
    Left = 224
    Top = 24
    Width = 75
    Height = 25
    Caption = 'German'
    TabOrder = 1
    OnClick = GermanClick
  end
  object Memo1: TMemo
    Left = 16
    Top = 64
    Width = 371
    Height = 241
    TabOrder = 2
  end
  object Italian: TButton
    Left = 312
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Italian'
    TabOrder = 3
    OnClick = ItalianClick
  end
  object bntPick: TButton
    Left = 456
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Pick'
    TabOrder = 4
    OnClick = bntPickClick
  end
  object ListBox1: TListBox
    Left = 408
    Top = 64
    Width = 177
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
    TabOrder = 5
  end
end
