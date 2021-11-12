import 'package:flutter/material.dart';
import 'package:ticket_booking/Model/FerrylistModel.dart';
import 'package:ticket_booking/Utils/DateHandler.dart';
import 'package:ticket_booking/Widgets/Buttons/SolidButton.dart';
import 'package:ticket_booking/Widgets/Card/CardDecoration.dart';

class FerryCell extends StatelessWidget {

  Tickets ticketData;
  late DateHandler dateHandler;
  late int startHour;
  late int startMin;

  late int endHour;
  late int endMin;

  late int travelHour;
  late int travelMin;


  FerryCell({required this.ticketData}){
    dateHandler=DateHandler();

    startHour=dateHandler.getHour(ticketData.startTime);
    startMin=dateHandler.getMin(ticketData.startTime);

    endHour=dateHandler.getHour(ticketData.endTime);
    endMin=dateHandler.getMin(ticketData.endTime);

    travelHour=endHour-startHour;
    travelMin=endMin-startMin;


  }


  @override
  Widget build(BuildContext context) {
    return CardDecoration(
        padding: EdgeInsets.only(right: 15,top: 10,left: 15),
        child: Padding(
          padding: const EdgeInsets.only(top: 20,bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text(ticketData.startStationName,style: TextStyle(fontSize: 8),),

                Text(startHour.toString()+" : "+startMin.toString())
              ],),

              Padding(
                padding: const EdgeInsets.only(left:10,right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text(travelHour.toString()+"H",style: TextStyle(fontSize: 14),),
                  Text(travelMin.toString()+"M",style: TextStyle(fontSize: 14),)
                ],),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text(ticketData.endStationName,style: TextStyle(fontSize: 8),),
                Text(endHour.toString()+" : "+endMin.toString())

              ],),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text("MVR "+ticketData.deckes[0].seatPrice,style: TextStyle(fontSize: 14),),

                    SizedBox(
                      height: 30,
                      width: 100,
                      child: SolidButton(onPressed: () {

                      }, label: "Book Now",
                      ),
                    ),

                ],),
              ),
            ],
          ),
        ),
    );
  }
}
