import 'package:flutter/material.dart';

class ListPayment extends StatefulWidget {
  _ListPaymentState createState() => _ListPaymentState();
}

class _ListPaymentState extends State<ListPayment> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 50.0)),
            ListPaymentItems(
              teks: 'Pilih Pembayaran',
              warnaBox: Colors.transparent,
              fontColors: Colors.red[900],
              sizeTeks: 35.0,
              borderColors: Colors.transparent,
            ),
            Padding(padding: EdgeInsets.only(top: 180.0)),
            ListPaymentItems(
              teks: 'QR Pay',
              warnaBox: Colors.orange,
              border: MediaQuery.of(context).size.width * 0.25,
              fontColors: Colors.black,
              sizeTeks: 30.0,
              borderColors: Colors.transparent,
            ),
            Padding(padding: EdgeInsets.only(top: 25.0)),
            ListPaymentItems(
              teks: 'Debit/Kartu Kredit',
              warnaBox: Colors.orange,
              border: MediaQuery.of(context).size.width * 0.25,
              fontColors: Colors.black,
              sizeTeks: 30.0,
              borderColors: Colors.transparent,
            ),
            Padding(padding: EdgeInsets.only(top: 25.0)),
            ListPaymentItems(
              teks: 'Tunai (Bayar di kasir)',
              warnaBox: Colors.orange,
              border: MediaQuery.of(context).size.width * 0.25,
              fontColors: Colors.black,
              sizeTeks: 30.0,
              borderColors: Colors.transparent,
            ),
            Padding(padding: EdgeInsets.only(top: 150.0)),
            ListPaymentItems(
              teks: 'Back',
              warnaBox: Colors.transparent,
              border: MediaQuery.of(context).size.width * 0.3,
              fontColors: Colors.black,
              sizeTeks: 23.0,
              borderColors: Colors.black,
            ),
          ],
        ));
  }
}

class ListPaymentItems extends StatefulWidget {
  final String teks;
  final Color warnaBox;
  final double border;
  final Color fontColors;
  final double sizeTeks;
  final Color borderColors;
  final Function nextPage;

  ListPaymentItems(
      {this.teks,
      this.warnaBox,
      this.border,
      this.fontColors,
      this.sizeTeks,
      this.borderColors,
      this.nextPage});

  @override
  _ListPaymentItemsState createState() => _ListPaymentItemsState();
}

class _ListPaymentItemsState extends State<ListPaymentItems> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          alignment: Alignment.center,
          width: widget.border,
          height: 50.0,
          decoration: BoxDecoration(
            color: widget.warnaBox,
            border: Border.all(color: widget.borderColors),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0)),
          ),
          child: Text(
            widget.teks != null ? widget.teks : '',
            style: TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.normal,
                fontSize: widget.sizeTeks,
                color: widget.fontColors,
                fontFamily: 'Arial'),
          )),
      onTap: widget.nextPage,
    );
  }
}
