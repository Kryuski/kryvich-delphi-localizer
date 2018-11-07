unit uFormInPackage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmInPackage = class(TForm)
    btnClose: TButton;
    txtMessage: TStaticText;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInPackage: TfrmInPackage;

implementation

uses KDL.Localizer;

{$IF KDL_PLATFORM <> 'VCL'}
  {$Message Fatal 'K.D.L. compiled for a platform other than VCL. You need to rebuild the application'}
{$IFEND}

{$R *.dfm}

resourcestring
  rsStrInPackage = '√эты радок змешчаны Ґ пакеце';

procedure TfrmInPackage.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInPackage.FormShow(Sender: TObject);
begin
  txtMessage.Caption := rsStrInPackage;
end;

procedure ShowFormInPackage(Owner: TCustomForm);
begin
  frmInPackage := TfrmInPackage.Create(Owner);
  try
    frmInPackage.ShowModal;
  finally
    frmInPackage.Free;
  end;
end;

procedure SetLanguageFileForPackage(const s: string);
begin
  FreeLocalizer.LanguageFile := s;
end;

exports
  ShowFormInPackage,
  SetLanguageFileForPackage;

begin
  FreeLocalizer.ErrorProcessing := epMessage;
  FreeLocalizer.AutoTranslate := True;
end.
