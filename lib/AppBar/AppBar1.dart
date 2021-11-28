import 'package:flutter/material.dart';
import 'package:ticket_booking/Utils/Colors.dart';
import 'package:ticket_booking/Utils/Decorations.dart';
import 'package:ticket_booking/Utils/Images.dart';

class AppBar1 extends StatelessWidget
{
  final String leadingText;
  AppBar1({required this.leadingText});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return AppBar(
     backgroundColor: white,
     elevation: 0,
     leading: Builder(
       builder: (context) => InkWell(
         onTap: () {
           Scaffold.of(context).openDrawer();
         },
         child: Padding(
           padding: const EdgeInsets.only(left: 20.0),
           child: Image.asset(
             userIcon,
            // fit: BoxFit.fill,
             width: 40,
             height: 40,
             color: Theme.of(context).colorScheme.primary,
           ),
         ),
       ),
     ),
     leadingWidth: 70,
     title: //Text('hi'),
     Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Container(
           width: 200,
           child: Text(
             leadingText ,
             maxLines: 2,
             style: TextStyle(fontSize: 20, color: Colors.black),
           ),
         ),
         Container(
           decoration: decoration1,
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Icon(
               Icons.notifications,
               size: 20,
               color: darkGray,
             ),
           ),
         ),
       ],
     ),
   );
  }
  
  
  
}