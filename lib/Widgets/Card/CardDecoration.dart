//CardDecoration
import 'package:flutter/material.dart';

class CardDecoration extends StatelessWidget {

  late Widget child;
  late EdgeInsetsGeometry padding;
  CardDecoration({required this.child,required this.padding});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: padding,
      child: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        child:child,
        decoration: BoxDecoration(
          border: Border.all( width: 0.1,color: Colors.white),
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              blurRadius: 0.0,
              spreadRadius: 0,
              offset: new Offset(0.2, 0.5),
            ),
          ],
        ),


      ),
    );
  }
}
