unit uCalc;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, StrUtils, System.Types,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
    TMatrix = array of array of double;
    TArrayDouble = array of double;

    TFormCalc = class(TForm)
        Memo1: TMemo;
        Button1: TButton;
        Label1: TLabel;
        Label2: TLabel;
        Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
        procedure Button1Click(Sender: TObject);
        function GaussianElimination(var A: TMatrix; var B: TArrayDouble;
          N: Integer): TArrayDouble;
        function get_TMatrix(memo_lines: TMemo): TMatrix;
        function get_TArrayDouble(edit : Tedit):TArrayDouble;
        function StrToFloatMod(value: string): real;
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    FormCalc: TFormCalc;

implementation

{$R *.dfm}

// ���������, ����������� ����� ������
function TFormCalc.GaussianElimination(var A: TMatrix; var B: TArrayDouble;
  N: Integer): TArrayDouble;

var
    i, j, k: Integer;
    factor: real;
begin
    setlength(result, N);
    // ���������� ������� � ������������ ����
    for i := 0 to N - 2 do
        for j := i + 1 to N - 1 do
        begin
            factor := A[j, i] / A[i, i];
            for k := i to N - 1 do
                A[j, k] := A[j, k] - factor * A[i, k];
            B[j] := B[j] - factor * B[i];
        end;

    // �������� ��� ��� ���������� �������
    for i := N - 1 downto 0 do
    begin
        result[i] := B[i];
        for j := i + 1 to N - 1 do
            result[i] := result[i] - A[i, j] * result[j];
        result[i] := result[i] / A[i, i];
    end;
end;

procedure TFormCalc.Button1Click(Sender: TObject);
var
    Matrix: TMatrix;
    R_Array: TArrayDouble;
    Res: TArrayDouble;
    i:real;
begin
    Matrix := get_TMatrix(self.Memo1);
    R_Array := get_TArrayDouble(self.Edit1);
    Res := GaussianElimination(Matrix, R_Array, length(Matrix));
    edit2.Text:='';
    //������� ���������
    for I in Res do edit2.Text:=edit2.Text+' '+FloatToStr(i);

end;

function TFormCalc.get_TMatrix(memo_lines: TMemo): TMatrix;
var
    i: Integer;
    str_line: string;
    arr_list: TStringDynArray;
begin
    i := 0;
    setlength(result, 0);
    for str_line in memo_lines.Lines do
    begin
        setlength(result, length(result) + 1);
        arr_list := SplitString(str_line, ' ');
        setlength(result[length(result) - 1], length(arr_list));
        for i := 0 to length(arr_list) - 1 do
            result[length(result) - 1][i] := StrToFloatMod(arr_list[i]);
    end;

end;

function TFormCalc.get_TArrayDouble(edit : Tedit):TArrayDouble;
var
i:integer;
arr_list: TStringDynArray;
begin
    arr_list := SplitString(edit.Text, ' ');
    setlength(result, length(arr_list));
    for I := 0 to length(arr_list) - 1 do
    result[i]:=StrToFloatMod(arr_list[i]);
end;

function TFormCalc.StrToFloatMod(value: string): real;
begin
    try
        result := StrToFloat(StringReplace(value, '.', ',',
          [rfReplaceAll, rfIgnoreCase]));
        exit;
    except
        result := StrToFloat(StringReplace(value, '.', ',',
          [rfReplaceAll, rfIgnoreCase]));
        exit;
        result := StrToFloat(StringReplace(value, ',', '.',
          [rfReplaceAll, rfIgnoreCase]));
        exit;
    end;
end;

end.
