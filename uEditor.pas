unit uEditor;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Generics.Collections,
    System.IniFiles, Vcl.StdCtrls;

type
    TFormEditor = class(TForm)
        Edit1: TEdit;
        Edit2: TEdit;
        GroupBoxStudent: TGroupBox;
        LabelStudentFirstName: TLabel;
        LabelStudentLastName: TLabel;
        LabelStudentMiddleName: TLabel;
        Edit3: TEdit;
        GroupBox1: TGroupBox;
        LabelTeacherLastName: TLabel;
        LabelTeacherFirstName: TLabel;
        LabelTeacherMiddleName: TLabel;
        Edit4: TEdit;
        Edit5: TEdit;
        Edit6: TEdit;
        GroupBox2: TGroupBox;
        Label1: TLabel;
        Label2: TLabel;
        LabelOrgName: TLabel;
        LabelOrgAddr: TLabel;
        Button1: TButton;
        Edit7: TEdit;
        Edit8: TEdit;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure Button1Click(Sender: TObject);
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

procedure TFormEditor.Button1Click(Sender: TObject);
var
    MyDictionary: TDictionary<String, String>;
begin
    MyDictionary := TDictionary<String, String>.Create;
    MyDictionary.Add('StudentLastName', Edit1.Text);
    MyDictionary.Add('StudentName', Edit2.Text);
    MyDictionary.Add('StudentMiddleName', Edit3.Text);
    MyDictionary.Add('TeacherLastName', Edit4.Text);
    MyDictionary.Add('TeacherName', Edit5.Text);
    MyDictionary.Add('TeacherMiddleName', Edit6.Text);
    MyDictionary.Add('OrganizationAddres', Edit7.Text);
    MyDictionary.Add('OrganizationName', Edit8.Text);
    SaveUsersData(ExtractFilePath(ParamStr(0)) + 'Info.txt', MyDictionary);
    FreeAndNil(MyDictionary);
end;

procedure TFormEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    SaveUserData;
end;

procedure TFormEditor.FormCreate(Sender: TObject);
var
    MyDictionary: TDictionary<String, String>;
begin
    try
        MyDictionary := self.LoadUserData(ExtractFilePath(ParamStr(0)) +
          'Info.txt');
        self.Edit1.Text := MyDictionary.Items['StudentLastName'];
        self.Edit2.Text := MyDictionary.Items['StudentName'];
        self.Edit3.Text := MyDictionary.Items['StudentMiddleName'];

        self.Edit4.Text := MyDictionary.Items['TeacherLastName'];
        self.Edit5.Text := MyDictionary.Items['TeacherName'];
        self.Edit6.Text := MyDictionary.Items['TeacherMiddleName'];

        self.Edit7.Text := MyDictionary.Items['OrganizationAddres'];
        self.Edit8.Text := MyDictionary.Items['OrganizationName'];
    finally
        FreeAndNil(MyDictionary);
    end;
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
