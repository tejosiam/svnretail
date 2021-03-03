import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldenlamian/MenuScreen.dart';

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Home Page';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuScreen()),
            ),
            child: const Text('to MenuPage', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
