import 'package:flutter/material.dart';

import 'utility/images.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  TextStyle textStyle = const TextStyle(fontSize: 12.0);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.deepOrange,
      selectedLabelStyle: textStyle,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(Images.home),
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(Images.talk),
          ),
          label: "Talk to Astrologer",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(Images.ask),
          ),
          label: "Ask Questions",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(Images.report),
          ),
          label: "Reports",
        ),
        /* BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(Images.talk),
          ),
          label: "Chat with Astrologer",
        ), */
      ],
    );
  }
}
