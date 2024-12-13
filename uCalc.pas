unit uCalc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Math, Vcl.Graphics, StrUtils, System.Types,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMatrix = array of array of double;
  TArrayDouble = array of double;

type
  data_matrix = record
    Matrix: TMatrix;
    ArrayDouble: TArrayDouble;
  end;

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
    function get_TArrayDouble(edit: TEdit): TArrayDouble;
    function StrToFloatMod(value: string): real;
    function MatrixCalc(Matrix: TMatrix; ArrDouble: TArrayDouble): TArrayDouble;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCalc: TFormCalc;

implementation

{$R *.dfm}

// Процедура, реализующая метод Гаусса
function TFormCalc.GaussianElimination(var A: TMatrix; var B: TArrayDouble;
  N: Integer): TArrayDouble;

var
  i, j, k: Integer;
  factor: real;
begin
  setlength(result, N);
  // Приведение матрицы к треугольному виду
  for i := 0 to N - 2 do
    for j := i + 1 to N - 1 do
    begin
      factor := A[j, i] / A[i, i];
      for k := i to N - 1 do
        A[j, k] := A[j, k] - factor * A[i, k];
      B[j] := B[j] - factor * B[i];
    end;

  // Обратный ход для нахождения решения
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
  i: real;
begin
  Matrix := get_TMatrix(self.Memo1);
  R_Array := get_TArrayDouble(self.Edit1);
  try
    Res := MatrixCalc(Matrix, R_Array);
  except
    Res := GaussianElimination(Matrix, R_Array, length(Matrix));
  end;
  // Res := GaussianElimination(matrix, R_Array, length(matrix));
  Edit2.Text := '';
  // выводим результат
  for i in Res do
    Edit2.Text := Edit2.Text + ' ' + FloatToStr(i);

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

function TFormCalc.get_TArrayDouble(edit: TEdit): TArrayDouble;
var
  i: Integer;
  arr_list: TStringDynArray;
begin
  arr_list := SplitString(edit.Text, ' ');
  setlength(result, length(arr_list));
  for i := 0 to length(arr_list) - 1 do
    result[i] := StrToFloatMod(arr_list[i]);
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

function swap_line_matrix(Matrix: TMatrix; row1: Integer; row2: Integer;
  R_line: TArrayDouble): data_matrix;
var
  tmp: double;
  i: Integer;
begin
  for i := 0 to length(Matrix[0]) - 1 do
  begin
    tmp := Matrix[row1][i];
    Matrix[row1][i] := Matrix[row2][i];
    Matrix[row2][i] := tmp;
  end;
  tmp := R_line[row1];
  R_line[row1] := R_line[row2];
  R_line[row2] := tmp;
  result.Matrix := Matrix;
  result.ArrayDouble := R_line;
end;

function MinLineToTop(Matrix: TMatrix; ArrDouble: TArrayDouble): data_matrix;
var
  i: Integer;
  flag_swap: boolean;
  ret: data_matrix;
begin
  while True do
  begin
    flag_swap := False;
    for i := 0 to length(Matrix) - 2 do
    begin
      if Matrix[i][0] > Matrix[i + 1][0] then
      begin
        ret := swap_line_matrix(Matrix, i, i + 1, ArrDouble);
        Matrix := ret.Matrix;
        ArrDouble := ret.ArrayDouble;
        flag_swap := True;
      end;

    end;
    if not flag_swap then
      break;

  end;
  result.Matrix := Matrix;
  result.ArrayDouble := ArrDouble;
end;

// -----------------------------
function Triangularize(Matrix: TMatrix; B: TArrayDouble): data_matrix;
var
  i, j, k: Integer;
  factor: double;

begin
  for i := Low(Matrix) to High(Matrix) - 1 do
  begin
    for j := i + 1 to High(Matrix) do
    begin
      factor := Matrix[j][i] / Matrix[i][i];

      for k := i to High(Matrix) do
      begin
        Matrix[j][k] := Matrix[j][k] - factor * Matrix[i][k];
        B[j] := B[j] - factor * B[i];
        // Добавляем умножение на factor к правой части СЛАУ
      end;
    end;
  end;

  result.Matrix := Matrix;
  result.ArrayDouble := B;
end;

// вычисляем определитель основной матрицы
function Determinant(Matrix: TMatrix): double;
var
  i, T: Integer;
  index_x, index_y: Integer;
  mul_positiv_array: real;
  sum_mul_positiv_array: real;
  mul_neg_array: real;
  sum_mul_neg_array: real;
  neg_arr: array of real;
