import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldenlamian/Dashboard/Dashboard.dart';
import 'package:goldenlamian/Menubar/CategoryBar.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            CategoryBar(),
            Dashboard(),
          ],
        ),
      ),
    );
  }
}
