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
          nav header
          nav    content
          nav    content
        ''',
        // A number of extension methods are provided for concise track sizing
        columnSizes: [300.px, 1.fr],
        rowSizes: [
          150.px,
          auto,
          1.fr,
        ],
        children: [
          Navigation().inGridArea('nav'),
          Content().inGridArea('content'),
          Header().inGridArea('header'),
        ],
      ),
    );
  }
}

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
      color: Colors.grey[300],
      child: Container(
        child: NavBar(),
      ));
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

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.blue[300],
        child: ListView(children: []),
      );
}
