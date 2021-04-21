import 'package:flutter/material.dart';
import 'package:goldenlamian/pages/payment_page.dart';
import 'package:goldenlamian/view/Counter.dart';

class DrawerMenu extends StatefulWidget {
  final String sku;
  final String nama;
  final String price;

  DrawerMenu(this.sku, this.nama, this.price);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ListTile(
          dense: true,
          title: Text(
            widget.sku,
            style: TextStyle(fontSize: 20.0),
          ),
          trailing: IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListPayment()));
              }),
        ),
        Container(
            color: Colors.red,
            height: 250.0,
            width: 250.0,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: ExactAssetImage("#"))),
            )),
        Text(
          widget.nama,
          style: TextStyle(fontSize: 15.0),
        ),
        Text(
          widget.price,
          style: TextStyle(color: Colors.orange, fontSize: 20.0),
        ),
        Material(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0),
            ),
          ],
        )),
        Counter(),
        Expanded(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: InkWell(
                    child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.yellow[800],
                        child: Center(
                          child: Text("Add to Order",
                              style: TextStyle(
                                color: Colors.red[800],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        )),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => ListPayment(),
                        )))
                //drawer stuffs
                ))
      ],
    );
  }
}
