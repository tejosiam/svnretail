import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 32.0),
      child: Row(
        children: [
          Text(
            'All',
          ),
          SizedBox(
            width: 15.0,
          ),
          Container(
            height: 25.0,
            width: 70.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Text(
                'Current',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            'Pending',
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            'Categorized',
          ),
        ],
      ),
    );
  }
}
