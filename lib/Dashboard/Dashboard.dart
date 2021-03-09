import 'package:flutter/material.dart';
import 'package:goldenlamian/Dashboard/src/MenuCard.dart';
import 'package:goldenlamian/Dashboard/src/Tabs.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 350.0,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.70,
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: <Widget>[
                      new MenuCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
