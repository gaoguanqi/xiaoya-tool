unit MainThread;

interface

uses
  Utils,Dm_TLB,System.Classes,Winapi.Windows,Vcl.Dialogs,System.SysUtils;

type
  WorkThread = class(TThread)
  private
    hwnd: Integer;
    dm: Idmsoft;
    item: Integer;
//    count: Integer;
//    i: Integer;
//    o: Integer;
//    p: Integer;
  protected
    procedure Execute; override;
  public
    constructor Create; overload;
    constructor Create(item: Integer); overload;
  end;

implementation

constructor WorkThread.Create(item: Integer);
begin
  inherited Create(False);
  Self.item := item;
end;

constructor WorkThread.Create;
begin
  inherited Create(False);
end;
//var
 // k: Integer;
 // x: Integer;
  //pic: String;
  //indexArray : TArray<string>;
  //intX: Integer;
  //intY: Integer;


//  isLeft : Boolean;
//  isRight : Boolean;
//  isRuning : Boolean;
//  isZLeft: Boolean;
//  isZzLeft: Boolean;
//  isTRight: Boolean;






{

                    u 85     主攻
                   i 73      闪现
                   o 79       宏技能
                   p 80        喂宠
                     空格  32     跳跃
                     f6   117
                   left 37
                   right 39
                    up   38
                     down  40
}

//测试
procedure OnWork0(dm: Idmsoft);
var
  isRuning: Boolean;
  isLeft: Boolean;
  isRight: Boolean;
  isMod: Boolean;
  count: Integer;
  o: Integer;
  p: Integer;
  dm_ret: Integer;
  intX: OleVariant;
  intY: OleVariant;
begin

   // pic := dm.FindPicEx(0,0,700,700,'my.bmp','000000',1,0);
   // indexArray := pic.Split([',']);
   // intX := strToInt(indexArray[1]);
   // intY := strToInt(indexArray[2]);
   // ShowMessage(indexArray[1] +'|'+indexArray[2]);

//   pic := dm.FindColorEx(0,0,500,500,'ffff88-000000',1.0,0);
//   //pic := dm.FindColorEx(82,206,243,315,'ffff88-000000',1.0,0);
//   if dm.GetResultCount(pic) > 0 then begin
//     dm_ret := dm.GetResultPos(pic,1,oleX,oleY);
//     if dm_ret = 1 then begin
//        intX := oleX;
//        intY := oleY;
//     end;
//   end;



  isRuning := True;
  isLeft := True;
  isRight := False;

  //dm.KeyDown(37);
  while isRuning do  begin

     dm_ret := dm.FindPic(0,0,400,400,'my.bmp','000000',1,0,intX,intY);
           if (intX >= 0) and (intY >= 0) then begin
              ShowMessage(IntToStr(intX) +'|'+IntToStr(intY));
           end;



  end;







//     isRuning := True;
//     isLeft := True;
//     dm.KeyDown(37);
//     while isRuning do begin
//          while isLeft do begin
//              dm_ret := dm.FindPic(0,0,300,300,'my.bmp','000000',1,0,intX,intY);
//              if (intX >= 0) and (intY >= 0) then begin
//                if intX <= 85 then begin
//                    isLeft := False;
//                    isRight := True;
//                   dm.KeyUp(37);
//                   dm.KeyDown(39);
//                end;
//              end;
//
//          end;
//
//          while isRight do begin
//             dm_ret := dm.FindPic(0,0,300,300,'my.bmp','000000',1,0,intX,intY);
//             if (intX >= 0) and (intY >= 0) then begin
//                if intX >= 200 then begin
//                    isRight := False;
//                    isLeft := True;
//                   dm.KeyUp(39);
//                   dm.KeyDown(37);
//                end;
//              end;
//          end;
//
//     end;



end;

//通用定点
procedure OnWork1(dm: Idmsoft);
var
  isRuning: Boolean;
  count: Integer;
  o: Integer;
  p: Integer;

begin
   isRuning := True;
   count := 1;
   while isRuning do begin

        o := Random(6);
        if o = 0 then begin
          dm.KeyPress (79);
          sleep(3000);
        end;

        sleep(500);
        dm.KeyDown(37);
        sleep(300);
        dm.KeyUp(37);
        dm.KeyPress(85);
        sleep(1500);
        dm.KeyDown(39);
        sleep(300);
        dm.KeyUp(39);
        dm.KeyPress(85);
        sleep(1500);

        p := Random(20);
        if p = 0 then begin
          dm.KeyPress (80);
          sleep(1000);
        end;

        count := count + 1;
   end;
end;

//黑羊领土底层
procedure OnWork2(dm: Idmsoft);
var
   isRuning: Boolean;
  count: Integer;
  isLeft: Boolean;
  isRight: Boolean;
  i: Integer;
  o: Integer;
  p: Integer;

  dm_ret: Integer;

  intX: OleVariant;
  intY: OleVariant;
