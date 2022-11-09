import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:posa_bottom_bar/posa_bottom_bar.dart';
import 'page_test.dart';
// import 'posa_bottom_bar.dart';
// Don't forgot to give me a stars  GITHUB {`HMIDA71`}.

int currentIndex = 0;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POSA BOTTOM BAR EXAMPLE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pages = [
    const PageTest(),
    const PageTest(),
    const PageTest(),
    const PageTest(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POSA BOTTOM BAR"),
        centerTitle: true,
      ),
      body: PosaBottomBar(
        // CHILD IS REQUIRED
        child: pages
            .elementAt(currentIndex), // ADD HERE YOUR PAGE OR PAGES NAVIGATOR
        // ICONS IS REQUIRED
        icons: const [
          Ionicons.home_outline,
          Ionicons.settings_outline,
          Ionicons.bookmark_outline,
          Ionicons.person_outline,
        ],
        // ONCHANGE IS REQUIRED
        onChanged: (i) {
          setState(() {
            debugPrint("TAP $i");
            currentIndex = i;
          });
        },
        // ON LONG PRESS FNC
        onLongPress: (i) {
          setState(() {
            debugPrint("LONG PRESS $i");
          });
        },
        alignment: Alignment.bottomCenter,// Aligment of bottom bar
        // ------ height and margin for bottom bar ----- //
        height: 0.16,
        margin: 0.05,
        // ------  ----- //

        // ------ Elevation & Color for bottom bar ----- //
        elevation: 10,
        shadowColor: Colors.black,
        // ------  ----- //

        borderRadius: 35, // RADUIS (FOR BOTTOM BAR)
        backgroundColor: Colors.blueAccent, // BACKGROUND COLORS (FOR BOTTOM BAR)
        dotColor: Colors.white, // COLORS OF DOT
        iconColor: Colors.white, // COLORS OF ICON
        dotSize: 5.0, iconSize: 24.0, // SIZE OF DOT AND ICONS

        // ------ Animation elevation and opacity /// (`MAKE REFRESH`)  ----- //
        isElevationAnimation: true,
        elevationAnimationOpacity: 0.3,
        elevationAnimationDuration: const Duration(milliseconds: 1500),
        // ------  ----- //

        // ------ Animation Icons ------ //
        isAnimatedIcon: true,
        // ------  ------ //
      ),
    );
  }
}
