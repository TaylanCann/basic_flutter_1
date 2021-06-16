import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motion Tab Bar Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Motion Tab Bar Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  MotionTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MotionTabBar(
          labels: ["Account", "Home", "Dashboard"],
          initialSelectedTab: "Home",
          tabIconColor: Colors.green,
          tabSelectedColor: Colors.red,
          onTabItemSelected: (int value) {
            print(value);
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [Icons.account_box, Icons.home, Icons.menu],
          textStyle: TextStyle(color: Colors.red),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 150,
                height: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: 1,
                      backgroundColor: Colors.grey,
                      strokeWidth: 100,
                    ),
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      value: 0.4,
                      strokeWidth: 100,
                    ),
                    FlutterAnalogClock(
                      dateTime: DateTime.now(),
                      dialPlateColor: Colors.white10,
                      hourHandColor: Colors.black,
                      minuteHandColor: Colors.black,
                      secondHandColor: Colors.black,
                      numberColor: Colors.blue,
                      borderColor: Colors.deepPurple,
                      tickColor: Colors.black,
                      centerPointColor: Colors.black,
                      showBorder: true,
                      showTicks: true,
                      showMinuteHand: true,
                      showSecondHand: true,
                      showNumber: true,
                      borderWidth: 10.0,
                      hourNumberScale: .10,
                      hourNumbers: [
                        'I',
                        'II',
                        'III',
                        'IV',
                        'V',
                        'VI',
                        'VII',
                        'VIII',
                        'IX',
                        'X',
                        'XI',
                        'XII'
                      ],
                      isLive: true,
                      width: 200.0,
                      height: 200.0,
                      decoration: const BoxDecoration(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
/*   MotionTabBarView(
              controller: _tabController,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Text("Account"),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text("Home"),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text("Dashboard"),
                  ),
                ),
              ],
            ),*/
/*
*/