begin
   isRuning := True;
  isLeft := True;
  isRight := False;

  dm.KeyDown(37);

   while isRuning do  begin
     while isLeft do  begin
            dm_ret := dm.FindPic(0,0,300,300,'my.bmp','000000',1,0,intX,intY);
            if (intX >= 0) and (intY >= 0) then begin
              if intX <= 55  then begin
               isLeft := False;
               isRight := True;
               dm.KeyUp(37);
               dm.KeyDown(39);
              end;

              sleep(1000);
              dm.KeyPress(85);
              sleep(2000);
              i := Random(6);
              if i = 0 then begin
                dm.KeyPress(73);
                sleep(500);
              end;
            end;
     end;

          o := Random(3);
          if o = 0 then begin
          dm.KeyPress(79);
          sleep(3000);
          end;
     while isRight do  begin
             dm_ret := dm.FindPic(0,0,300,300,'my.bmp','000000',1,0,intX,intY);
             if (intX >= 0) and (intY >= 0) then begin
               if intX >= 240  then begin
                isRight := False;
                isLeft := True;
                dm.KeyUp(39);
                dm.KeyDown(37);
              end;

              sleep(1000);
              dm.KeyPress(85);
              sleep(2000);
              i := Random(6);
              if i = 0 then begin
                dm.KeyPress(73);
                sleep(500);
              end;
            end;
      end;

     p := Random(5);
     if p = 0 then begin
       dm.KeyPress(80);
       sleep(500);
     end;

  end;
end;

//黑羊领土底层（法师）
procedure OnWork2_Mage(dm: Idmsoft);
var
   isRuning: Boolean;
  count: Integer;
  isLeft: Boolean;
  isRight: Boolean;
  i: Integer;
  o: Integer;
  p: Integer;

  dm_ret: Integer;

  intX: OleVariant;
  intY: OleVariant;
begin
  isRuning := True;
  isLeft := True;
  isRight := False;

  dm.KeyDown(37);

   while isRuning do  begin
     while isLeft do  begin
            dm_ret := dm.FindPic(0,0,300,300,'my.bmp','000000',1,0,intX,intY);
            if (intX >= 0) and (intY >= 0) then begin
              if intX <= 50  then begin
               isLeft := False;
               isRight := True;
               dm.KeyUp(37);
               dm.KeyDown(39);
              end;

              // 149   151  153 274

              sleep(500);
              dm.KeyPress(73);
              sleep(300);
              dm.KeyPress(85);
              sleep(600);
              i := Random(6);
              if i = 0 then begin
                dm.KeyPress(73);
                sleep(500);
              end;

            end;
     end;

          o := Random(5);
          if o = 0 then begin
          dm.KeyPress(79);
          sleep(3000);
          end;
     while isRight do  begin
             dm_ret := dm.FindPic(0,0,300,300,'my.bmp','000000',1,0,intX,intY);
             if (intX >= 0) and (intY >= 0) then begin
               if intX >= 260  then begin
                isRight := False;
                isLeft := True;
                dm.KeyUp(39);
                dm.KeyDown(37);
              end;

               sleep(500);
              dm.KeyPress(73);
              sleep(300);
              dm.KeyPress(85);
              sleep(600);
              i := Random(6);
              if i = 0 then begin
                dm.KeyPress(73);
                sleep(500);
              end;
            end;
      end;

     p := Random(5);
     if p = 0 then begin
       dm.KeyPress(80);
       sleep(500);
     end;
   count := count + 1;
  end;
end;


// 仙人掌宝宝沙漠
procedure OnWork3(dm: Idmsoft);
var
  isRuning: Boolean;
  count: Integer;
  isLeft: Boolean;
  isRight: Boolean;
  i: Integer;
  o: Integer;
  p: Integer;

  dm_ret: Integer;

  intX: OleVariant;
  intY: OleVariant;

begin
  isRuning := True;
  isLeft := True;
  isRight := False;

  dm.KeyDown(37);
  while isRuning do  begin
     // 75  216
     while isLeft do  begin
            dm_ret := dm.FindPic(0,0,300,300,'my.bmp','000000',1,0,intX,intY);
            if (intX >= 0) and (intY >= 0) then begin
              if intX <= 90  then begin
               isLeft := False;
               isRight := True;
               dm.KeyUp(37);
               dm.KeyDown(39);
              end;

              sleep(500);
              dm.KeyPress(85);
              sleep(2000);
              i := Random(2);
              if i = 0 then begin
                dm.KeyPress(73);
                sleep(500);
              end;
            end;
     end;

          o := Random(6);
          if o = 0 then begin
          dm.KeyPress(79);
          sleep(3000);
          end;
         // 215  216
     while isRight do  begin
             dm_ret := dm.FindPic(0,0,300,300,'my.bmp','000000',1,0,intX,intY);
             if (intX >= 0) and (intY >= 0) then begin
               if intX >= 190  then begin
                isRight := False;
                isLeft := True;
                dm.KeyUp(39);
                dm.KeyDown(37);
              end;

              sleep(500);
              dm.KeyPress(85);
              sleep(2000);
              i := Random(2);
              if i = 0 then begin
                dm.KeyPress(73);
                sleep(500);
              end;
            end;
      end;

     p := Random(5);
     if p = 0 then begin
       dm.KeyPress(80);
       sleep(500);
     end;

  end;
