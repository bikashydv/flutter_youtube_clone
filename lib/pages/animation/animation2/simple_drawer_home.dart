import 'package:flutter/material.dart';

class SimpleHomeDrawer extends StatelessWidget {
  const SimpleHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey,
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blueGrey),
                  accountName: const Text(
                    "Bikash",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  accountEmail: Text("bikash@gmail.com"),
                  currentAccountPicture: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                  ),
                ),
              ),
              _drawerItem(
                  title: "Activities",
                  iconData: Icons.add_shopping_cart_outlined),
              _drawerItem(title: "Edit User Profile", iconData: Icons.edit),
              _drawerItem(title: "Contact", iconData: Icons.add_call),
              _drawerItem(title: "Logout", iconData: Icons.exit_to_app),
            ],
          ),
        ),
      ),
      body: Column(
        children: [_header()],
      ),
    );
  }

  Widget _header() {
    return Container(
      height: 250,
      width: double.infinity,
      color: Colors.blueGrey,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.menu),
                Text(
                  "day11",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Icon(Icons.notifications_none_outlined)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _drawerItem({required String title, required IconData iconData}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      leading: Icon(iconData),
    );
  }
}
