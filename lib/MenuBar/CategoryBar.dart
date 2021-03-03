import 'package:flutter/material.dart';
import 'package:goldenlamian/MenuBar/Src/CompanyName.dart';
import 'package:goldenlamian/MenuBar/Src/NavBar.dart';

class CategoryBar extends StatefulWidget {
  @override
  _CategoryBarState createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: 150.0,
          color: Color(0xff333951),
          child: Stack(
            children: [
              CompanyName(),
              Align(
                alignment: Alignment.center,
                child: NavBar(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: NavBarItem(
                  active: false,
                ),
              ),
            ],
          ),
        ));
  }
}
