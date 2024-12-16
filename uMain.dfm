object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 40
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 121
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 40
    Top = 128
    Width = 553
    Height = 281
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=MySQL')
    Left = 304
    Top = 224
  end
end
