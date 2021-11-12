//LogoutButton
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? label;


  LogoutButton({required this.onPressed, this.label});


  @override
  Widget build(BuildContext context) {
    return  InkWell(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,top: 20,right: 20),
          child: Container(
            height: 40,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(02),
          color: Colors.red

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: SizedBox(
                    width: 20,
                    child: Icon(Icons.logout,color: Colors.white,)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(label!,style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white,fontSize: 12),),
              ),
            ],
          ),
            ),
        ),onTap:onPressed
    );
  }
}