end;


procedure OnWork4(dm: Idmsoft);
var
  isRuning: Boolean;
  count: Integer;
  isLeft: Boolean;
  isRight: Boolean;
  i: Integer;
  o: Integer;
  p: Integer;
  dm_ret: Integer;
  intX: OleVariant;
  intY: OleVariant;
begin
  isRuning := True;
  isLeft := True;
  isRight := False;

  dm.KeyDown(37);
  while isRuning do begin
        while isLeft do begin
           dm_ret := dm.FindPic(0,0,300,300,'my.bmp','000000',1,0,intX,intY);
           if (intX >= 0) and (intY >= 0) then begin
                if intX <= 51  then begin
                    isLeft := False;
                    isRight := True;
                    dm.KeyUp(37);
                    dm.KeyDown(39);
                end;

               sleep(1000);
               dm.KeyPress(85);
               sleep(1500);
           end;
        end;

        sleep(1000);
        o :=  Random(2);
        if o = 0 then begin
          dm.KeyPress(79);
          sleep(1500);
        end;
        i :=  Random(2);
        if i = 0 then begin
           dm.KeyPress(85);
           sleep(1500);
           dm.KeyPress(37);
        end;
        p := Random(4);
        if p = 0 then begin
          dm.KeyPress (80);
        end;

        while isRight do begin
           dm_ret := dm.FindPic(0,0,300,300,'my.bmp','000000',1,0,intX,intY);
           if (intX >= 0) and (intY >= 0) then begin
                if intX >= 240  then begin
                    isRight := False;
                    isLeft := True;
                    dm.KeyUp(39);
                    dm.KeyDown(37);
                end;

               sleep(1000);
               dm.KeyPress(85);
               sleep(1500);
           end;
        end;
      count :=  count + 1;
  end;

end;

 //主教牛魔王剧情
procedure OnWork5(dm: Idmsoft);
var
  isRuning: Boolean;
  count: Integer;
  isLeft: Boolean;
  isRight: Boolean;
  i: Integer;
  o: Integer;
  p: Integer;
  dm_ret: Integer;
  intX: OleVariant;
  intY: OleVariant;
begin
  isRuning := True;
  isLeft := True;
  isRight := False;

  dm.KeyDown(37);
  while isRuning do begin
        while isLeft do begin
           dm_ret := dm.FindPic(0,0,300,300,'my.bmp','000000',1,0,intX,intY);
           if (intX >= 0) and (intY >= 0) then begin
                if intX <= 51  then begin
                    isLeft := False;
                    isRight := True;
                    dm.KeyUp(37);
                    dm.KeyDown(39);
                end;

               dm.KeyPress(73);
               sleep(500);
               dm.KeyPress(85);
               sleep(3500);
               dm.KeyPress(73);
               sleep(500);
           end;
        end;

        sleep(1000);
        o :=  Random(2);
        if o = 0 then begin
          dm.KeyPress(79);
          sleep(1500);
        end;
        i :=  Random(2);
        if i = 0 then begin
           dm.KeyPress(85);
           sleep(3500);
        end;
        p := Random(4);
        if p = 0 then begin
          dm.KeyPress (80);
        end;

        while isRight do begin
           dm_ret := dm.FindPic(0,0,300,300,'my.bmp','000000',1,0,intX,intY);
           if (intX >= 0) and (intY >= 0) then begin
                if intX >= 240  then begin
                    isRight := False;
                    isLeft := True;
                    dm.KeyUp(39);
                    dm.KeyDown(37);
                end;

               dm.KeyPress(73);
               sleep(500);
               dm.KeyPress(85);
               sleep(3500);
               dm.KeyPress(73);
               sleep(500);
           end;
        end;

//      while isLeft do begin
//        pic := dm.FindPicEx(0,0,300,300,'my.bmp','000000',1,0);
//        indexArray := pic.Split([',']);
//        intX := strToInt(indexArray[1]);
//        intY := strToInt(indexArray[2]);
//        sleep(800);
//        dm.KeyPress(85);
//        sleep(4000);
//        if intX <= 51  then begin
//            isLeft := False;
//            isRight := True;
//            dm.KeyUp(37);
//            dm.KeyDown(39);
//            sleep(800);
//            dm.KeyPress(73);
//            sleep(200);
//            dm.KeyPress(32);
//        end;
//      end;
//
//      sleep(1000);
//      o :=  Random(2);
//      if o = 0 then begin
//        dm.KeyPress(79);
//        sleep(1500);
//      end;
//
//      p := Random(4);
//      if p = 0 then begin
//        dm.KeyPress (80);
//      end;
//
//      while isRight do begin
//        pic := dm.FindPicEx(0,0,300,300,'my.bmp','000000',1,0);
//        indexArray := pic.Split([',']);
//        intX := strToInt(indexArray[1]);
//        intY := strToInt(indexArray[2]);
//        sleep(800);
//        dm.KeyPress(85);
//        sleep(4000);
//        if intX >= 240  then begin
//            isRight := False;
//            isLeft := True;
//            dm.KeyUp(39);
//            dm.KeyDown(37);
//            sleep(800);
//            dm.KeyPress(73);
//            sleep(200);
//            dm.KeyPress(32);
//        end;
//      end;
      count :=  count + 1;
  end;
