unit MainFrm;

interface

uses

  System.Generics.Collections, Dm_TLB, Utils, Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.Menus, Vcl.ExtCtrls,WinTypes,ShellAPI;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    RadioButton13: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure RadioButton10Click(Sender: TObject);
    procedure RadioButton11Click(Sender: TObject);
    procedure RadioButton12Click(Sender: TObject);
    procedure RadioButton13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  dm: Idmsoft;
  labeText: String;
  item: Integer;
  isSuccess: Boolean;

implementation
uses MainThread;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  dmhd1: THandle;
  reg: Integer;
  hwnd: Integer;
  bindCode: Integer;
begin
  dmhd1 := LoadLibrary('dm.dll');
  if dmhd1 < 32 then
  begin
    ShowMessage('初始化失败');
    sleep(2000);
    Application.Terminate;
  end
  else begin
    dm := CreateComObjectFromDll(CLASS_dmsoft, dmhd1) as Idmsoft;
    labeText := '初始化成功' +  #13;
    Label1.Caption := labeText;
    labeText := labeText + '版本' + dm.Ver + #13;
    Label1.Caption := labeText;
    reg := dm.Reg('gaoguanqie7d92abdc48dbea9337a68d71f3088cf','4nbxX6zE');

      //设置全局路径
    dm.SetPath('\');
    dm.SetDict(0,'dm_soft.txt');

    if reg = 1 then  begin
     labeText := labeText + '注册成功' + #13;
    end
    else begin
     labeText := labeText + '注册失败' + #13;
     sleep(2000);
     Application.Terminate;
    end;

    labeText := labeText + '开始绑定' + #13;
    Label1.Caption := labeText;
    hwnd := dm.FindWindow('MapleStoryClass', 'MapleStory');

    dm.SetWindowState(hwnd, 12);
//    bindCode := dm.BindWindowEx(hwnd, 'gdi', 'windows', 'normal', '',0);
//    BindWindowEx(hwnd,display,mouse,keypad,public,mode)
    bindCode := dm.BindWindowEx(hwnd, 'normal', 'normal', 'dx', '',0);
    dm.MoveWindow(hwnd,0,0);
    if bindCode = 1 then
    begin
      labeText := labeText + '绑定成功' + #13;
      Label1.Caption := labeText;
      isSuccess := True;
      RadioButton1.Checked:= true;
      item := 1;
    end

    else
    begin
      labeText := labeText + '绑定失败' + IntToStr(bindCode) + #13;
      Label1.Caption := labeText;
      isSuccess := False;
      item := 0;
      RadioButton1.Checked:= false;
      sleep(2000);
      Application.Terminate;
      dm := nil
    end
  end;
end;

//开始按钮
procedure TForm1.Button2Click(Sender: TObject);
begin
    if isSuccess  then begin
    labeText :=  labeText + '-----------' + #13;
    Label1.Caption := labeText;
    labeText := '地图编码：' + IntToStr(item) + #13;
    Label1.Caption := labeText;
    WorkThread.Create(item);
    end
    else begin
    ShowMessage('请先点击启动按钮');
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  OLERegister('./dm.dll', 1);
  item := 0;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  try  begin
    dm.KeyUp(37);
    dm.KeyUp(39);
    dm.KeyUp(38);
    dm.KeyUp(40);
  end;

  finally
    ExitProcess(0);
    OLERegister('./dm.dll', 0);
    item := 0;
  end;
end;

procedure TForm1.RadioButton10Click(Sender: TObject);
begin
     item := 10;
end;

procedure TForm1.RadioButton11Click(Sender: TObject);
begin
    item := 11;
end;

procedure TForm1.RadioButton12Click(Sender: TObject);
begin
     item := 12;
end;

procedure TForm1.RadioButton13Click(Sender: TObject);
begin
    item := 13;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  item := 1;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
   item := 2;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
  item := 3;
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
  item := 4;
end;

procedure TForm1.RadioButton5Click(Sender: TObject);
begin
   item := 5;
end;

procedure TForm1.RadioButton6Click(Sender: TObject);
begin
    item := 6;
end;

procedure TForm1.RadioButton7Click(Sender: TObject);
begin
     item := 7;
end;

procedure TForm1.RadioButton8Click(Sender: TObject);
begin
     item := 8;
end;

procedure TForm1.RadioButton9Click(Sender: TObject);
begin
     item := 9;
end;

end.
