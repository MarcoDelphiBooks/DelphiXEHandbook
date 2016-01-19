object FormIntercept: TFormIntercept
  Left = 0
  Top = 0
  Caption = 'InterceptBaseClass'
  ClientHeight = 471
  ClientWidth = 568
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    568
    471)
  PixelsPerInch = 96
  TextHeight = 13
  object btnUse: TButton
    Left = 24
    Top = 24
    Width = 105
    Height = 25
    Caption = 'btnUse'
    TabOrder = 0
    OnClick = btnUseClick
  end
  object btnIntercept: TButton
    Left = 24
    Top = 60
    Width = 105
    Height = 25
    Caption = 'btnIntercept'
    TabOrder = 1
    OnClick = btnInterceptClick
  end
  object btnDisconnect: TButton
    Left = 24
    Top = 96
    Width = 105
    Height = 25
    Caption = 'btnDisconnect'
    TabOrder = 2
    OnClick = btnDisconnectClick
  end
  object Memo1: TMemo
    Left = 152
    Top = 24
    Width = 393
    Height = 409
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
  end
end