end;

//昭和内部街道2   优化
procedure OnWork6(dm: Idmsoft);
var
  isRuning: Boolean;
  count: Integer;
  isLeft: Boolean;
  isRight: Boolean;
  isJump: Boolean;
  isMod: Boolean;
  isDo: Boolean;
  i: Integer;
  o: Integer;
  p: Integer;
  modL2: Integer;
  modL3: Integer;
  m: Integer;

  dm_ret: Integer;
  intX: OleVariant;
  intY: OleVariant;
begin
  isRuning := True;
  isLeft := True;
  isRight := False;
  modL2 := 3;
  modL3 := 3;
  dm.KeyDown(37);
  while isRuning do begin
        while isLeft do begin
            dm_ret := dm.FindPic(0,0,400,400,'my.bmp','000000',1,0,intX,intY);
           if (intX >= 0) and (intY >= 0) then begin

                if (intX <= 45) and (intY = 228) then begin
                    dm.KeyUp(37);
                    dm.KeyDown(39);
                    dm.KeyPress(73);

                    if not isMod then  begin
                      isLeft := False;
                      isRight := True;
                    end;
                end;



                isDo := False;

                if (intX = 305) and (intY = 228) then  begin
                    if not isDo then begin
                      dm.KeyPress(85);
                      isDo := True;
                      sleep(3000);
                      dm.KeyPress(73);
                      dm.KeyPress(73);
                    end;
                end;

                isDo := False;

                if (intX = 215) and (intY = 228) then  begin
                    if not isDo then begin
                      dm.KeyPress(85);
                      isDo := True;
                      sleep(3000);
                      dm.KeyPress(73);
                      dm.KeyPress(73);
                    end;
                end;

                isDo := False;

                if (intX = 125) and (intY = 228) then  begin
                    if not isDo then begin
                      dm.KeyPress(85);
                      isDo := True;
                      sleep(3000);
                      dm.KeyPress(73);
                      dm.KeyPress(73);
                    end;
                end;

                isDo := False;

                if (intX = 55) and (intY = 228) then  begin
                   if not isDo then   begin
                      dm.KeyPress(85);
                      isDo := True;
                      sleep(3000);
                      dm.KeyPress(73);
                      dm.KeyPress(73);
                   end;

                end;


                if(((count mod modL2) = 0) and  (intX >= 245) and (intX <= 263)) and (intY = 228) then begin
                   dm.KeyUp(37);
                   dm.KeyDown(39);
                   dm.KeyDown(32);
                   dm.KeyUp(32);
                   isLeft := False;
                   isRight := True;
                   isMod :=True;
                end ;

           end;
        end;
         count := count + 1;
        while isRight do begin
           dm_ret := dm.FindPic(0,0,400,400,'my.bmp','000000',1,0,intX,intY);
           if (intX >= 0) and (intY >= 0) then begin

                if(((count mod modL2) = 0) and  (isMod) and ((intX >= 263) and (intX <= 330))) and (intY = 208) then begin
                    dm.KeyPress(73);
                end;

                if (intX >= 360) and (intY = 228)  then begin

                    if not isMod then  begin
                      dm.KeyUp(39);
                      dm.KeyDown(37);
                      dm.KeyPress(73);
                      isRight := False;
                      isLeft := True;
                    end else begin
                      isRight := False;
                      isLeft := True;
                      isMod := False;
                      dm.KeyUp(39);
                      dm.KeyUp(32);
                      dm.KeyDown(37);
                      dm.KeyPress(73);
                    end;



                end else if( not isMod) and (intX = 125) and (intY = 220) then begin
                    dm.KeyDown(40);
                    dm.KeyPress(32);
                    dm.KeyUp(40);
                end;

                // 143  203  297
                isDo := False;

                if (intX = 143) and (intY = 228) then  begin
                   if not isDo then   begin
                      dm.KeyPress(85);
                      isDo := True;
                      sleep(3000);
                      dm.KeyPress(73);
                      dm.KeyPress(73);
                   end;

                end;


                 isDo := False;

                if (intX = 203) and (intY = 228) then  begin
                   if not isDo then   begin
                      dm.KeyPress(85);
                      isDo := True;
                      sleep(3000);
                      dm.KeyPress(73);
                      dm.KeyPress(73);
                   end;

                end;

                 isDo := False;

                if (intX = 297) and (intY = 228) then  begin
                   if not isDo then   begin
                      dm.KeyPress(85);
                      isDo := True;
                      sleep(3000);
                      dm.KeyPress(73);
                      dm.KeyPress(73);
                   end;
                end;


                 if((count mod modL3) = 0) and (intX >= 360) and (intY = 190)  then begin
                    isRight := False;
                    isLeft := True;
                    isMod := False;
                    dm.KeyUp(39);
                    dm.KeyUp(32);
                    dm.KeyDown(40);
                    sleep(1000);
                    dm.KeyPress(32);
                    sleep(500);
                    dm.KeyPress(32);
                    dm.KeyUp(40);
                    dm.KeyDown(37);
                end;
           end;
          // m :=  Random(2);
           if ((count mod modL3) = 0) then  begin
               if (((intX >= 167) and (intX <= 247)) and ((intY >= 196) and (intY <= 206)) or  ((intX >= 291) and (intX <= 361)) and ((intY >= 180) and (intY <= 190))) then begin
                  dm.KeyUp(32);
