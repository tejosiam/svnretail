import 'package:flutter/material.dart';

class MenuCard extends StatefulWidget {
  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      primary: false,
      padding: EdgeInsets.all(10.0),
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      shrinkWrap: true,
      children: <Widget>[
        _buildCard('Lamian Extra Spicy Beef', '49494', '20-05-18', '5',
            'assets/images/menu-lamian-extraspicybeef.png'),
        _buildCard('Orange fruits', '49494', '20-05-18', '4',
            'assets/images/menu-lamian-extraspicybeef.png'),
        _buildCard('Springfield', '49494', '20-05-18', '5',
            'assets/images/menu-lamian-extraspicybeef.png'),
        _buildCard('Breakfast Dine', '49494', '20-05-18', '3',
            'assets/images/menu-lamian-extraspicybeef.png'),
        _buildCard('Breakfast Dine', '49494', '20-05-18', '3',
            'assets/images/menu-lamian-extraspicybeef.png'),
        _buildCard('Breakfast Dine', '49494', '20-05-18', '3',
            'assets/images/menu-lamian-extraspicybeef.png'),
      ],
    );
  }

  _buildCard(String restaurantName, String type, String date, String rating,
      String imgPath) {
    return Container(
      padding: EdgeInsets.all(7.0),
      height: 150.0,
      width: 150.0,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 300.0,
                width: 300.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.cover)),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            restaurantName,
            style: TextStyle(
                color: Color(0xFF233467),
                fontSize: 15,
                fontFamily: 'Montserrat'),
          ),
          SizedBox(height: 10.0),
          Text(
            'RP.' + type,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
