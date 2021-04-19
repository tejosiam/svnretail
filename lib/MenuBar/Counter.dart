import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  String title;
  Counter({this.title});
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _n = 0;

  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      _n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _n != 0
              ? FloatingActionButton(
                  onPressed: minus,
                  child: Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.white,
                )
              : Container(
                  child: FloatingActionButton(
                    onPressed: null,
                    backgroundColor: Colors.white,
                  ),
                ),
          Padding(padding: EdgeInsets.only(left: 15.0)),
          Text(
            '$_n',
            style: TextStyle(fontSize: 30.0),
          ),
          Padding(padding: EdgeInsets.only(right: 15.0)),
          FloatingActionButton(
            onPressed: add,
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
