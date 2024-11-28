unit Student;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uEditor, uInfo, uCalc,
    Vcl.StdCtrls, Vcl.Grids, Vcl.ValEdit,
    System.Generics.Collections;

type
    TStudentProgram = class(TForm)
        MainMenu1: TMainMenu;
        inf: TMenuItem;
        editor: TMenuItem;
        Calc: TMenuItem;
        LabelMainForm: TLabel;
        GroupBoxStudent: TGroupBox;
        LabelStudentFirstName: TLabel;
        LabelStudentLastName: TLabel;
        LabelStudentMiddleName: TLabel;
        GroupBox1: TGroupBox;
        LabelTeacherLastName: TLabel;
        LabelTeacherFirstName: TLabel;
        LabelTeacherMiddleName: TLabel;
        LabelSLN: TLabel;
        LabelSFN: TLabel;
        LabelSMN: TLabel;
        LabelTLN: TLabel;
        LabelTFN: TLabel;
        LabelTMN: TLabel;
        GroupBox2: TGroupBox;
        Label1: TLabel;
        Label2: TLabel;
        LabelOrgName: TLabel;
        LabelOrgAddr: TLabel;
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure editorClick(Sender: TObject);
        procedure infClick(Sender: TObject);
        procedure CalcClick(Sender: TObject);
    private
        { Private declarations }
        procedure ShowInfo;
        procedure ShowEditor;
        procedure ShowCalc;
        procedure LoadLabelsCaption;
    public
        { Public declarations }
    end;

var
    StudentProgram: TStudentProgram;
    StudentInfo: TFormInfo;
    StudentEditor: TFormEditor;
    StudentCalc: TFormCalc;

implementation

{$R *.dfm}

procedure TStudentProgram.CalcClick(Sender: TObject);
begin
    ShowCalc;
end;

procedure TStudentProgram.editorClick(Sender: TObject);
begin
    ShowEditor;
end;

procedure TStudentProgram.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FreeAndNil(StudentInfo);
    FreeAndNil(StudentEditor);
    FreeAndNil(StudentCalc);
end;

procedure TStudentProgram.FormCreate(Sender: TObject);
begin
    StudentInfo := TFormInfo.Create(nil);
    StudentEditor := TFormEditor.Create(nil);
    StudentCalc := TFormCalc.Create(nil);
    LoadLabelsCaption;
end;

procedure TStudentProgram.infClick(Sender: TObject);
begin
    ShowInfo;
end;

procedure TStudentProgram.ShowInfo;
begin
    StudentInfo.Show;
end;

procedure TStudentProgram.ShowEditor;
begin
    StudentEditor.Show;
end;

procedure TStudentProgram.ShowCalc;
begin
    StudentCalc.Show;
end;

procedure TStudentProgram.LoadLabelsCaption;
var
    MyDictionary: TDictionary<String, String>;
begin
    try
        self.LabelStudentLastName.Caption := 'Фамилия:';
        self.LabelStudentFirstName.Caption := 'Имя:';
        self.LabelStudentMiddleName.Caption := 'Отчество:';

        self.LabelTeacherLastName.Caption := 'Фамилия:';
        self.LabelTeacherFirstName.Caption := 'Имя:';
        self.LabelTeacherMiddleName.Caption := 'Отчество:';

        MyDictionary := StudentEditor.LoadUserData(ExtractFilePath(ParamStr(0))
          + 'Info.txt');
        self.LabelSLN.Caption := MyDictionary.Items['StudentLastName'];
        self.LabelSFN.Caption := MyDictionary.Items['StudentName'];
        self.LabelSMN.Caption := MyDictionary.Items['StudentMiddleName'];

        self.LabelTeacherLastName.Caption := MyDictionary.Items
          ['TeacherLastName'];
        self.LabelTeacherFirstName.Caption := MyDictionary.Items['TeacherName'];
        self.LabelTeacherMiddleName.Caption := MyDictionary.Items
          ['TeacherMiddleName'];

        self.LabelOrgAddr.Caption := MyDictionary.Items['OrganizationAddres'];
        self.LabelOrgName.Caption := MyDictionary.Items['OrganizationName'];

    except
        FreeAndNil(MyDictionary);
    end;
    if MyDictionary <> nil then
        MyDictionary.Free;
    // StudentEditor.SaveUsersData(ExtractFilePath(ParamStr(0))+'Info.txt',MyDictionary);

end;

end.
