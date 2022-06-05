import 'package:flutter/material.dart';

import '../../main.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Palette.PrimaryColor,
      child: Stack(
        children: [
          Container(
            color: Palette.PrimaryColor,
            child: SafeArea(
              child: ListView(
                children: [
                  // Container(
                  //   child: Image(image : AssetImage('images/trading_stats.jpg'), fit: BoxFit.cover,),
                  // ),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        height: 150.0,
                        child: Center(
                          child: Image(image : AssetImage('images/academy.png'),
                            width: 150,height: 100.0,),
                        ),
                      ),
                    ],
                  ),
                  buildMenuItems(title: "My Profile", icon: Icons.account_circle,context: context, which: 'profile'),
                  buildMenuItems(title: "Results", icon: Icons.account_circle,context: context, which: 'results'),
                  buildMenuItems(title: "Settings", icon: Icons.settings,context: context, which: 'settings'),
                  buildMenuItems(title: "About", icon: Icons.info,context: context, which: 'about'),
                  buildMenuItems(title: "Contact", icon: Icons.phone,context: context, which: 'contact'),
                  buildMenuItems(title: "Log Out", icon: Icons.logout,context: context, which: 'log_out'),
                  Container(
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget buildMenuItems({
    required String title,
    required IconData icon,required BuildContext context,required String which
  })
  {
    final color = Colors.black;
    final hoverColor = Colors.white70;

    return Material(
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon,color: color,size: 30.0,),
        title: Text(title,style: TextStyle(color: color,fontSize: 16.0),),
        hoverColor: hoverColor,
        onTap: () async {
        },
      ),
    );
  }
}
