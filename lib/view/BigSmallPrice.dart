import 'package:flutter/material.dart';
import 'package:goldenlamian/utils/DataUtils.dart';

class BigSmallPrice extends StatelessWidget {
  final double price;
  final Color textColor;

  const BigSmallPrice({Key key, this.price = 0, this.textColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String sPrice = DataUtils().formatThousand(price);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Rp ",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 70,
              fontWeight: FontWeight.bold,
              color: textColor),
        ),
        Text(
          price < 1000 ? sPrice : sPrice.substring(0, sPrice.length - 4),
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 70,
              fontWeight: FontWeight.bold,
              color: textColor),
        ),
        price < 1000
            ? Container()
            : Text(sPrice.substring(sPrice.length - 4, sPrice.length),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 100,
                    fontWeight: FontWeight.bold,
                    color: textColor)),
      ],
    );
  }
}
