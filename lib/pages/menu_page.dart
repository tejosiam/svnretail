import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:goldenlamian/bloc/menu_bloc.dart';
import 'package:goldenlamian/models/menu_model.dart';
import 'package:goldenlamian/pages/payment_page.dart';
import 'package:goldenlamian/view/BigSmallPrice.dart';
import 'package:goldenlamian/view/Counter.dart';
import 'package:goldenlamian/view/NavBarItem.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sticky_headers/sticky_headers.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final MenuBloc _menuBloc = MenuBloc();
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  String _namaCategory = "Best Seller";
  String _namaMenu = "Value 4";
  String _gambar = "#";
  double _harga = 0;

  @override
  void initState() {
    _menuBloc.add(GetMenuList());
    super.initState();
  }

  List<String> listHeader = [
    'Best Seller',
    'Value Meals',
    'Lamian',
    'Hainan Rice',
    'Dimsum',
    'Drink and Dessert',
  ];

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
    return WidgetsApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return _buildListMenu();
        });
  }

  Widget _buildListMenu() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _menuBloc,
        child: BlocListener<MenuBloc, MenuState>(
          listener: (context, state) {
            if (state is MenuError) {
              // ignore: deprecated_member_use
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<MenuBloc, MenuState>(
            // ignore: missing_return
            builder: (context, state) {
              if (state is MenuInitial) {
                return _buildLoading();
              } else if (state is MenuLoading) {
                return _buildLoading();
              } else if (state is MenuLoaded) {
                return _menuContainer(context, state.menuModel);
              } else if (state is MenuError) {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _menuContainer(BuildContext context, MenuModel model) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutGrid(
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
            _navigation(context).inGridArea('nav'),
            _buildCard(context, model).inGridArea('content'),
          ],
        ),
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
              child: _drawerItem(
                  context, _namaCategory, _namaMenu, _gambar, _harga),
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(
      BuildContext context, _namaCategory, _namaMenu, _gambar, _harga) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            dense: true,
            title: Text(
              _namaCategory,
              style: const TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListPayment()));
                }),
          ),
          Container(
            child: CachedNetworkImage(
              imageUrl: "https://api1.goldenlamian.com/${_gambar}",
              imageBuilder: (context, imageProvider) => Container(
                height: 300.0,
                width: 300.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Text("${_namaMenu}",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 70,
                  fontWeight: FontWeight.bold)),
          Padding(padding: EdgeInsets.only(top: 5)),
          Row(
            children: <Widget>[
              Expanded(
                child: BigSmallPrice(price: _harga),
              ),
            ],
          ),
          Material(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
            ],
          )),
          Expanded(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Counter(),
                Padding(padding: EdgeInsets.only(top: 15)),
                InkWell(
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
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _navigation(BuildContext context) {
    return Container(
      color: Colors.white,
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
            namaCategory: 'Best Seller',
            gambar: Image.asset(
              "assets/images/icon-02.png",
            ),
            active: selected[0],
            touched: () {
              setState(() {
                select(0);
                itemScrollController.jumpTo(index: 0);
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
            namaCategory: 'Best Seller',
            active: selected[1],
            touched: () {
              setState(() {
                select(1);
                itemScrollController.jumpTo(index: 1);
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
            namaCategory: 'Best Seller',
            active: selected[2],
            touched: () {
              setState(() {
                select(2);
                itemScrollController.jumpTo(index: 2);
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
            namaCategory: 'Best Seller',
            active: selected[3],
            touched: () {
              setState(() {
                select(3);
                itemScrollController.jumpTo(index: 3);
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
            namaCategory: 'Best Seller',
            active: selected[4],
            touched: () {
              setState(() {
                select(4);
                itemScrollController.jumpTo(index: 4);
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
            namaCategory: 'Best Seller',
            active: selected[5],
            touched: () {
              setState(() {
                select(5);
                itemScrollController.jumpTo(index: 5);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, MenuModel model) {
    List<Data> _menuList = model.data;

    return ScrollablePositionedList.builder(
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
      itemCount: listHeader.length,
      itemBuilder: (context, index) {
        // Menu di sortir berdasarkan kategory
        var menuByCategory = _menuList
            .where((b) => b.namaCategory == listHeader[index])
            .toList();

        List<Data> _menuByCategory = menuByCategory;
        return StickyHeader(
          header: Container(
            height: 38.0,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            alignment: Alignment.centerLeft,
            child: Text(
              listHeader[index],
              style: const TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          content: Container(
            color: Colors.white,
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _menuByCategory.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (contxt, indx) {
                return Card(
                  elevation: 0.0, // remove card shadow
                  child: InkWell(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://api1.goldenlamian.com/${_menuByCategory[indx].img}",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 300.0,
                                width: 300.0,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress.progress),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          Text("${_menuByCategory[indx].nama}",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 80,
                                  fontWeight: FontWeight.bold)),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: BigSmallPrice(
                                    price: _menuByCategory[indx].price),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // onTap: () => Scaffold.of(context).openEndDrawer(),
                    onTap: () => setState(() {
                      Scaffold.of(context).openEndDrawer();
                      _namaCategory = _menuByCategory[indx].namaCategory;
                      _namaMenu = _menuByCategory[indx].nama;
                      _gambar = _menuByCategory[indx].img;
                      _harga = _menuByCategory[indx].price;
                    }),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
