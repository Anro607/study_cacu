import 'package:flutter/material.dart';
import 'gs25.dart';
import 'main.dart';
/*erase, reset | 보라버튼 | 흰색버튼
버튼(문자명){
  문자

  버튼(this.문자)

  ~걍버튼세팅~
  테마에....if를 넣으면 될라나?
}

이러고 나중에 ui만드는 문서엔
그...열5개그거 오티빌드해서 가로세로 때 버튼(뭐) 공백(가로) 버튼(시) 공백(가로) 버튼(기)
이따구 다 조정해주기?
개힘들것같으니까공백먼저만들어볼까

named constructors 오, 이걸로 버튼 3개 다 하나 안에 지정해줄까
어차피 테마변수는똑가틀거니까....

음? gap해봤는데 걍 버튼return해도될것같은느낌이
*/

Container caculateBox(Orientation orientation) {
  return Container(
    width: orientation == Orientation.portrait ? 329 : 563,
    height: orientation == Orientation.portrait ? 162 : 127,
    padding: EdgeInsets.all(10),
    alignment: Alignment.centerRight,
    decoration: BoxDecoration(
      border: Border.all(width: 3.0, color: Color.fromARGB(255, 233, 215, 255)),
      borderRadius: BorderRadius.circular(4.0),
      image: DecorationImage(
          image: AssetImage('assets/nyang.jpg'),
          fit: BoxFit.fill,
          colorFilter:
              ColorFilter.mode(Colors.black.withAlpha(a), BlendMode.dstATop)),
    ),
    child: Text(
      gyesan,
      style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 201, 183, 255)),
      textAlign: TextAlign.right,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    ),
  );
}

SizedBox gap(String heightORwidth, int idx, Orientation orientation) {
  SizedBox gap = SizedBox(width: 300, height: 300);
  if (heightORwidth == 'height') {
    return gap = switch (idx) {
      1 => SizedBox(height: orientation == Orientation.portrait ? 22 : 3),
      2 => SizedBox(height: orientation == Orientation.portrait ? 34 : 3),
      3 => SizedBox(height: orientation == Orientation.portrait ? 22 : 1),
      4 => SizedBox(height: orientation == Orientation.portrait ? 22 : 0),
      _ => SizedBox(),
    };
  } else {
    return gap = switch (idx) {
      1 => SizedBox(width: 22),
      2 => SizedBox(width: orientation == Orientation.portrait ? 16 : 24),
      _ => SizedBox(),
    };
  }
}

OutlinedButton buttons(String text, Orientation orientation,
    {required void Function(void Function()) setstate}) {
  int idx; // 1:흰색 2:보라색 3:리셋지우개
  idx = (numb.contains(text) && text != '.')
      ? 1
      : (giho.contains(text) || text == '.' || text == '=')
          ? 2
          : 3;

  OutlinedButton button = OutlinedButton(
      style: OutlinedButton.styleFrom(
          fixedSize: switch (idx) {
            1 || 2 => orientation == Orientation.portrait
                ? const Size(70, 70)
                : const Size(94, 40),
            3 => orientation == Orientation.portrait
                ? const Size(155, 47)
                : const Size(271, 40),
            _ => Size(0, 0),
          },
          foregroundColor: switch (idx) {
            1 => Color.fromARGB(255, 201, 183, 255),
            2 || 3 => Colors.white,
            _ => Colors.white,
          },
          backgroundColor: switch (idx) {
            1 => Colors.white,
            2 || 3 => Color.fromARGB(255, 233, 215, 255),
            _ => Colors.white,
          },
          overlayColor: switch (idx) {
            1 => Color.fromARGB(255, 176, 91, 255),
            2 || 3 => Color.fromARGB(255, 151, 39, 255),
            _ => Colors.white,
          },
          side: BorderSide(
              color: switch (idx) {
                1 => Color.fromARGB(255, 229, 208, 255),
                2 || 3 => Color.fromARGB(255, 233, 215, 255),
                _ => Colors.white,
              },
              width: 3),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          textStyle: TextStyle(
            fontSize: switch (idx) {
              1 || 2 => orientation == Orientation.portrait ? 36 : 25,
              3 => 20.0,
              _ => 0,
            },
            fontWeight: switch (idx) {
              1 => FontWeight.normal,
              2 || 3 => FontWeight.bold,
              _ => FontWeight.normal,
            },
          )),
      onPressed: () {
        setstate(() {
          gs25(text);
        });
      },
      child: Text(text));
  return button;
}
