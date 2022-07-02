import 'package:finalprojectpmo/screens/requirement.dart';
import 'package:finalprojectpmo/screens/profile.dart';
import 'package:finalprojectpmo/screens/square.dart';
import 'package:finalprojectpmo/screens/homepage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Dashboard',
        ),
        backgroundColor: const Color(0xffcd0000),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader( // <-- SEE HERE
              decoration: BoxDecoration(color: const Color(0xFFF44336)),
              accountName: Text(
                "Arief Ade I",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "ariefade1@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: FlutterLogo(),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeSc()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_mark,
              ),
              title: const Text('Persyaratan Pendonor'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Requirement()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
              ),
              title: const Text('Logout'),
              onTap: () => Navigator.pushReplacementNamed(context, '/')
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}