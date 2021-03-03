import 'package:flutter/material.dart';

class CompanyName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Golden Lamian',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xFFFFFFFF),
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
