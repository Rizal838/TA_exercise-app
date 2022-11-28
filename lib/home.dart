import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:exercise_app/chest.dart';
import 'package:exercise_app/chestapi.dart';
import 'package:exercise_app/chestpage.dart';
import 'package:exercise_app/forearm.dart';
import 'package:exercise_app/forearmapi.dart';
import 'package:exercise_app/forearmpage.dart';
import 'package:exercise_app/about.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  int currentindex = 0;
  final screens = [ChestPage(),ForearmPage(),AboutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
       bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentindex,
            onTap: (index) => setState(() => currentindex = index),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Chest'),
              BottomNavigationBarItem(icon: Icon(Icons.sports_gymnastics), label: 'Forearm'),
              BottomNavigationBarItem(icon: Icon(Icons.help_outline), label: 'About')
            ])
    );
  }
}