//                  if (m = 0) then  begin
//                    dm.KeyPress(73);
//                   end;
               end else if (intX >= 102) then begin
                // 87  228
                dm.KeyDown(32);
               end;
           end;
        end;

    o :=  Random(5);
    if o = 0 then begin
        dm.KeyPress(79);
        sleep(1500);
    end;

    p := Random(6);
    if p = 0 then begin
      dm.KeyPress (80);
    end;

   end;
end;
 //昭和内部街道2
procedure OnWork6_Mage(dm: Idmsoft);
var
  isRuning: Boolean;
  count: Integer;
  isLeft: Boolean;
  isRight: Boolean;
  isMod: Boolean;
  isDo: Boolean;
  i: Integer;
  o: Integer;
  p: Integer;

  dm_ret: Integer;
  intX: OleVariant;
  intY: OleVariant;
begin
  isRuning := True;
  isLeft := True;
  isRight := False;
  dm.KeyDown(37);
  while isRuning do  begin

      while isLeft do begin
           dm_ret := dm.FindPic(0,0,400,400,'my.bmp','000000',1,0,intX,intY);
           if (intX >= 0) and (intY >= 0) then begin
                if (intX <= 45) and (intY = 228) then begin
                    dm.KeyUp(37);
                    dm.KeyDown(39);



                    if not isMod then  begin
                      isLeft := False;
                      isRight := True;
                    end;
                   // dm.KeyPress(73);
                    //dm.KeyPress(85);
                    //sleep(4500);
                end;

                 isDo := False;

                if (intX = 305) and (intY = 228) then  begin
                    if not isDo then begin
                      dm.KeyPress(85);
                      isDo := True;
                      sleep(3000);

                    end;
                end;

                isDo := False;

                if (intX = 215) and (intY = 228) then  begin
                    if not isDo then begin
                      dm.KeyPress(85);
                      isDo := True;
                      sleep(3000);
                    end;
                end;

                isDo := False;

                if (intX = 125) and (intY = 228) then  begin
                    if not isDo then begin
                      dm.KeyPress(85);
                      isDo := True;
                      sleep(3000);
                    end;
                end;

                isDo := False;

                if (intX = 55) and (intY = 228) then  begin
                   if not isDo then   begin
                      dm.KeyPress(85);
                      isDo := True;
                      sleep(3000);
                   end;

                end;




//                 if (((intX = 305) or (intX = 235) or (intX = 165) or (intX = 105) or (intX = 55)) and (intY = 228)) then begin
//                   dm.KeyPress(85);
//                   sleep(3000);
//                end;

                 if(((count mod 2) = 0) and  (intX >= 245) and (intX <= 263)) and (intY = 228) then begin
                   dm.KeyUp(37);
                   dm.KeyDown(39);
                   dm.KeyDown(32);
                   dm.KeyUp(32);
                   isLeft := False;
                   isRight := True;
                   isMod :=True;
                    //dm.KeyPress(85);
                    //sleep(4500);
                end ;
           end;
      end;




      while isRight do begin
            dm_ret := dm.FindPic(0,0,400,400,'my.bmp','000000',1,0,intX,intY);
           if (intX >= 0) and (intY >= 0) then begin
                if (intX >= 360) and (intY = 228)  then begin
                    isRight := False;
                    isLeft := True;
                    isMod := False;
                    dm.KeyUp(39);
                    dm.KeyUp(32);
                    dm.KeyDown(37);
                end;

                 if (intX >= 360) and (intY = 190)  then begin
                    isRight := False;
                    isLeft := True;
                    isMod := False;
                    dm.KeyUp(39);
                    dm.KeyUp(32);
                    dm.KeyDown(40);
                    sleep(1000);
                    dm.KeyPress(32);
                    sleep(500);
                    dm.KeyPress(32);
                    dm.KeyUp(40);
                    dm.KeyDown(37);
                end;

                   //dm.KeyPress(73);
                   // dm.KeyPress(85);
                   // sleep(4500);

              //197  206                                   295 190
