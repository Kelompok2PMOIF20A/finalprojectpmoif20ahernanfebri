import 'package:finalprojectpmo/screens/square.dart';
import 'package:finalprojectpmo/screens/requirement.dart';
import 'package:finalprojectpmo/screens/profile.dart';
import 'package:finalprojectpmo/screens/homepage.dart';
import 'package:finalprojectpmo/screens/navigation_drawer.dart';
import 'package:flutter/material.dart';

class HomeSc extends StatelessWidget {
  final List _posts = [
    'Nafis Maulidul\nnafismaul@gmail.com\n085712644127\nGolongan Darah B+',
    'Reza Tokitoki\nreza@gmail.com\n08151238712\nGolongan Darah AB-',
    'Joko Parjo\njoko@gmail.com\n0851157241\nGolongan Darah O',
  ];

  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Home',
          ),
          backgroundColor: const Color(0xffcd0000),
        ),

        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: _posts.length,
                  itemBuilder: (context, index) {
                    return MySquare(
                      child: _posts[index],
                    );
                  }),
            ),
          ],
        ),
      );
    }
  }
}