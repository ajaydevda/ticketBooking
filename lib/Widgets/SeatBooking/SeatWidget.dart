import 'package:flutter/material.dart';

class SeatWidget extends StatefulWidget {
  @override
  _SeatWidgetState createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(


    );
  }

}

enum Status {
  available,
  selected,
  unavailable,
}