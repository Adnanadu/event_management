import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Name'),
          )
        ],
      ),
    );
  }
}
