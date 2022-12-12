import 'package:flutter/material.dart';

class SideBarScreen extends StatelessWidget {
  const SideBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:  [
          UserAccountsDrawerHeader(accountName: const Text('Ali'),
            accountEmail: const Text("ali@gmail.com"),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.asset('./assets/images/paysaw.jpg')
            ),
          ),
          ),
          const ListTile(
            title: Text('iPhone'),
            leading: Icon(Icons.phone_iphone),
            subtitle: Text("Sindhi"),
            trailing: Text('Follow'),
          ),
        ],
      ),

    );
  }
}
