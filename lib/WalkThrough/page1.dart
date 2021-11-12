import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking/Utils/Images.dart';
import 'package:ticket_booking/Utils/Strings.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Text(walkThroughText1,
                style: Theme.of(context).textTheme.bodyText1),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 50.0),
            child: Text(
              walkThroughText2,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20.0),
              child: Text(walkThroughText3,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 12, color: Colors.black))),
          SizedBox(
            height: 170,
            child: Center(
              child: Image.asset(
                walk1,
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
            padding: const EdgeInsets.only(top: 0.0,left: 20,right: 20,),
            child: Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(walkThroughText5,
                        style: Theme.of(context).textTheme.headline1)),
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}
