import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:goldenlamian/MenuBar/Src/CompanyName.dart';
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
      color: Colors.green,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: 50.0)),
          CompanyName(),
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
          NavBarItem(
            gambar: Image.asset(
              "assets/images/icon-04.png",
              height: 45.0,
            ),
            teks: 'Lamian',
            active: selected[2],
            touched: () {
              setState(() {
                select(2);
              });
            },
          ),
          NavBarItem(
            gambar: Image.asset(
              "assets/images/icon-05.png",
              height: 45.0,
            ),
            teks: 'Hainan Rice',
            active: selected[3],
            touched: () {
              setState(() {
                select(3);
              });
            },
          ),
          NavBarItem(
            gambar: Image.asset(
              "assets/images/icon-06.png",
              height: 45.0,
            ),
            teks: 'Dimsum',
            active: selected[4],
            touched: () {
              setState(() {
                select(4);
              });
            },
          ),
          NavBarItem(
            gambar: Image.asset(
              "assets/images/icon-07.png",
              height: 45.0,
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
