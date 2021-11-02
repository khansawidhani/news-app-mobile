import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  String title = "Signup Page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.red[400],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.amber[700]),
              accountName: const Text("Khansa Widhani"),
              accountEmail: const Text("khansa.ashraf23@gmail.com"),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.teal,
                child: Text("K", style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Colors.red[300], backgroundBlendMode: BlendMode.darken),
          ),
          ListView(children: const <Widget>[
            ListTile(
              title: Text("Heeloo name"),
              trailing: Icon(Icons.title),
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Text("K"),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
