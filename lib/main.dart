import 'package:flutter/material.dart';
import 'UIclasses.dart';

void main() {
  runApp(const MyApp());
}

//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // void test() {
  //   var imsetstate = setState;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Center(child: OrientationBuilder(builder: (context, orientation) {
        SizedBox gap1 = gap('width', 1, orientation);
        SizedBox gap2 = gap('width', 2, orientation);
        SizedBox gap3 = gap('height', 1, orientation);
        SizedBox gap4 = gap('height', 2, orientation);
        SizedBox gap5 = gap('height', 3, orientation);
        SizedBox gap6 = gap('height', 4, orientation);
        OutlinedButton buttonRe =
            buttons('RESET', orientation, setstate: setState);
        OutlinedButton buttonEr =
            buttons('ERASE', orientation, setstate: setState);
        OutlinedButton buttonPow =
            buttons('^', orientation, setstate: setState);
        OutlinedButton buttonOpenParen =
            buttons('(', orientation, setstate: setState);
        OutlinedButton buttonCloseParen =
            buttons(')', orientation, setstate: setState);
        OutlinedButton buttonEqual =
            buttons('=', orientation, setstate: setState);
        OutlinedButton buttonAdd =
            buttons('+', orientation, setstate: setState);
        OutlinedButton buttonSub =
            buttons('-', orientation, setstate: setState);
        OutlinedButton buttonMul =
            buttons('*', orientation, setstate: setState);
        OutlinedButton buttonDiv =
            buttons('/', orientation, setstate: setState);
        OutlinedButton buttonMod =
            buttons('%', orientation, setstate: setState);
        OutlinedButton buttonDot =
            buttons('.', orientation, setstate: setState);

        OutlinedButton button0 = buttons('0', orientation, setstate: setState);
        OutlinedButton button1 = buttons('1', orientation, setstate: setState);
        OutlinedButton button2 = buttons('2', orientation, setstate: setState);
        OutlinedButton button3 = buttons('3', orientation, setstate: setState);
        OutlinedButton button4 = buttons('4', orientation, setstate: setState);
        OutlinedButton button5 = buttons('5', orientation, setstate: setState);
        OutlinedButton button6 = buttons('6', orientation, setstate: setState);
        OutlinedButton button7 = buttons('7', orientation, setstate: setState);
        OutlinedButton button8 = buttons('8', orientation, setstate: setState);
        OutlinedButton button9 = buttons('9', orientation, setstate: setState);

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [buttonRe, gap1, buttonEr],
            ),
            gap3,
            caculateBox(orientation),
            gap4,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: orientation == Orientation.portrait
                  ? [
                      buttonPow,
                      gap2,
                      buttonOpenParen,
                      gap2,
                      buttonCloseParen,
                      gap2,
                      buttonEqual
                    ]
                  : [
                      buttonAdd,
                      gap2,
                      buttonPow,
                      gap2,
                      buttonOpenParen,
                      gap2,
                      buttonCloseParen,
                      gap2,
                      buttonEqual
                    ],
            ),
            gap5,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: orientation == Orientation.portrait
                  ? [button7, gap2, button8, gap2, button9, gap2, buttonAdd]
                  : [
                      buttonSub,
                      gap2,
                      button7,
                      gap2,
                      button8,
                      gap2,
                      button9,
                      gap2,
                      buttonDiv
                    ],
            ),
            gap5,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: orientation == Orientation.portrait
                  ? [button4, gap2, button5, gap2, button6, gap2, buttonSub]
                  : [
                      buttonMul,
                      gap2,
                      button4,
                      gap2,
                      button5,
                      gap2,
                      button6,
                      gap2,
                      buttonMod
                    ],
            ),
            gap5,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: orientation == Orientation.portrait
                  ? [button1, gap2, button2, gap2, button3, gap2, buttonMul]
                  : [
                      button0,
                      gap2,
                      button1,
                      gap2,
                      button2,
                      gap2,
                      button3,
                      gap2,
                      buttonDot
                    ],
            ),
            gap6,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: orientation == Orientation.portrait
                  ? [buttonMod, gap2, button0, gap2, buttonDot, gap2, buttonDiv]
                  : [],
            ),
          ],
        );
      })),
    );
  }
}