//                if (((intX = 197)  and ((intY <= 206) or intY >= 186))) or (((intX = 295)  and ((intY <= 190) or (intY >= 160)))) then begin
//                   dm.KeyPress(85);
//                end;
           end;

           dm.KeyDown(32);
      end;


       o :=  Random(5);
        if o = 0 then begin
          dm.KeyPress(79);
          sleep(1500);
        end;

        p := Random(6);
        if p = 0 then begin
          dm.KeyPress (80);
        end;

      count := count + 1;
    end;
end;

// 老虎脚印小池塘
procedure OnWork9(dm: Idmsoft);
var
   isRuning: Boolean;
  count: Integer;
  isLeft: Boolean;
  isRight: Boolean;
  i: Integer;
  o: Integer;
  p: Integer;

  dm_ret: Integer;

  intX: OleVariant;
  intY: OleVariant;
begin
  isRuning := True;
  isLeft := True;
  isRight := False;

  dm.KeyDown(37);

   while isRuning do  begin
     while isLeft do  begin
            dm_ret := dm.FindPic(0,0,360,300,'my.bmp','000000',1,0,intX,intY);
            if (intX >= 0) and (intY >= 0) then begin
              // 25  244
              if intX <= 35  then begin
               isLeft := False;
               isRight := True;
               dm.KeyUp(37);
               dm.KeyDown(39);
              end;

             sleep(1000);
             dm.KeyPress(73);
             sleep(500);
             dm.KeyPress(85);
             dm.KeyPress(85);
             sleep(800);
             // 95 107 111
//             if(intY = 244) and ((intX = 95) or (intX = 107) or (intX = 111)) then begin
//              dm.KeyPress(65); //A
//              sleep(3500);
//             end;

            end;
     end;


     while isRight do  begin
             dm_ret := dm.FindPic(0,0,360,300,'my.bmp','000000',1,0,intX,intY);
             if (intX >= 0) and (intY >= 0) then begin
              // 309  244
              if intX >= 290  then begin
                isRight := False;
                isLeft := True;
                dm.KeyUp(39);
                dm.KeyDown(37);
              end;

              if (intY >= 244) and (intX <= 95)then begin
                 dm.KeyUp(39);
                 dm.KeyDown(38);
                 dm.KeyPress(73);
                 dm.KeyUp(38);
                 dm.KeyDown(39);
              end else begin

                sleep(1000);
                dm.KeyPress(73);
                sleep(500);
                dm.KeyPress(85);
                dm.KeyPress(85);
                sleep(800);
              end;



            end;
      end;

     o := Random(5);
     if o = 0 then begin
       dm.KeyPress(79);
       sleep(3000);
     end;

     p := Random(5);
     if p = 0 then begin
       dm.KeyPress(80);
       sleep(500);
     end;
   count := count + 1;
  end;
end;

//海盗副本自动出图  识文字
procedure OnWork10(dm: Idmsoft);
var
  isRuning: Boolean;
  count: Integer;
  dm_ret: Integer;

  intX: OleVariant;
  intY: OleVariant;
begin
  isRuning := True;
  while isRuning do  begin
        dm_ret := dm.FindStrFast(0,0,300,300,'无','ffffff-101010',0.9,intX,intY);
        sleep(1000);
         if (dm_ret >= 0) then begin
            isRuning := False;
            dm.KeyDown(39);
            sleep(5000);
            dm.KeyPress(32);
            sleep(300);
            dm.KeyPress(89);
            sleep(300);
            dm.KeyUp(39);
            dm.KeyPress(13);
            sleep(5000);
            isRuning := True;
         end
  end;

end;
//海盗副本自动出图 识图
procedure OnWork10_pic(dm: Idmsoft);
var
  isRuning: Boolean;
  count: Integer;
  dm_ret: Integer;
  p: Integer;
  intX: OleVariant;
  intY: OleVariant;
begin
  isRuning := True;
  while isRuning do  begin
        dm_ret := dm.FindPic(600,500,1000,700,'haidao.bmp','000000',1,0,intX,intY);
        sleep(600);
        if (intX >= 0) and (intY >= 0) then begin
            isRuning := False;
            dm.KeyDown(39);
            sleep(5000);
            dm.KeyPress(32);
            sleep(300);
            dm.KeyPress(89);
            sleep(400);
            dm.KeyUp(39);
            sleep(600);
            dm.KeyPress(13);
            sleep(5000);
            isRuning := True;
            count := count + 1;
            p := Random(5);
           if p = 0 then begin
             dm.KeyPress(80);
             sleep(500);
           end;

         end
  end;

end;


//阴森世界入口
procedure OnWork11(dm: Idmsoft);
var
 isRuning: Boolean;
  count: Integer;
  isLeft: Boolean;
  isRight: Boolean;
  i: Integer;
  o: Integer;
  p: Integer;

  dm_ret: Integer;

  intX: OleVariant;
  intY: OleVariant;
