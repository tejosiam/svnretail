import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:goldenlamian/MenuBar/Src/NavBar.dart';
import 'package:goldenlamian/pages/menu_page.dart';
import 'package:goldenlamian/pages/payment_page.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DesktopLayout(),
        endDrawer: Padding(
          padding: const EdgeInsets.only(
            top: 3,
            bottom: 3,
          ),
          child: ClipRRect(
            // give it your desired border radius
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            // wrap with a sizedbox for a custom width [for more flexibility]
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Drawer(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Best Sellers",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      trailing: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListPayment()),
                            );
                          }),
                    ),
                    Container(
                        height: 300.0,
                        width: 300.0,
                        child: DrawerHeader(
                            padding: EdgeInsets.zero,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: ExactAssetImage(
                                          "assets/images/menu-lamian-extraspicybeef.png"))),
                            ))),
                    Text(
                      "Lamian Extra Spicy Beef",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Text(
                      "Rp. 49.090",
                      style: TextStyle(color: Colors.orange, fontSize: 20.0),
                    ),
                    Container(
                      height: 120.0,
                      color: Colors.pink,
                    ),
                    Container(
                      height: 120.0,
                      color: Colors.yellow,
                    ),
                    //drawer stuffs
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: LayoutGrid(
        areas: '''
          nav    content
          nav    content
        ''',
        // A number of extension methods are provided for concise track sizing
        columnSizes: [300.px, 1.fr],
        rowSizes: [
          auto,
          1.fr,
        ],
        children: [
          Navigation().inGridArea('nav'),
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
