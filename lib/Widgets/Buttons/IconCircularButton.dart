import 'package:flutter/material.dart';

class IconCircularButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? image;
  IconCircularButton({required this.onPressed, this.image});
   @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        child: Container(

            width:40,
            height: 40,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:AssetImage(image!),
                    fit:BoxFit.fill
                ),
            )
        ),onTap:onPressed
    );
  }
}
