unit Utils;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs,
  Dm_TLB, ComObj, ActiveX, ToolWin, ComCtrls;

// ��DLL��Ϣ���/ɾ����ע���
function OLERegister(sOleFileName: string; OleAction: Byte): Boolean;

// ����com����(��Į����)
function CreateComObjectFromDll(CLSID: TGUID; DllHandle: THandle): IUnknown;

implementation

function OLERegister(sOleFileName: string; OleAction: Byte): Boolean;
const
  RegisterOle = 1; // ע��
  UnRegisterOle = 0; // ж��
type
  TOleRegisterFunction = function: HResult; // ע���ж�غ���ԭ��
var
  hLibraryHandle: THandle; // ��LoadLibray���ص�DLL��OCX���
  hFunctionAddress: TFarProc; // DLL��OCX�еĺ����������GetProAddress����
  RegFunction: TOleRegisterFunction; // ע���ж�غ���ָ��
begin
  Result := False;

  // ���ļ�������DLL��OCX���
  hLibraryHandle := LoadLibrary(PChar(sOleFileName));
  if (hLibraryHandle > 0) then // DLLakg OCX�����ȷ
    try
      // ����ע���ж�غ���ָ��
      if (OleAction = RegisterOle) then // ����ע�ắ��ָ��
      begin

        hFunctionAddress := GetProcAddress(hLibraryHandle,
          PAnsiChar('DllRegisterServer'))

      end
      else // ����ж�غ���ָ��
        hFunctionAddress := GetProcAddress(hLibraryHandle,
          PAnsiChar('DllUnRegisterServer'));

      if (hFunctionAddress <> nil) then // �ж�ע���ж�غ����Ƿ����
      begin

        RegFunction := TOleRegisterFunction(hFunctionAddress); // ��ȡ����������ָ��

        if RegFunction >= 0 then // ִ��ע���ж�ز���������ֵ>=0��ʾִ�гɹ�
        begin

          Result := True;
        end;

      end;
    finally
      FreeLibrary(hLibraryHandle); // �ر��Ѵ򿪵��ļ�
    end;
end;

function CreateComObjectFromDll(CLSID: TGUID; DllHandle: THandle): IUnknown;
var
  Factory: IClassFactory;
  hr: HResult;
  DllGetClassObject: function(const CLSID, IID: TGUID; var Obj)
    : HResult; stdcall;
begin
  DllGetClassObject := GetProcAddress(DllHandle, 'DllGetClassObject');
  if Assigned(DllGetClassObject) then
  begin
    hr := DllGetClassObject(CLSID, IClassFactory, Factory);
    if hr = S_OK then
    begin
      Factory.CreateInstance(nil, IUnknown, Result);
      // Factory._Release;
    end;
  end;
end;

end.