begin
  isRuning := True;
  isLeft := True;
  isRight := False;

  dm.KeyDown(37);
  while isRuning do  begin
     // 0,180,330,380,宽高(330,200)
     while isLeft do  begin
            dm_ret := dm.FindPic(0,180,330,380,'my.bmp','000000',1,0,intX,intY);
            if (intX >= 0) and (intY >= 0) then begin
              if intX <= 51  then begin
               isLeft := False;
               isRight := True;
               dm.KeyUp(37);
               dm.KeyDown(39);
               sleep(200);
               dm.KeyPress(73);
               sleep(800);
              end;
              sleep(1000);
              dm.KeyPress(73);
              sleep(800);
              dm.KeyPress(85);
              sleep(300);
              dm.KeyPress(85);
              sleep(3600);
            end;
     end;

      o := Random(5);
      if o = 0 then begin
        dm.KeyPress(79);
        sleep(3000);
      end;
         // 215  216
     while isRight do  begin
             dm_ret := dm.FindPic(0,180,330,380,'my.bmp','000000',1,0,intX,intY);
             if (intX >= 0) and (intY >= 0) then begin
               if intX >= 255  then begin
                isRight := False;
                isLeft := True;
                dm.KeyUp(39);
                dm.KeyDown(37);
                sleep(200);
                if ((count mod 2) = 0) then  begin
                  dm.KeyPress(67); // C 花
                  dm.KeyPress(67); // C 花
                  sleep(500);
                 end;
               dm.KeyPress(73);
               sleep(800);
              end;
              sleep(1000);
              dm.KeyPress(73);
              sleep(800);
              dm.KeyPress(85);
              sleep(300);
              dm.KeyPress(85);
              sleep(3600);
            end;
      end;



     p := Random(5);
     if p = 0 then begin
       dm.KeyPress(80);
       sleep(300);
     end;

    count:= count + 1;
  end;
end;

//神木村 龙林 3
procedure OnWork12(dm: Idmsoft);
var
  isRuning: Boolean;
  count: Integer;

  i: Integer;
  o: Integer;
  p: Integer;
  x: Integer;
  dm_ret: Integer;

  intX: OleVariant;
  intY: OleVariant;
begin
  isRuning := True;
  dm.KeyDown(37);

//      u 85     主攻
//                   i 73      闪现
//                   o 79       宏技能
//                   p 80        喂宠
//                     空格  32     跳跃
//                     f6   117
//                   left 37
//                   right 39
//                    up   38
//                     down  40

  while isRuning do  begin
      //0,180,410,380,宽高(410,200)
      dm_ret := dm.FindPic(0,180,410,380,'my.bmp','000000',1,0,intX,intY);
      //  最右 383/ 284
      //  333/284  打  向左
      //  左上角 107/200 打 向右
      //  左上下来 195 /284 打 向左
      //  右上角 339 /200    打 向右
       if (intX >= 0) and (intY >= 0) then begin
           if ((intX >= 363) and (intY = 284))  then begin
              dm.KeyUp(39);
              dm.KeyDown(37);
           end;

           if ((intX = 333) and (intY = 284)) then  begin
               sleep(500);
               dm.KeyPress(85);
               sleep(200);
               dm.KeyPress(85);
               sleep(3500);
               dm.KeyPress(73);
               sleep(100);
               dm.KeyPress(73);
               sleep(800);
           end;


           if (((intX >= 0) and (intX <= 171)) and (intY = 200)) then  begin
              dm.KeyUp(37);
              dm.KeyDown(39);
           end;

           if ((intX = 107) and (intY = 200)) then  begin
               sleep(500);
               dm.KeyPress(85);
               sleep(200);
               dm.KeyPress(85);
               sleep(3500);
               dm.KeyPress(73);
               sleep(100);
               dm.KeyPress(73);
               sleep(800);
           end;

           // 125/ 284       263/ 284
           if (((intX >= 210) and (intX <= 263)) and (intY = 284)) then  begin
              dm.KeyUp(39);
              dm.KeyDown(37);
           end;

           if ((intX = 195) and (intY = 284)) then  begin
               sleep(500);
               dm.KeyPress(85);
               sleep(200);
               dm.KeyPress(85);
               sleep(3500);

                dm.KeyPress(79);
                sleep(3000);
                p := Random(5);
                if p = 0 then begin
                  dm.KeyPress (80);
                end;

               dm.KeyPress(73);
               sleep(100);
               dm.KeyPress(73);
               sleep(800);
           end;
            // 273/200
           if ((intX >= 270) and (intY = 200)) then  begin
              dm.KeyUp(37);
              dm.KeyDown(39);
           end;

           if ((intX = 339) and (intY = 200)) then  begin
               sleep(500);
               dm.KeyPress(85);
               sleep(200);
               dm.KeyPress(85);
               sleep(3500);
               dm.KeyPress(73);
               sleep(100);
               dm.KeyPress(73);
               sleep(800);
           end;

           if ((intX = 111) and (intY = 290)) then  begin
              dm.KeyUp(37);
              dm.KeyDown(39);
           end;

       end;
  end;
