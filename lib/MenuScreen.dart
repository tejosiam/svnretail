import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:goldenlamian/MenuBar/Src/CompanyName.dart';
import 'package:goldenlamian/MenuBar/Src/NavBar.dart';
import 'package:goldenlamian/Dashboard/src/MenuCard.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return DesktopLayout();
        });
  }
}

class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: LayoutGrid(
        areas: '''
          nav    content
        ''',
        // A number of extension methods are provided for concise track sizing
        columnSizes: [
          300.px,
          1.fr,
        ],
        rowSizes: [
          1.fr,
        ],
        children: [
          Navigation().inGridArea('nav'),
          Content().inGridArea('content'),
        ],
      ),
    );
  }
}

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.purple,
        child: ListView(
          children: [
            CompanyName(),
            ElevatedButton(
              child: Text('Best Seller'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange[300],
                onPrimary: Colors.orange,
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontStyle: FontStyle.italic),
              ),
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/main');
              },
            ),
            NavBar(),
          ],
        ),
      );
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            MenuCard(),
          ],
        ),
      );
}
