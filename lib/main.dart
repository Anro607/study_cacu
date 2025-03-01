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
        OutlinedButton button0 = buttons('0', orientation, setstate: setState);

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                buttons('RESET', orientation, setstate: setState),
                gap1,
                buttons('ERASE', orientation, setstate: setState),
              ],
            ),
            gap3,
            caculateBox(orientation),
            gap4,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: orientation == Orientation.portrait
                  ? [
                      buttons('^', orientation, setstate: setState),
                      gap2,
                      buttons('(', orientation, setstate: setState),
                      gap2,
                      buttons(')', orientation, setstate: setState),
                      gap2,
                      buttons('=', orientation, setstate: setState),
                    ]
                  : [
                      buttons('+', orientation, setstate: setState),
                      gap2,
                      buttons('^', orientation, setstate: setState),
                      gap2,
                      buttons('(', orientation, setstate: setState),
                      gap2,
                      buttons(')', orientation, setstate: setState),
                      gap2,
                      buttons('=', orientation, setstate: setState),
                    ],
            ),
            gap5,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: orientation == Orientation.portrait
                  ? [
                      buttons('7', orientation, setstate: setState),
                      gap2,
                      buttons('8', orientation, setstate: setState),
                      gap2,
                      buttons('9', orientation, setstate: setState),
                      gap2,
                      buttons('+', orientation, setstate: setState),
                    ]
                  : [
                      buttons('-', orientation, setstate: setState),
                      gap2,
                      buttons('7', orientation, setstate: setState),
                      gap2,
                      buttons('8', orientation, setstate: setState),
                      gap2,
                      buttons('9', orientation, setstate: setState),
                      gap2,
                      buttons('/', orientation, setstate: setState),
                    ],
            ),
            gap5,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: orientation == Orientation.portrait
                  ? [
                      buttons('4', orientation, setstate: setState),
                      gap2,
                      buttons('5', orientation, setstate: setState),
                      gap2,
                      buttons('6', orientation, setstate: setState),
                      gap2,
                      buttons('-', orientation, setstate: setState),
                    ]
                  : [
                      buttons('*', orientation, setstate: setState),
                      gap2,
                      buttons('4', orientation, setstate: setState),
                      gap2,
                      buttons('5', orientation, setstate: setState),
                      gap2,
                      buttons('6', orientation, setstate: setState),
                      gap2,
                      buttons('%', orientation, setstate: setState),
                    ],
            ),
            gap5,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: orientation == Orientation.portrait
                  ? [
                      buttons('1', orientation, setstate: setState),
                      gap2,
                      buttons('2', orientation, setstate: setState),
                      gap2,
                      buttons('3', orientation, setstate: setState),
                      gap2,
                      buttons('*', orientation, setstate: setState),
                    ]
                  : [
                      buttons('0', orientation, setstate: setState),
                      gap2,
                      buttons('1', orientation, setstate: setState),
                      gap2,
                      buttons('2', orientation, setstate: setState),
                      gap2,
                      buttons('3', orientation, setstate: setState),
                      gap2,
                      buttons('.', orientation, setstate: setState),
                    ],
            ),
            gap6,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: orientation == Orientation.portrait
                  ? [
                      buttons('%', orientation, setstate: setState),
                      gap2,
                      buttons('0', orientation, setstate: setState),
                      gap2,
                      buttons('.', orientation, setstate: setState),
                      gap2,
                      buttons('/', orientation, setstate: setState),
                    ]
                  : [],
            ),
          ],
        );
      })),
    );
  }
}
