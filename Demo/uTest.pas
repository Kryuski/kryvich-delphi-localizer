(*
  Test Project for the Kryvich's Delphi Localizer.
  Copyright (C) 2006 - 2018 Kryvich, Belarusian Linguistic Software team.
*)

unit uTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBClient, Grids, DBGrids, ActnList, Menus,
  ComCtrls, KDL.Localizer, uFrame, System.Actions;

{$IF KDL_PLATFORM <> 'VCL'}
  {$Message Fatal 'K.D.L. compiled for a platform other than VCL. You need to rebuild the application'}
{$IFEND}

const
{$IFDEF WIN32}
  EnglishFile = 'testapp.english.lng';
  BelarusianFile = 'testapp.belarusian.lng';
  RussianFile = 'testapp.russian.lng';
{$ELSE}
  EnglishFile = 'testapp64.english.lng';
  BelarusianFile = 'testapp64.belarusian.lng';
  RussianFile = 'testapp64.russian.lng';
{$ENDIF}

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnStrings: TButton;
    btnNewForm: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1ID: TIntegerField;
    ClientDataSet1OrderNo: TStringField;
    ClientDataSet1Name: TStringField;
    ClientDataSet1Description: TStringField;
    cbAutoTranslation: TCheckBox;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ActionList1: TActionList;
    actOpen: TAction;
    actQuit: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    ListView1: TListView;
    pnlLanguage: TPanel;
    btnLoad: TButton;
    rgLanguage: TRadioGroup;
    btnQuit: TButton;
    btnTranslate: TButton;
    btnTranslateAll: TButton;
    OpenDialog1: TOpenDialog;
    Frame11: TFrame1;
    StaticText1: TStaticText;
    N8: TMenuItem;
    actCallImplicitlyLinkedDLL: TAction;
    DLL1: TMenuItem;
    actShowFormFromPackage: TAction;
    N9: TMenuItem;
    actCallExplicitlyLinkedDLL: TAction;
    DLL2: TMenuItem;
    procedure btnStringsClick(Sender: TObject);
    procedure cbAutoTranslationClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure actQuitExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actOpenExecute(Sender: TObject);
    procedure btnTranslateClick(Sender: TObject);
    procedure btnTranslateAllClick(Sender: TObject);
    procedure actCallImplicitlyLinkedDLLExecute(Sender: TObject);
    procedure actShowFormFromPackageExecute(Sender: TObject);
    procedure actCallExplicitlyLinkedDLLExecute(Sender: TObject);
  private
    { Private declarations }
    OldAfterLanguageLoad: TAfterLanguageLoadEvent;

    procedure UpdateFormState;
    procedure MyAfterLanguageLoad(Sender: TObject; const LanguageFile: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

resourcestring
  Str1 = #13#10'Прывітанне, свет!';     // Try to edit these resource strings,
  Str2 = ''''#13#10'Прывітанне, свет!'; // then makelng and updatelng.
  Str3 = '''Прывітанне, свет!';         // You'll see how String Versioning System
  Str4 = 'Прывітанне, свет!''';         // will catch the modifications
  Str5 = 'Прывітанне, свет!'#13#10'';
  Str6 = 'Прывітанне, '#13#10'свет!';
  Str7 = 'Прывітанне, '''#13#10'свет!';
  IdInNativeLangНовыРадок = 'Радок з ідэнтыфікатарам на беларускай мове';

procedure TForm1.btnStringsClick(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(Str1);
  Memo1.Lines.Add(Str2);
  Memo1.Lines.Add(Str3);
  Memo1.Lines.Add(Str4);
  Memo1.Lines.Add(Str5);
  Memo1.Lines.Add(Str6);
  Memo1.Lines.Add(Str7);
  Memo1.Lines.Add(IdInNativeLangНовыРадок);

  ListView1.Repaint;
end;

procedure TForm1.btnLoadClick(Sender: TObject);
begin
  case rgLanguage.ItemIndex of
    0: FreeLocalizer.LanguageFile := EnglishFile;
    1: FreeLocalizer.LanguageFile := BelarusianFile;
    2: FreeLocalizer.LanguageFile := RussianFile;
  end;
end;

procedure TForm1.btnTranslateClick(Sender: TObject);
begin
  FreeLocalizer.Translate(Self);
  DBGrid1.Repaint;
end;

procedure TForm1.btnTranslateAllClick(Sender: TObject);
begin
  FreeLocalizer.TranslateScreen;
end;

procedure TForm1.cbAutoTranslationClick(Sender: TObject);
begin
  FreeLocalizer.AutoTranslate := cbAutoTranslation.Checked;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  OldAfterLanguageLoad := FreeLocalizer.AfterLanguageLoad;
  FreeLocalizer.AfterLanguageLoad := MyAfterLanguageLoad;
  UpdateFormState;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(OldAfterLanguageLoad) then
    FreeLocalizer.AfterLanguageLoad := OldAfterLanguageLoad;
end;

procedure TForm1.MyAfterLanguageLoad(Sender: TObject;
  const LanguageFile: string);
begin
  if Assigned(OldAfterLanguageLoad) then
    OldAfterLanguageLoad(Sender, LanguageFile);

  UpdateFormState;
end;

procedure TForm1.UpdateFormState;
begin
  with FreeLocalizer do begin
    if LanguageFile = EnglishFile then
      rgLanguage.ItemIndex := 0
    else if LanguageFile = BelarusianFile then
      rgLanguage.ItemIndex := 1
    else
      rgLanguage.ItemIndex := 2;
    cbAutoTranslation.Checked := AutoTranslate;
  end;
  DBGrid1.Repaint;
end;

procedure TForm1.actOpenExecute(Sender: TObject);
var
  f: TForm1;
begin
  f := TForm1.Create(Self);
  try
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure ShowDllMessage; external
  {$IFDEF WIN32} 'testdll.dll' {$ELSE} 'testdll64.dll' {$ENDIF};
procedure SetLanguageFileForDll(const s: PChar); external
  {$IFDEF WIN32} 'testdll.dll' {$ELSE} 'testdll64.dll' {$ENDIF};

procedure TForm1.actCallImplicitlyLinkedDLLExecute(Sender: TObject);
var
  s: string;
begin
  // Set current language file for DLL
  s := FreeLocalizer.LanguageFile;
  s := StringReplace(s, 'testapp', 'testdll', [rfIgnoreCase]);
  // testapp.english.lng --> testdll.english.lng
  SetLanguageFileForDll(PChar(s));
  ShowDllMessage;
end;

procedure TForm1.actCallExplicitlyLinkedDLLExecute(Sender: TObject);
var
  hm: HModule;
  setlang: procedure(const s: PChar);
  showmess: procedure;
  s: string;
begin
  hm := LoadLibrary(PChar(ChangeFileExt(StringReplace(LowerCase(ParamStr(0)),
    'testapp', 'testdll', [rfIgnoreCase]), '.dll')));
  if hm <> 0 then
    try
      @setlang := GetProcAddress(hm, 'SetLanguageFileForDll');
      if Assigned(setlang) then begin
        // Set current language file for DLL
        s := FreeLocalizer.LanguageFile;
        s := StringReplace(s, 'testapp', 'testdll', [rfIgnoreCase]);
        // testapp.english.lng --> testdll.english.lng
        setlang(PChar(s));
        @showmess := GetProcAddress(hm, 'ShowDllMessage');
        if Assigned(showmess) then
          showmess
        else
          ShowMessage('Procedure ShowDllMessage not found!');
      end else
        ShowMessage('Procedure SetLanguageFileForDLL not found!');
    finally
      FreeLibrary(hm);
    end
  else
    ShowMessage('Package not found!');
end;

procedure TForm1.actQuitExecute(Sender: TObject);
begin
  Close;
end;

procedure TForm1.actShowFormFromPackageExecute(Sender: TObject);
// Load a package dynamically and show a form
// Thanks Zarko Gajic for info
// http://delphi.about.com/b/2005/02/05/using-packages-in-delphi.htm
var
  hm: HModule;
  showfrm: procedure(Owner: TCustomForm);
  setlang: procedure(const s: string);
  s: string;
begin
  hm := LoadPackage(ChangeFileExt(StringReplace(LowerCase(ParamStr(0)),
    'testapp', 'testpackage', [rfIgnoreCase]), '.bpl'));
  if hm <> 0 then
    try
      @setlang := GetProcAddress(hm, 'SetLanguageFileForPackage');
      if Assigned(setlang) then begin
        // Set current language file for package
        s := FreeLocalizer.LanguageFile;
        s := StringReplace(s, 'testapp', 'testpackage', [rfIgnoreCase]);
        // testapp.english.lng --> testpackage.english.lng
        setlang(s);
        @showfrm := GetProcAddress(hm, 'ShowFormInPackage');
        if Assigned(showfrm) then
          showfrm(Self)
        else
          ShowMessage('Procedure ShowFormInPackage not found!');
      end else
        ShowMessage('Procedure SetLanguageFileForPackage not found!');
    finally
      UnloadPackage(hm);
    end
  else
    ShowMessage('Package not found!');
end;

end.
