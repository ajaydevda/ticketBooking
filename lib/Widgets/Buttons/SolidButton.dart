//SolidButton
import 'package:flutter/material.dart';
import 'package:ticket_booking/Utils/Colors.dart';

class SolidButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? label;


  SolidButton({required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(blue1),
              ),
          onPressed: onPressed,
          child: Text(label!,style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.white),)),
    );
  }
}
