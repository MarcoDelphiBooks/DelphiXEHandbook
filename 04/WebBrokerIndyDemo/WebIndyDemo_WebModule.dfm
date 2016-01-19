object WebModule16: TWebModule16
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/one'
      OnAction = WebModule16DefaultHandlerAction
    end
    item
      Name = 'WebActionItem1'
      PathInfo = '/two'
      Producer = PageProducer1
    end>
  Height = 230
  Width = 415
  object WebFileDispatcher1: TWebFileDispatcher
    WebFileExtensions = <
      item
        MimeType = 'text/css'
        Extensions = 'css'
      end
      item
        MimeType = 'text/html'
        Extensions = 'html;htm'
      end
      item
        MimeType = 'text/javascript'
        Extensions = 'js'
      end
      item
        MimeType = 'image/jpeg'
        Extensions = 'jpeg;jpg'
      end
      item
        MimeType = 'image/x-png'
        Extensions = 'png'
      end>
    WebDirectories = <
      item
        DirectoryAction = dirInclude
        DirectoryMask = '*'
      end
      item
        DirectoryAction = dirExclude
        DirectoryMask = '\templates\*'
      end>
    RootDirectory = '.'
    Left = 112
    Top = 80
  end
  object PageProducer1: TPageProducer
    HTMLFile = 'templates\Sample.html'
    OnHTMLTag = PageProducer1HTMLTag
    Left = 240
    Top = 80
  end
end
