(*
  FireMonkey Test Project for the Kryvich's Delphi Localizer.
  Copyright (C) 2018 Kryvich, Belarusian Linguistic Software team.
*)

unit uTest;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls, System.Rtti,
  FMX.Grid.Style, Data.DB, FMX.Grid, Datasnap.DBClient, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Layouts, FMX.ListBox, FMX.Objects, FMX.Menus,
  System.Actions, FMX.ActnList, KDL.Localizer, uFrame;

{$IF KDL_PLATFORM <> 'FMX'}
  {$Message Fatal 'K.D.L. compiled for a platform other than FMX. You need to rebuild the application'}
{$IFEND}

const
  EnglishFile = 'testapp.english.lng';
  BelarusianFile = 'testapp.belarusian.lng';
  RussianFile = 'testapp.russian.lng';

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnStrings: TButton;
    btnNewForm: TButton;
    Grid1: TGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1ID: TIntegerField;
    ClientDataSet1OrderNo: TStringField;
    ClientDataSet1Name: TStringField;
    ClientDataSet1Description: TStringField;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    cbAutoTranslation: TCheckBox;
    ListBox1: TListBox;
    pnlLanguage: TPanel;
    btnLoad: TButton;
    rgLanguage: TGroupBox;
    btnTranslate: TButton;
    btnTranslateAll: TButton;
    rbEnglish: TRadioButton;
    rbBelarusian: TRadioButton;
    rbRussian: TRadioButton;
    btnQuit: TButton;
    Text1: TText;
    ActionList1: TActionList;
    actOpen: TAction;
    actQuit: TAction;
    actMessageFromDLL: TAction;
    actShowFormFromPackage: TAction;
    OpenDialog1: TOpenDialog;
    Frame11: TFrame1;
    MenuBar1: TMenuBar;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    procedure actQuitExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actMessageFromDLLExecute(Sender: TObject);
    procedure actShowFormFromPackageExecute(Sender: TObject);
    procedure btnStringsClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnTranslateClick(Sender: TObject);
    procedure btnTranslateAllClick(Sender: TObject);
    procedure cbAutoTranslationChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

uses
  Winapi.Windows;

{$R *.fmx}

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
end;

procedure TForm1.btnTranslateClick(Sender: TObject);
begin
  FreeLocalizer.Translate(Self);
  Grid1.Repaint;
end;

procedure TForm1.cbAutoTranslationChange(Sender: TObject);
begin
  FreeLocalizer.AutoTranslate := cbAutoTranslation.IsChecked;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(OldAfterLanguageLoad) then
    FreeLocalizer.AfterLanguageLoad := OldAfterLanguageLoad;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  OldAfterLanguageLoad := FreeLocalizer.AfterLanguageLoad;
  FreeLocalizer.AfterLanguageLoad := MyAfterLanguageLoad;
  UpdateFormState;
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
      rbEnglish.IsChecked := True
    else if LanguageFile = BelarusianFile then
      rbBelarusian.IsChecked := True
    else
      rbRussian.IsChecked := True;
    cbAutoTranslation.IsChecked := AutoTranslate;
  end;
  Grid1.Repaint;
end;

procedure TForm1.btnTranslateAllClick(Sender: TObject);
begin
  FreeLocalizer.TranslateScreen;
end;

procedure TForm1.btnLoadClick(Sender: TObject);
begin
  if rbEnglish.IsChecked then
    FreeLocalizer.LanguageFile := EnglishFile
  else if rbBelarusian.IsChecked then
    FreeLocalizer.LanguageFile := BelarusianFile
  else
    FreeLocalizer.LanguageFile := RussianFile;
end;

procedure TForm1.actQuitExecute(Sender: TObject);
begin
  Close;
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

procedure ShowDllMessage; external '..\Demo\testdll.dll';
procedure SetLanguageFileForDll(const s: pchar); external '..\Demo\testdll.dll';

procedure TForm1.actMessageFromDLLExecute(Sender: TObject);
var
  s: string;
begin
  // Set current language file for DLL
  s := FreeLocalizer.LanguageFile;
  s := '..\Demo\' + StringReplace(s, 'testapp', 'testdll', []);
  // testapp.english.lng --> testdll.english.lng
  SetLanguageFileForDll(pchar(s));

  ShowDllMessage;
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
  hm := LoadPackage(ExtractFilePath(ParamStr(0)) + '..\Demo\TestPackage.bpl');
  if hm <> 0 then
    try
      @setlang := GetProcAddress(hm, 'SetLanguageFileForPackage');
      if Assigned(setlang) then begin
        // Set current language file for package
        s := FreeLocalizer.LanguageFile;
        s := '..\Demo\' + StringReplace(s, 'testapp', 'testpackage', []);
        // testapp.english.lng --> testpackage.english.lng
        setlang(s);

        @showfrm := GetProcAddress(hm, 'ShowFormInPackage');
        if Assigned(showfrm) then
          showfrm(Self)
        else
          ShowMessage('Execute routine not found!');

      end else
        ShowMessage('SetLanguageFileForPackage routine not found!');
    finally
      UnloadPackage(hm);
    end
  else
    ShowMessage('Package not found!');
end;

end.
