object Form1: TForm1
  Left = 192
  Top = 114
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 506
  ClientWidth = 775
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnKeyDown = FormKeyDown
  OnMouseDown = FormMouseDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
  end
end
