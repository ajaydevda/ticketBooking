import 'package:flutter/material.dart';
import 'package:ticket_booking/Utils/Colors.dart';
import 'package:ticket_booking/Widgets/AddRemoveWidget/AddRemoveWidget.dart';

class PassengerAdderWidget extends StatelessWidget {
  late Function getCount;
   int adult=0,child=0;
  PassengerAdderWidget({required this.getCount}){
    getCount(child,adult);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Add Passenger",style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14,color: redColor)),
        AddRemoveWidget(label: "Adult",onChange: getAdult,),
        AddRemoveWidget(label: "Child",onChange: getChild,)



      ],
    );
  }

  getAdult(num)
  {
    adult=num;
    getCount(child,adult);
  }

  getChild(num)
  {
    child=num;
    getCount(child,adult);
  }
}
