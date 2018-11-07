unit uFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls;

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

{$R *.dfm}

end.

