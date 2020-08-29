unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    R:Word;
    G:Word;
    B:Word;
    RD:ShortInt;
    GD:ShortInt;
    BD:ShortInt;
    RM:Word;
    GM:Word;
    BM:Word;
    RMD:ShortInt;
    GMD:ShortInt;
    BMD:ShortInt;
    BackBuffer:TBitmap;
    Procedure Redraw;
    Procedure BlendDraw(Y:Word;Color:TColor);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Form1.Close
end;

Procedure Tform1.BlendDraw(Y:Word;Color:TColor);
 Var R,G,B:Byte;
Begin
BackBuffer.Canvas.Pen.Color:=RGB(GetRValue(Color)+GetRValue(BackBuffer.Canvas.Pixels[1,Y]),GetGValue(Color)+GetGValue(BackBuffer.Canvas.Pixels[1,Y]),GetBValue(Color)+GetBValue(BackBuffer.Canvas.Pixels[1,Y]));
BackBuffer.Canvas.MoveTo(0,Y);BackBuffer.Canvas.LineTo(Form1.Width,Y);
End;

Procedure TForm1.Redraw;
 Var Z:Byte;Cl:Word;X,Y:Word;CLL:TColor;
begin
BackBuffer.Width:=Width;
BackBuffer.Height:=Height;
BAckBuffer.Canvas.Brush.Color:=clBlack;
BackBuffer.Canvas.FillRect(rect(0,0,Width,Height));
{ X:=Random(Width);
 Y:=Random(Height);
 Z:=Random(256);
 CLL:=RGB(Z,Z,255);
 Canvas.Pixels[X,Y]:=Cll;
 Canvas.Pixels[X,Y+1]:=Cll;
 Canvas.Pixels[X,Y-1]:=Cll;
 Canvas.Pixels[X-1,Y]:=Cll;
 Canvas.Pixels[X+1,Y]:=Cll;
} Z:=1;
 BlendDraw(R,RGB(Cl,0,0));
 While Z<255 Do
  Begin
    Cl:=255-RM-Z;
    If Cl>255 Then Cl:=0;
    BlendDraw(R+Z,RGB(Cl,0,0));
    BlendDraw(R-Z,RGB(Cl,0,0));
    Inc(Z);
  End;
 Z:=1;
 BlendDraw(G,RGB(0,Cl,0));
 While Z<255 Do
  Begin
    Cl:=255-GM-Z;
    If Cl>255 Then Cl:=0;
    BlendDraw(G+Z,RGB(0,Cl,0));
    BlendDraw(G-Z,RGB(0,Cl,0));
    Inc(Z);
  End;
 Z:=1;
 BlendDraw(B,RGB(0,0,Cl));
 While Z<255 Do
  Begin
    Cl:=255-BM-Z;
    If Cl>255 Then Cl:=0;
    BlendDraw(B+Z,RGB(0,0,Cl));
    BlendDraw(B-Z,RGB(0,0,Cl));
    Inc(Z)
  End;
  Canvas.Draw(0,0,BackBuffer);
End;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
If R<=3 Then RD:=3;
If G<=3 Then GD:=3;
If B<=3 Then BD:=3;
If R>=Height Then RD:=-3;
If G>=Height Then GD:=-3;
If B>=Height Then BD:=-3;
If RM<=1 Then RMD:=1;
If GM<=1 Then GMD:=1;
If BM<=1 Then BMD:=1;
If RM>=254 Then RMD:=-1;
If GM>=254 Then GMD:=-1;
If BM>=254 Then BMD:=-1;
RM:=RM+RMD;
GM:=GM+GMD;
BM:=BM+BMD;
R:=R+RD;
G:=G+GD;
B:=B+BD;
Redraw
end;

procedure TForm1.FormShow(Sender: TObject);
begin
BackBuffer:=TBitmap.Create;
Randomize;
RM:=Random(256);
GM:=Random(256);
BM:=Random(256);
RMD:=1;
GMD:=1;
BMD:=1;
R:=Random(Form1.Height);
G:=Random(Form1.Height);
B:=Random(Form1.Height);
RD:=Random(2);
If RD=0 Then RD:=-3 Else RD:=3;
GD:=Random(2);
If GD=0 Then GD:=-3 Else GD:=3;
BD:=Random(2);
If BD=0 Then BD:=-3 Else BD:=3;
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Form1.Close
end;

end.
