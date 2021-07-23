

import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text ;
  final Color color;
  final Function callback;
CalculatorButton({required this.text,required this.color,required this.callback});


  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(8),
      child: SizedBox(
        width: 70,
        height: 70,
        // ignore: deprecated_member_use
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6)),
          onPressed: (){this.callback(this.text);},
          child: Text(
            this.text,
            style: TextStyle(color: Colors.white,fontSize: 24),
          ),
          color: this.color,
          textColor: Color(0xFF000000),
        ),
      ),
    );
  }
}
