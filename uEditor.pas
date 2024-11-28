unit uEditor;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Generics.Collections,
    System.IniFiles, Vcl.StdCtrls;

type
    TFormEditor = class(TForm)
        Label1: TLabel;
        Label2: TLabel;
        Edit1: TEdit;
        Edit2: TEdit;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
        { Private declarations }
        procedure SaveUserData;
    public
        { Public declarations }
        procedure SaveUsersData(FileName: String;
          dict_data: TDictionary<String, String>);
        Function LoadUserData(FileName: String): TDictionary<String, String>;
    end;

var
    FormEditor: TFormEditor;

implementation

{$R *.dfm}

procedure TFormEditor.SaveUsersData(FileName: String;
  dict_data: TDictionary<String, String>);
var
    ini: TIniFile;
    key: string;
begin
    ini := TIniFile.Create(FileName);
    for key in dict_data.Keys do
    begin
        ini.WriteString('Info', key, dict_data.Items[key]);
    end;
    ini.Free;
end;

procedure TFormEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    SaveUserData;
end;

function TFormEditor.LoadUserData(FileName: string)
  : TDictionary<String, String>;
var
    ini: TIniFile;
    list: TstringList;
    key: string;
    value: string;
begin
    result := TDictionary<String, String>.Create;
    list := TstringList.Create;

    ini := TIniFile.Create(FileName);
    ini.ReadSection('Info', list);
    for key in list do
        result.Add(key, ini.ReadString('Info', key, ''));
    list.Free;
    ini.Free;
end;

procedure TFormEditor.SaveUserData;
var
    user_data: TstringList;
begin
    user_data := TstringList.Create;
    user_data.Clear;
    user_data.Encoding.ANSI;
    user_data.Add('Имя пользователя : ' + Edit1.Text);
    user_data.Add('Фамилия пользователя : ' + Edit2.Text);
    user_data.SaveToFile(ExtractFilePath(ParamStr(0)) + 'User.txt');
    FreeAndNil(user_data);
end;

end.
