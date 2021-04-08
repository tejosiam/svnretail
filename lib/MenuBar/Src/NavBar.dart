import 'package:flutter/material.dart';
import 'package:goldenlamian/MenuBar/Src/NavBarItem.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<bool> selected = [true, false, false, false, false, false];
  void select(int n) {
    for (int i = 0; i <= 5; i++) {
      if (i != n) {
        selected[i] = false;
      } else {
        selected[i] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Container(
            height: 50.0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
            top: 80.0,
          )),
          NavBarItem(
            teks: 'Best Sellers',
            gambar: Image.asset(
              "assets/images/icon-02.png",
            ),
            active: selected[0],
            touched: () {
              setState(() {
                select(0);
              });
            },
          ),
          Padding(
              padding: EdgeInsets.only(
            top: 5.0,
          )),
          NavBarItem(
            gambar: Image.asset(
              "assets/images/icon-03.png",
            ),
            teks: 'Value Meals',
            active: selected[1],
            touched: () {
              setState(() {
                select(1);
              });
            },
          ),
          Padding(
              padding: EdgeInsets.only(
            top: 5.0,
          )),
          NavBarItem(
            gambar: Image.asset(
              "assets/images/icon-04.png",
            ),
            teks: 'Lamian',
            active: selected[2],
            touched: () {
              setState(() {
                select(2);
              });
            },
          ),
          Padding(
              padding: EdgeInsets.only(
            top: 5.0,
          )),
          NavBarItem(
            gambar: Image.asset(
              "assets/images/icon-05.png",
            ),
            teks: 'Hainan Rice',
            active: selected[3],
            touched: () {
              setState(() {
                select(3);
              });
            },
          ),
          Padding(
              padding: EdgeInsets.only(
            top: 5.0,
          )),
          NavBarItem(
            gambar: Image.asset(
              "assets/images/icon-06.png",
            ),
            teks: 'Dimsum',
            active: selected[4],
            touched: () {
              setState(() {
                select(4);
              });
            },
          ),
          Padding(
              padding: EdgeInsets.only(
            top: 5.0,
          )),
          NavBarItem(
            gambar: Image.asset(
              "assets/images/icon-07.png",
            ),
            teks: 'Drinks and Deserts',
            active: selected[5],
            touched: () {
              setState(() {
                select(5);
              });
            },
          ),
        ],
      ),
    );
  }
}
