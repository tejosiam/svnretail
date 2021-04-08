import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldenlamian/bloc/menu_bloc.dart';
import 'package:goldenlamian/models/menu_model.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final MenuBloc _menuBloc = MenuBloc();

  @override
  void initState() {
    _menuBloc.add(GetMenuList());
    super.initState();
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
                return _buildCard(context, state.menuModel);
              } else if (state is MenuError) {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, MenuModel model) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: model.data.length,
      itemBuilder: (context, index) {
        return Container(
          child: Card(
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 300.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://api1.goldenlamian.com/${model.data[index].img}"),
                            fit: BoxFit.cover)),
                  ),
                  Text("Categori: ${model.data[index].namaCategory}",
                      style: TextStyle(
                          color: Color(0xFF233467),
                          fontSize: 15,
                          fontFamily: 'Montserrat')),
                  Text("${model.data[index].nama}"),
                  Text("RP ${model.data[index].price}",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20.0,
                      )),
                  IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () => Scaffold.of(context).openDrawer()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
