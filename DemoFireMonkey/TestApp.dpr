program TestApp;

uses
  System.StartUpCopy,
  FMX.Forms,
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
