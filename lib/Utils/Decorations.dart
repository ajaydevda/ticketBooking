import 'package:flutter/material.dart';
import 'package:ticket_booking/Utils/Colors.dart';

const decoration1 = BoxDecoration(
    color: lightGray,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
        bottomLeft: Radius.circular(5),
        bottomRight: Radius.circular(5)
    ),
  boxShadow: [
    BoxShadow(
      color: darkGray,
      blurRadius: 4,
     // offset: Offset(4, 8), // Shadow position
    )
  ],
);
