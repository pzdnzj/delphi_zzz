object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 788
  ClientWidth = 1076
  Caption = 'MainForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniToolBar1: TUniToolBar
    Left = 0
    Top = 0
    Width = 1076
    Height = 32
    Hint = ''
    ButtonHeight = 28
    ButtonWidth = 44
    Images = UniMainModule.utm_imagelist
    TabOrder = 0
    ParentColor = False
    Color = clBtnFace
    object UniToolButton1: TUniToolButton
      Left = 0
      Top = 0
      Hint = ''
      ImageIndex = 0
      Caption = 'UniToolButton1'
      TabOrder = 1
      OnClick = UniToolButton1Click
    end
    object UniToolButton2: TUniToolButton
      Left = 44
      Top = 0
      Width = 8
      Hint = ''
      Style = tbsSeparator
      Caption = 'UniToolButton2'
      TabOrder = 2
    end
    object UniToolButton3: TUniToolButton
      Left = 52
      Top = 0
      Hint = ''
      ImageIndex = 14
      Caption = 'UniToolButton3'
      TabOrder = 3
    end
    object UniToolButton4: TUniToolButton
      Left = 96
      Top = 0
      Hint = ''
      ImageIndex = 13
      Caption = 'UniToolButton4'
      TabOrder = 4
    end
    object UniToolButton5: TUniToolButton
      Left = 140
      Top = 0
      Width = 8
      Hint = ''
      Style = tbsSeparator
      Caption = 'UniToolButton5'
      TabOrder = 5
    end
    object UniToolButton6: TUniToolButton
      Left = 148
      Top = 0
      Hint = ''
      ImageIndex = 12
      Caption = 'UniToolButton6'
      TabOrder = 6
    end
    object UniToolButton7: TUniToolButton
      Left = 192
      Top = 0
      Hint = ''
      ImageIndex = 11
      Caption = 'UniToolButton7'
      TabOrder = 7
    end
    object UniToolButton8: TUniToolButton
      Left = 236
      Top = 0
      Hint = ''
      ImageIndex = 16
      Caption = 'UniToolButton8'
      TabOrder = 8
    end
    object UniToolButton9: TUniToolButton
      Left = 280
      Top = 0
      Hint = ''
      ImageIndex = 15
      Caption = 'UniToolButton9'
      TabOrder = 9
    end
    object UniToolButton10: TUniToolButton
      Left = 324
      Top = 0
      Width = 8
      Hint = ''
      Style = tbsSeparator
      Caption = 'UniToolButton10'
      TabOrder = 10
    end
  end
  object utm: TUniTreeMenu
    Left = 0
    Top = 32
    Width = 200
    Height = 756
    Hint = ''
    ClientEvents.UniEvents.Strings = (
      
        'treeMenu.afterCreate=function treeMenu.afterCreate(sender)'#13#10'{'#13#10' ' +
        '  sender.el.setStyle('#39'overflow-y'#39', '#39'auto'#39');'#13#10'}')
    Items.FontData = {0100000000}
    Images = UniMainModule.utm_imagelist
    SourceMenu = UniMainModule.MenuItems_menu
    ExpanderOnly = False
    OnSelectionChange = utmSelectionChange
  end
  object UniPanel1: TUniPanel
    Left = 200
    Top = 32
    Width = 7
    Height = 756
    Hint = ''
    Align = alLeft
    TabOrder = 2
    BorderStyle = ubsNone
    Caption = ''
  end
  object UniPanel2: TUniPanel
    Left = 207
    Top = 32
    Width = 860
    Height = 756
    Hint = ''
    Align = alClient
    TabOrder = 3
    Caption = 'UniPanel2'
    object upg: TUniPageControl
      Left = 1
      Top = 41
      Width = 858
      Height = 714
      Hint = ''
      ActivePage = UniTabSheet1
      Images = UniMainModule.utm_imagelist
      Align = alClient
      TabOrder = 1
      OnChange = upgChange
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = #39318#39029
      end
    end
    object UniPanel3: TUniPanel
      Left = 1
      Top = 1
      Width = 858
      Height = 40
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      DesignSize = (
        858
        40)
      object UniButton1: TUniButton
        Left = 5
        Top = 3
        Width = 44
        Height = 34
        Hint = ''
        Caption = ''
        TabOrder = 1
        Images = UniMainModule.utm_imagelist
        ImageIndex = 0
        OnClick = UniButton1Click
      end
      object UniMenuButton1: TUniMenuButton
        Left = 735
        Top = 5
        Width = 101
        Height = 32
        Hint = ''
        DropdownMenu = userPopupMenu
        Caption = #31649#29702#21592
        Anchors = [akTop, akRight]
        TabOrder = 2
        Images = UniMainModule.utm_imagelist
        ImageIndex = 6
      end
    end
  end
  object UniPanel4: TUniPanel
    Left = 1067
    Top = 32
    Width = 9
    Height = 756
    Hint = ''
    Align = alRight
    TabOrder = 4
    BorderStyle = ubsNone
    Caption = ''
  end
  object userPopupMenu: TUniPopupMenu
    Images = UniMainModule.utm_imagelist
    Left = 986
    Top = 113
    object a1: TUniMenuItem
      Caption = 'a'
      ImageIndex = 1
      OnClick = a1Click
    end
    object b1: TUniMenuItem
      Caption = 'b'
      ImageIndex = 2
    end
  end
end
