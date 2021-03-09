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
          height: MediaQuery.of(context).size.height,
          child: Material(
            child: InkWell(
                child: Ink(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[50],
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: Column(children: [
                            Image.asset(
                              "assets/images/frame_icon-01.png",
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.45,
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.red)),
                              color: Colors.red[900],
                              textColor: Colors.red,
                              padding: EdgeInsets.only(left: 85.0, right: 85.0),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MenuScreen()),
                                );
                              },
                              child: Text(
                                "Dine In".toUpperCase(),
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.029,
                                    backgroundColor: Colors.red[900],
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                        ),
                      ]),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MenuScreen(),
                    ))),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.50,
          height: MediaQuery.of(context).size.height,
          child: Material(
            child: InkWell(
                child: Ink(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[50],
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(children: [
                            Image.asset(
                              "assets/images/frame_icon-02.png",
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.45,
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.red)),
                              color: Colors.red[900],
                              textColor: Colors.red,
                              padding: EdgeInsets.only(left: 45.0, right: 45.0),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MenuScreen()),
                                );
                              },
                              child: Text(
                                "Take Away".toUpperCase(),
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.029,
                                    backgroundColor: Colors.red[900],
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                        )
                      ]),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MenuScreen(),
                    ))),
          ),
        ),
      ]),
    );
  }
}
