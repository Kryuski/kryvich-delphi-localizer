{$A8,B-,C-,D-,E-,F-,G+,H+,I+,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}

program TestApp64;

uses
  Forms,
  uTest in 'uTest.pas' {Form1},
  uFrame in 'uFrame.pas' {Frame1: TFrame},
  KDL.Detours in '..\KDL.Detours.pas',
  KDL.Localizer in '..\KDL.Localizer.pas',
  KDL.StringUtils in '..\KDL.StringUtils.pas';

{$R *.res}

begin
  Application.Initialize;

  FreeLocalizer.ErrorProcessing := epMessage;
  FreeLocalizer.AutoTranslate := True;
  FreeLocalizer.LanguageFile := EnglishFile;

  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
