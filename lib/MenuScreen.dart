import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:goldenlamian/MenuBar/Counter.dart';
import 'package:goldenlamian/MenuBar/Src/NavBar.dart';
import 'package:goldenlamian/pages/menu_page.dart';
import 'package:goldenlamian/pages/payment_page.dart';
import 'package:mvc_application/view.dart';

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
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ListTile(
                      dense: true,
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
                                    builder: (context) => ListPayment()));
                          }),
                    ),
                    Container(
                        color: Colors.red,
                        height: 250.0,
                        width: 250.0,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: ExactAssetImage(
                                      "assets/images/WhatsApp Image 2021-04-15 at 14.42.03.jpeg"))),
                        )),
                    Text(
                      "Lamian Extra Spicy Beef",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Text(
                      "Rp. 49.090",
                      style: TextStyle(color: Colors.orange, fontSize: 20.0),
                    ),
                    Material(
                        child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15.0),
                        ),
                        RadioGroupMie(),
                        RadioGroupPedas(),
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
                                onTap: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ListPayment(),
                                    )))
                            //drawer stuffs
                            ))
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

class RadioGroupMie extends StatefulWidget {
  @override
  RadioGroupMieWidget createState() => RadioGroupMieWidget();
}

class MieList {
  String name;
  int index;
  MieList({this.name, this.index});
}

class RadioGroupMieWidget extends State {
  // Default Radio Button Item
  String radioItem = 'Mie Besar';

  // Group Value for Radio Button.
  int id = 1;

  List<MieList> mList = [
    MieList(
      index: 1,
      name: "Mie Besar",
    ),
    MieList(
      index: 2,
      name: "Mie Kecil",
    ),
  ];

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Level Mie",
          style: TextStyle(fontSize: 21.0),
        ),
        SizedBox(
            child: Container(
          padding: EdgeInsets.zero,
          child: Column(
            children: mList
                .map((data) => RadioListTile(
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        "${data.name}",
                        style: TextStyle(fontSize: 17.0),
                      ),
                      groupValue: id,
                      value: data.index,
                      onChanged: (val) {
                        setState(() {
                          radioItem = data.name;
                          id = data.index;
                        });
                      },
                    ))
                .toList(),
          ),
        )),
      ],
    );
  }
}

@override
class RadioGroupPedas extends StatefulWidget {
  @override
  RadioGroupPedasWidget createState() => RadioGroupPedasWidget();
}

class PedasList {
  String name;
  int index;
  PedasList({this.name, this.index});
}

class RadioGroupPedasWidget extends State {
  // Default Radio Button Item
  String radioItem = 'Level 1';

  // Group Value for Radio Button.
  int id = 1;

  List<PedasList> pList = [
    PedasList(
      index: 1,
      name: "Level 1",
    ),
    PedasList(
      index: 2,
      name: "Level 2",
    ),
    PedasList(
      index: 3,
      name: "Level 3",
    ),
  ];

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Level Kepedasan",
          style: TextStyle(fontSize: 21.0),
        ),
        SizedBox(
            child: Container(
          child: Column(
            children: pList
                .map(
                  (data) => (RadioListTile(
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      "${data.name}",
                      style: TextStyle(fontSize: 17.0),
                    ),
                    groupValue: id,
                    value: data.index,
                    onChanged: (val) {
                      setState(() {
                        radioItem = data.name;
                        id = data.index;
                      });
                    },
                  )),
                )
                .toList(),
          ),
        )),
      ],
    );
  }
}
