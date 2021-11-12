//LoginButton
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? label;


  LoginButton({required this.onPressed, this.label});


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        child: Container(
            width:80,
            height: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:AssetImage("assets/Logo/09_LongButton.png"),
                  fit:BoxFit.fill
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(label!,style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white,fontSize: 12),),
                ),
              ],
            ),
        ),onTap:onPressed
    );
  }
}
