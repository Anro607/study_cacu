import 'package:dart_eval/dart_eval.dart';
import 'dart:math';

String gyesan = ''; //수식
int a = 0; //이미지 alpha
var numb = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.'];
var giho = ['^', '(', ')', '+', '-', '*', '/', '%'];

void gs25(String st) {
  a = 0; //수식오류여부초기화
  if (numb.contains(st)) {
    gyesan += st;
  } else if (giho.contains(st)) {
    gyesan += st;
  } else if (st == '=') {
    // debugPrint(gyesan);
    if (gyesan != '') {
      var gsList = []; //계산용 리스트

      gsList = gyesan.split('');
      // print(gsList);
      //숫자, 소숫점 합쳐주고 float화 해주기
      //인덱스 1부터 자기 앞에 숫자 있는 숫자면 앞에 애랑 합쳐주기... 이런 식이면 될라나?
      int t = 1;
      while (t <= gsList.length - 1) {
        if (giho.contains(gsList[t]) || giho.contains(gsList[t - 1])) {
          t++;
        } else {
          gsList[t - 1] += gsList[t];
          gsList.removeAt(t);
        }
      }
      for (int i = 0; i <= gsList.length - 1; i++) {
        if (!giho.contains(gsList[i]) && !gsList[i].contains('.')) {
          gsList[i] += '.0'; //여기서 실수로 형변환
        }
      }
      // print(gsList);
      try {
        eval(gsList.join('').replaceAll('^', '+'));

        while (gsList.contains('(')) {
          var gwOpIdx = []; //( 인덱스
          var gwClIdx = []; //) 인덱스
          var temp = [...gsList];
          while (temp.contains('(')) {
            //(랑 )가 무조건 같은 갯수라 하나만 체크해도 될.....걸?
            gwOpIdx.add(temp.lastIndexOf('('));
            gwClIdx.add(temp.lastIndexOf(')'));
            temp[temp.lastIndexOf('(')] = 'Op';
            temp[temp.lastIndexOf(')')] = 'Cl';
          }
          //op cl 합친 뒤 오름차순 정렬 후 op의 [0]을 찾은 것의 +1 인덱스 = 걔 cl
          temp.clear();
          temp.addAll(gwClIdx);
          temp.addAll(gwOpIdx);
          temp.sort();
          var op = gwOpIdx[0];
          var cl = temp[temp.indexOf(gwOpIdx[0]) + 1];
          var smallGw = gsList.sublist(op + 1, cl);
          //sublist 는 시작인덱스~끝인덱스'바로앞' 까지 잘라줌
          //^있으면 걔 먼저 해줘야 된다
          while (smallGw.contains('^')) {
            int ind = smallGw.indexOf('^');
            smallGw.insert(
                ind - 1,
                pow(double.parse(smallGw[ind - 1]),
                        double.parse(smallGw[ind + 1]))
                    .toString());
            smallGw.removeRange(ind, ind + 3);
          }
          // print(smallGw);
          gsList.insert(op, eval(smallGw.join('')).toString());
          gsList.removeRange(op + 1, cl + 2);
          gwOpIdx.remove(op);
          gwClIdx.remove(cl);
        }
        while (gsList.contains('^')) {
          int ind = gsList.indexOf('^');
          gsList.insert(
              ind - 1,
              pow(double.parse(gsList[ind - 1]), double.parse(gsList[ind + 1]))
                  .toString());
          gsList.removeRange(ind, ind + 3);
        }
        // print(gsList);
        // print(eval(gsList.join('')));
        gyesan = eval(gsList.join('')).toString();
        gsList = [];
      } catch (error) {
        a = 255;
        gyesan = '';
        // debugPrint('$error');
      }
    }
  } else if (st == 'ERASE') {
    if (gyesan.length <= 1) {
      gyesan = '';
    } else {
      gyesan = gyesan.substring(0, gyesan.length - 1);
    }
  } else if (st == 'RESET') {
    gyesan = '';
  }
}
