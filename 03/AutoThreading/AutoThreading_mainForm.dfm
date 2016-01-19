object ThreadingForm: TThreadingForm
  Left = 0
  Top = 0
  Caption = 'AutoThreading'
  ClientHeight = 312
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnAutoThread: TButton
    Left = 48
    Top = 56
    Width = 161
    Height = 25
    Caption = 'Automatic Thread'
    TabOrder = 0
    OnClick = btnAutoThreadClick
  end
  object btnPlain: TButton
    Left = 48
    Top = 17
    Width = 161
    Height = 25
    Caption = 'Plain Code'
    TabOrder = 1
    OnClick = btnPlainClick
  end
  object btnBlockingHttp: TButton
    Left = 240
    Top = 17
    Width = 161
    Height = 25
    Caption = 'Blocking Http'
    TabOrder = 2
    OnClick = btnBlockingHttpClick
  end
  object btnThreadedHttp: TButton
    Left = 240
    Top = 56
    Width = 161
    Height = 25
    Caption = 'Threaded Http'
    TabOrder = 3
    OnClick = btnThreadedHttpClick
  end
  object Memo1: TMemo
    Left = 48
    Top = 87
    Width = 353
    Height = 193
    TabOrder = 4
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 344
    Top = 112
  end
end
