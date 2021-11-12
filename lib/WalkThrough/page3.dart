import 'package:flutter/material.dart';
import 'package:ticket_booking/Utils/Images.dart';
import 'package:ticket_booking/Utils/Strings.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.only(top:90.0,bottom: 20),
          child: Center(child: Text(walkThroughText6)),
        ),


        SizedBox(
          height: 200,
          child: Center(
            child: Image.asset(
              walk3,
            ),
          ),
        ),

        SizedBox(
          height: 170,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            ribbon,
            fit: BoxFit.fill,
          ),
        ),

        Padding(
          padding:  EdgeInsets.only(top:20.0,left: 20,right:  MediaQuery.of(context).size.width/2),
          child: Text(walkThroughText10,style: Theme.of(context).textTheme.headline1),
        ),
      ],
    );

  }
}
