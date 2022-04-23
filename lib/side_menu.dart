import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var drawerTextStyle = Theme.of(context).textTheme.headline3?.copyWith(
          color: Colors.white,
        );
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: ListView(
        padding: const EdgeInsets.only(left: 20, top: 32),
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              "User account",
              style: drawerTextStyle,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: Text(
              "My friends",
              style: drawerTextStyle,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: Text(
              "Search for new friends",
              style: drawerTextStyle,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: Text(
              "Contact",
              style: drawerTextStyle,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              "Settings",
              style: drawerTextStyle,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
