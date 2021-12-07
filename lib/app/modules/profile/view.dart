// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/app/data/model/boxes.dart';
import 'package:news_app_flutter/app/modules/user_auth/controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final String localUser = Boxes.getLocalUser().isNotEmpty
      ? Boxes.getLocalUser().values.first.uid
      : "No user";
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      localUser == "No user" ? 
      Center(
        child: ElevatedButton(child: Text('Login or signup'), onPressed: (){Get.toNamed('/login');}, ),
      )
      :
      ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.red.shade800),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/236x/aa/c8/27/aac827a17c5e7749823cc09cc8dbeec7.jpg'),
            ),
            accountName: Text('Khansa Widhani'),
            accountEmail: Text('khansa.ashraf23@gmail.com'),
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.red.shade600),
            ),
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.red.shade600,
            ),
            onTap: () async {
              authController.signOut();
            },
          ),
        ],
      ),
    );
  }
}
