library TestDLL;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  Dialogs,
  KDL.Detours in '..\KDL.Detours.pas',
  KDL.Localizer in '..\KDL.Localizer.pas',
  KDL.StringUtils in '..\KDL.StringUtils.pas';

{$IF KDL_PLATFORM <> 'NOGUI'}
  {$Message Fatal 'K.D.L. compiled for a platform other than NOGUI. You need to rebuild the application'}
{$IFEND}

{$R *.res}

resourcestring
  rsStrInDll = '√эты радок змешчаны Ґ DLL';

procedure ShowDllMessage;
begin
  ShowMessage(rsStrInDll);
end;

procedure SetLanguageFileForDll(const s: pchar);
begin
  FreeLocalizer.LanguageFile := s;
end;

exports
  ShowDllMessage,
  SetLanguageFileForDll;

begin
  FreeLocalizer.ErrorProcessing := epException;
  FreeLocalizer.AutoTranslate := True;
end.
