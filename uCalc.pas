unit uCalc;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
    TFormCalc = class(TForm)
        Memo1: TMemo;
        Button1: TButton;
    Label1: TLabel;
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    FormCalc: TFormCalc;

implementation

{$R *.dfm}

end.
