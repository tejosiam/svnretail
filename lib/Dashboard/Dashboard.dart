import 'package:flutter/material.dart';
import 'package:goldenlamian/Dashboard/src/Tabs.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 150.0,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.63,
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
                child: Text(
                  'Ongoing Project',
                ),
              ),
              Tabs(),
              Container(
                margin: EdgeInsets.only(
                  top: 5.0,
                ),
                height: 200.0,
                width: MediaQuery.of(context).size.width * 0.63,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [],
                ),
              )
            ],
          ),
        ));
  }
}
