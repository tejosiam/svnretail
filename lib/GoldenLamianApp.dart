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
    return Scaffold(
      body: Row(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.50,
          color: Colors.grey[50],
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Column(children: [
                    Image.asset(
                      "assets/images/frame_icon-01.png",
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 5,
                      height: 35.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red[900]),
                      child: Text(
                        "DINE IN",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            backgroundColor: Colors.red[900],
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
                )
              ]),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.50,
          color: Colors.grey[50],
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(children: [
                    Image.asset(
                      "assets/images/frame_icon-02.png",
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 5,
                      height: 35.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red[900]),
                      child: Text(
                        "TAKE AWAY",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            backgroundColor: Colors.red[900],
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
                )
              ]),
        ),
      ]),
    );
  }
}