end;

//昭和村 武器库
procedure OnWork13(dm: Idmsoft);
var
  isRuning: Boolean;
  count: Integer;
  isLeft: Boolean;
  isRight: Boolean;
  i: Integer;
  o: Integer;
  p: Integer;

  dm_ret: Integer;

  intX: OleVariant;
  intY: OleVariant;
//
//      u 85     主攻
//                   i 73      闪现
//                   o 79       宏技能
//                   p 80        喂宠
//                     空格  32     跳跃
//                     f6   117
//                   left 37
//                   right 39
//                    up   38
//                     down  40
begin
  isRuning := True;
  isLeft := True;
  isRight := False;

  dm.KeyDown(37);
  //0,190,430,310,宽高(430,120)
  while isRuning do  begin
       while isLeft do  begin
            dm_ret := dm.FindPic(0,190,430,310,'my.bmp','000000',1,0,intX,intY);
            if (intX >= 0) and (intY >= 0) then begin
            // 17/218
              if intX <= 67  then begin
               isLeft := False;
               isRight := True;
               dm.KeyUp(37);
               dm.KeyDown(39);
              end;

             sleep(1000);
             dm.KeyPress(73);
             sleep(800);
             dm.KeyPress(73);
             sleep(800);
             dm.KeyPress(85);
             sleep(100);
             dm.KeyPress(85);
             sleep(3000);
             dm.KeyPress(85);
             sleep(3500);

            end;
     end;

     //
     o := Random(3);
     if o = 0 then begin
        dm.KeyPress(79);
        sleep(3000);
     end;

     while isRight do  begin
          dm_ret := dm.FindPic(0,190,430,310,'my.bmp','000000',1,0,intX,intY);
             if (intX >= 0) and (intY >= 0) then begin
             //385/ 218
              if intX >= 355  then begin
                isRight := False;
                isLeft := True;
                dm.KeyUp(39);
                dm.KeyUp(32);
                dm.KeyDown(37);
              end;
             //267/218  跳跃开始     335/218 跳跃结束
              if (intX >= 267) and (intX <= 335) then begin
                  dm.KeyDown(32);
              end else begin

                  sleep(1000);
                  dm.KeyPress(73);
                  sleep(800);
                  dm.KeyPress(73);
                  sleep(800);
                  dm.KeyPress(85);
                  sleep(100);
                  dm.KeyPress(85);
                  sleep(3000);
                  dm.KeyPress(85);
                  sleep(3500);
              end;

            end;
      end;

     p := Random(5);
     if p = 0 then begin
       dm.KeyPress(80);
       sleep(500);
     end;
     count := count + 1;
  end;

end;

procedure WorkThread.Execute;
begin
  //Self.item := 0;
  dm := CreateComObjectFromDll(CLASS_dmsoft, LoadLibrary('dm.dll')) as Idmsoft;
  //设置全局路径
  dm.SetPath('\');
  dm.SetDict(0,'dm_soft.txt');
  hwnd := dm.FindWindow('MapleStoryClass', 'MapleStory');

  dm.SetWindowState(hwnd, 12);
  //bindCode := dm.BindWindowEx(hwnd, 'gdi', 'normal', 'dx', '',0);
//  if dm.BindWindowEx(Self.hwnd, 'normal', 'normal', 'normal', '',0) <> 1 then begin
//    Exit;
//  end;

if dm.BindWindowEx(Self.hwnd, 'normal', 'normal', 'dx', '',0) = 1 then begin
    dm.MoveWindow(hwnd,0,0);
  end else begin
    ShowMessage('WorkThread失败');
    Exit;
  end;

case item of
        // 0 测试
        0: begin
            OnWork0(dm);
          end;
        1: begin
//        //通用定点
            OnWork1(dm);
         end;

         2: begin
            //黑羊领土底层
             OnWork2(dm);
         end;

         3: begin
          //仙人掌球
            OnWork3(dm);
         end;

         4: begin
         //长枪牛魔王
            OnWork4(dm);
         end;

         5: begin
         //主教牛魔王剧情
             OnWork5(dm);
         end;

         6: begin
          //昭和内部街道2

           OnWork6_Mage(dm);
           
         end;

         7: begin
           //黑羊领土底层 主教
           OnWork2_Mage(dm);
         end;

         8: begin
           //昭和内部街道2   优化
           OnWork6(dm);
         end;

         9: begin
           //老虎脚印小池塘
           OnWork9(dm);
         end;

         10: begin
           //海盗副本自动出图
           //OnWork10(dm);
           OnWork10_pic(dm);
         end;

         11: begin
           //阴森世界入口
           // 21  286   --  299  286
           OnWork11(dm);
         end;

         12: begin
            // 神木村 龙林3
           OnWork12(dm);
         end;

         13: begin
            // 昭和村 武器库
           OnWork13(dm);
         end;
end;




end;


end.
