import 'package:demo_app/presentation/home/page/home_page.dart';
import 'package:demo_app/presentation/home/widgets/AnagramContent.dart';
import 'package:demo_app/presentation/home/widgets/IsogramContent.dart';
import 'package:demo_app/presentation/home/widgets/pangram_content.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage> {
  int myCurrentIndex;
  Widget page;
  String _title;

  List<Widget> pages = [HomePage(), AnagramContent(), IsogramContent()];

  List<String> _pageTitle = ["Pangram", "Anagram", "Isogram"];

  @override
  void initState() {
    super.initState();
    page = pages[0];
    myCurrentIndex = 0;
    // _title = "Dashboard";
  }

  void _updateCurrentProject(int index) {
    setState(() {
      myCurrentIndex = index;
      page = pages[index];
    });
  }

  final List<BottomNavigationBarItem> _bottomNavigators = [
    BottomNavigationBarItem(
      // backgroundColor: Colors.deepOrange,
      icon: Icon(Icons.home),
      title: Text('Pangram'),
    ),
    BottomNavigationBarItem(
        // backgroundColor: Colors.deepOrange,
        icon: Icon(Icons.dashboard),
        title: Text("Anagram")),
    BottomNavigationBarItem(
        // backgroundColor: Colors.deepOrange,
        icon: Icon(Icons.card_travel),
        title: Text("Isogram")),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> _drawersMenu = [
      AppBar(
        automaticallyImplyLeading: false,
        title: Text('Menu'),
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('Panagram'),
        onTap: () {
          _updateCurrentProject(0);
        },
      ),
      ListTile(
        leading: Icon(Icons.dashboard),
        title: Text('Anagram'),
        onTap: () {
          _updateCurrentProject(1);
        },
      ),
      ListTile(
        leading: Icon(Icons.card_travel),
        title: Text('Isogram'),
        onTap: () {
          _updateCurrentProject(2);
        },
      )
    ];
    return Scaffold(
      drawer: Drawer(
        child: Column(children: _drawersMenu),
      ),
      appBar: AppBar(
        title: Text(_pageTitle[myCurrentIndex]),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: myCurrentIndex,
        items: _bottomNavigators,
        onTap: _updateCurrentProject,
      ),
      body: page,
    );
  }
}
