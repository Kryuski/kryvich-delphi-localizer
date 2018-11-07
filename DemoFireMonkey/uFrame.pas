unit uFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox, FMX.ScrollBox, FMX.Memo;

type
  TFrame1 = class(TFrame)
    gbInFrame: TGroupBox;
    lbInFrame: TListBox;
    mmInFrame: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
