unit uInfo;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
    TFormInfo = class(TForm)
        Memo1: TMemo;
        procedure FormCreate(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    FormInfo: TFormInfo;

implementation

{$R *.dfm}

procedure TFormInfo.FormCreate(Sender: TObject);
begin
    Memo1.Clear;
    Memo1.Lines.Add('������������� �������');
    Memo1.Lines.Add('...................');
    Memo1.Lines.Add
      ('����� ������ � ������� (����� ������� ���������� �����������) � �����, '
      + '������� ������������ ��� ������� ���������� ������ �������� �������������� '
      + '���������, ���������� �������� �������, ' +
      '���������� ��������� ������� � �������� ������ ��� ��������� ����� ' +
      '�������.');
end;

end.
