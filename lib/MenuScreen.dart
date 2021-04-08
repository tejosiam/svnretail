import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:goldenlamian/MenuBar/Src/NavBar.dart';
import 'package:goldenlamian/pages/menu_page.dart';

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
          Header().inGridArea('header'),
          Content().inGridArea('content'),
        ],
      ),
    );
  }
}

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
      color: Colors.white,
      child: Container(
        child: NavBar(),
      ));
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        child: Container(
          child: MenuPage(),
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