begin
  result := 0;
  if length(Matrix) = 0 then
    exit;
  if (length(Matrix) <> length(Matrix[0])) then
    exit;
  // setlength(array_tmp_pos, 0);
  // setlength(array_tmp_neg, 0);
  sum_mul_positiv_array := 0;
  sum_mul_neg_array := 0;
  // цикл по матрице  по столбцам
  for i := 0 to length(Matrix) - 1 do
  begin
    mul_positiv_array := 1;
    mul_neg_array := 1;
    setlength(neg_arr, 0);
    // цикл по cтрокам
    for T := 0 to length(Matrix[i]) - 1 do
    begin
      // движение должно быть по строкам со смещением индекса столбца
      // строка всегда идёт от нуля до конца строки массива
      // индекс стоблца всегда смещается на 1 вправо
      // можем записать [строка, строка + столбец]
      // index_x строка + столбец
      index_x := T;
      index_y := T + i;
      // теперь, если у нас индекс столбца уходит за пределы, нужно перевести его на начало
      if (index_y > length(Matrix[i]) - 1) then
        index_y := index_y - length(Matrix[i]);
      // забираем число из матрицы и записываем в массив
      mul_positiv_array := mul_positiv_array * Matrix[index_x, index_y];

      // здесь собираем отрицательные значения
      index_y := length(Matrix[i]) - 1 - index_y;
      mul_neg_array := mul_neg_array * Matrix[index_x, index_y];
      // [0,0] [1,1] [2,2]
      // [0,1] [1,2] [2,0]
      // [0,2] [1,0] [2,1]

    end;
    sum_mul_positiv_array := sum_mul_positiv_array + mul_positiv_array -
      mul_neg_array;
  end;
  result := sum_mul_positiv_array;
end;

// Функция для получения миноров матрицы
function Minor(Matrix: TMatrix; row, col: Integer): double;
var
  Minor: TMatrix;
  i, j, k, l: Integer;
begin
  setlength(Minor, 2);
  for i := 0 to 2 do
    if i <> row then
    begin
      k := i;
      if i > row then
        Dec(k);
      setlength(Minor[k], 2);
      for j := 0 to 2 do
        if j <> col then
        begin
          l := j;
          if j > col then
            Dec(l);
          Minor[k][l] := Matrix[i][j];
        end;
    end;
  result := Minor[0][0] * Minor[1][1] - Minor[0][1] * Minor[1][0];
end;

// Функция для получения алгебраического дополнения элемента матрицы
function Cofactor(Matrix: TMatrix; row, col: Integer): double;
begin
  result := Power(-1, row + col) * Minor(Matrix, row, col);
end;

// Функция для получения присоединённой матрицы
function Adjugate(Matrix: TMatrix): TMatrix;
var
  Adjugate: TMatrix;
  i, j: Integer;
begin
  setlength(Adjugate, length(Matrix), length(Matrix[0]));
  for i := 0 to length(Matrix) - 1 do
    for j := 0 to length(Matrix[i]) - 1 do
      Adjugate[j][i] := Cofactor(Matrix, i, j); // Транспонирование
  result := Adjugate;
end;

// Функция для получения обратной матрицы
function Inverse(Matrix: TMatrix): TMatrix;
var
  det: double;
  invert: TMatrix;
  i, j: Integer;
begin
  det := Determinant(Matrix);
  if Abs(det) < 1E-9 then
    raise Exception.Create('Матрица необратима');
  invert := Adjugate(Matrix);
  for i := 0 to 2 do
    for j := 0 to 2 do
      invert[i][j] := invert[i][j] / det;
  result := invert;
end;

// Функция для умножения  матрицы и коэффициентов
function MultiplyMatrices(matrix1: TMatrix; ArrDouble: TArrayDouble): TMatrix;
var
  new_matrix: TMatrix;
  i, j, k: Integer;
begin
  setlength(new_matrix, length(matrix1), length(matrix1[0]));
  for i := 0 to length(matrix1) - 1 do
    for j := 0 to length(matrix1[0]) - 1 do
      for k := 0 to length(ArrDouble) - 1 do
        new_matrix[i][j] := new_matrix[i][j] + matrix1[i][k] * ArrDouble[k];
  result := new_matrix;
end;

function TFormCalc.MatrixCalc(Matrix: TMatrix; ArrDouble: TArrayDouble)
  : TArrayDouble;
var
  A, B: Integer;
  koeff, tmp_0, determ: real;
  invers_matrix, ret: TMatrix;
  Res: TArrayDouble;
begin
  invers_matrix := Inverse(Matrix);
  ret := MultiplyMatrices(invers_matrix, ArrDouble);
  for A := 0 to length(ret)-1 do
  begin
    setlength(Res, length(Res) + 1);
    Res[A] := ret[A][0];
  end;
  result:=Res;
end;

end.
