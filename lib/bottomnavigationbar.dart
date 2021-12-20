import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:india_today_task/astrologer_list.dart';

import 'home.dart';
import 'utility/images.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  TextStyle textStyle = const TextStyle(fontSize: 12.0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
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

      onTap: (newIndex) {
        setState(() {
          _currentIndex = newIndex;
          log("_currentIndex"+ _currentIndex.toString());
        });
        if (newIndex == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          return;
        } else if (newIndex == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AstrologerList()),
          );
          return;
        } else if (newIndex == 2) {
          return;
        } else if (newIndex == 3) {
          return;
        }
      },
    );
  }
}
