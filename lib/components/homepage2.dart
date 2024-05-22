import 'package:apptubes/components/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:apptubes/screen/disasterscreen.dart';
import 'package:apptubes/screen/homescreen.dart';
import 'package:apptubes/screen/mitigationscreen.dart';
import 'package:apptubes/screen/reportscreen.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    DisasterScreen(),
    ReportScreen(),
    MitigationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}