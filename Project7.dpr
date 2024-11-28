program Project7;

uses
  Vcl.Forms,
  Student in 'Student.pas' {StudentProgram},
  uEditor in 'uEditor.pas' {FormEditor},
  uInfo in 'uInfo.pas' {FormInfo},
  uCalc in 'uCalc.pas' {FormCalc};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TStudentProgram, StudentProgram);
  Application.CreateForm(TFormEditor, FormEditor);
  Application.CreateForm(TFormInfo, FormInfo);
  Application.CreateForm(TFormCalc, FormCalc);
  Application.Run;
end.
