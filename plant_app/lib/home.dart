import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plant_app/addPlant.dart';
import 'package:plant_app/myPlant.dart';
import 'package:plant_app/scannerPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var title = "Plant Care";
  int _currentIndex = 0;
  final List<Widget> _screens = [ScannerPage(), AddPlant(), MyPlant()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(title, style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.green,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.barcode_scanner_20_filled),
            label: "Scan",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.add_12_filled),
            label: "Add Plant",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.leaf_one_16_filled),
            label: "My Plants",
          ),
        ],
      ),
    );
    ;
  }
}
