import 'package:flutter/material.dart';

class NavBarItem extends StatefulWidget {
  final String teks;
  final Function touched;
  final bool active;
  final Image gambar;

  NavBarItem({this.teks, this.touched, this.active, this.gambar});
  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: () {
            widget.touched();
          },
          splashColor: Colors.white,
          hoverColor: Colors.white12,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: widget.gambar,
                    ),
                    Padding(padding: EdgeInsets.only(left: 20.0)),
                    AnimatedContainer(
                      margin: EdgeInsets.only(left: 15.0),
                      alignment: Alignment.centerLeft,
                      duration: Duration(milliseconds: 475),
                      height: 40.0,
                      width: 180.0,
                      decoration: BoxDecoration(
                        color: widget.active
                            ? Colors.orange[200]
                            : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                      ),
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        widget.teks,
                        style: TextStyle(
                            color: Colors.orange[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
