import 'package:flutter/material.dart';
import 'package:padak_padak/grid_page.dart';
import 'package:padak_padak/list_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Movie'),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.sort),
              onSelected: (value) {
                if (value == 0) {
                  print("예메율순");
                } else if (value == 1) {
                  print("큐레이션");
                } else {
                  print("최신순");
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(child: Text("예매율순"), value: 0),
                  PopupMenuItem(child: Text("큐레이션"), value: 1),
                  PopupMenuItem(child: Text("최신순"), value: 2)
                ];
              })
        ],
      ),
      body: _buildPage(_selectedTabIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.view_list), label: "List"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_on), label: "Grid"),
        ],
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
          print("$_selectedTabIndex Tab Clicked");
        },
      ),
    );
  }
}

Widget _buildPage(index) {
  if (index == 0) {
    return ListPage();
  } else {
    return GridPage();
  }
}
