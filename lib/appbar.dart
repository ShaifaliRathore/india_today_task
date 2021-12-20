import 'package:flutter/material.dart';
import 'utility/images.dart';

class AppBarHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(
        icon: Image.asset(
          Images.hamburger,
          height: 20.0,
          width: 20.0,
        ),
        tooltip: 'Menu',
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      title: Center(
        child: Image.asset(
          Images.logo,
          height: 60.0,
          width: 60.0,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: IconButton(
            icon: Image.asset(
              Images.profile,
              height: 25.0,
              width: 25.0,
            ),
            onPressed: null,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>const Size.fromHeight(60.0);
}
