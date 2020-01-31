object UniMainModule: TUniMainModule
  OldCreateOrder = False
  OnCreate = UniGUIMainModuleCreate
  OnDestroy = UniGUIMainModuleDestroy
  Theme = 'triton'
  MonitoredKeys.Keys = <>
  Height = 659
  Width = 786
  object q_menu: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from menu order by bh')
    Left = 40
    Top = 88
  end
  object objMgr: TAureliusManager
    Connection = AureliusConnection1
    Left = 616
    Top = 528
  end
  object MenuItems_menu: TUniMenuItems
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 80
    Top = 520
  end
  object FSTheme: TUniFSTheme
    Style = Vulkan
    Enabled = True
    Left = 64
    Top = 360
  end
  object utm_imagelist: TUniNativeImageList
    Left = 64
    Top = 264
    Images = {
      1100000000000000060B0000006E617669636F6E3B66613B00000000060B0000
      006465736B746F703B66613B00000000060C000000656E76656C6F70653B6661
      3B000000000608000000757365723B66613B00000000060E0000006C696E652D
      63686172743B66613B00000000061000000077696E646F772D636C6F73653B66
      613B000000000608000000736176653B66613B00000000060800000065646974
      3B66613B0000000006070000006375743B66613B00000000060D000000626172
      2D63686172743B66613B00000000060D0000007069652D63686172743B66613B
      00000000060C000000626F6F6B6D61726B3B66613B00000000060C0000006361
      6C656E6461723B66613B000000000608000000666565643B66613B0000000006
      070000006661783B66613B000000000609000000696D6167653B66613B000000
      000609000000696E626F783B66613B}
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=yfkj'
      'User_Name=root'
      'Password=123456'
      'CharacterSet=gbk'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 88
    Top = 32
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'D:\work\menu\lib\lib32\libmariadb.dll'
    Left = 72
    Top = 168
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 472
    Top = 80
  end
  object AureliusConnection1: TAureliusConnection
    AdapterName = 'FireDac'
    AdaptedConnection = FDConnection1
    SQLDialect = 'MySQL'
    Left = 608
    Top = 400
  end
  object q_search: TFDQuery
    Connection = FDConnection1
    Left = 136
    Top = 88
  end
end
