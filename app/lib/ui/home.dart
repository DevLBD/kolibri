import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kolibri/main.dart';
import 'package:kolibri/ui/pages/robot.dart';
import 'package:kolibri/ui/pages/drone.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Setting status and navigation bar colors.
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: color01,
      systemNavigationBarColor: color01,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    // Pages displayed by the app, which can be changed from the Bottom
    // Navigation Bar. These can be edited in /ui/pages/.
    final appPages = [
      const Robot(),
      const Drone(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kolibri App"),
        centerTitle: true,
        elevation: 0,
        shape: const Border(
          bottom: BorderSide(width: 2, color: Colors.black),
        ),
      ),

      // What the app will show. Indexed Stack saves all the pages so they keep
      // their state while they are not being used.
      body: IndexedStack(
        index: currentIndex,
        children: appPages,
      ),

      // Bottom Navigation Bar setup.
      bottomNavigationBar: Container(
        // Decorating the Navigation Bar with a border.
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(width: 2, color: Colors.black)),
          color: color01,
        ),
        padding: const EdgeInsets.all(6.5),
        // Setting the Bottom Navigation Bar as the container's child
        // and setting it up.
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: color01,
          currentIndex: currentIndex,
          elevation: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          // Bottom Navigation Bar icons.
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_people_rounded),
              label: "Robot",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.airplanemode_active_rounded),
              label: "Drone",
            ),
          ],
          onTap: (index) => setState(() => currentIndex = index),
        ),
      ),
    );
  }
}
