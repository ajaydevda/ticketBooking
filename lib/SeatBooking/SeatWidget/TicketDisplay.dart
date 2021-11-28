import 'package:flutter/material.dart';
import 'package:ticket_booking/Model/FerrylistModel.dart';
import 'package:ticket_booking/Utils/Colors.dart';

class TicketDisplay extends StatefulWidget {
  const TicketDisplay({key}) : super(key: key);

  @override
  TicketDisplayState createState() => TicketDisplayState();
}

class TicketDisplayState extends State<TicketDisplay> {
  late final List<String> seatNumber = [];
  late int numOfChild,numOfAdult;
  late  Tickets ticketData;
  double amount=0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    final routes = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    ticketData = routes['ticket'];


    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
          child: Text("Your Seat(s)",style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 12)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 4.0),
          child: Container(
              width: MediaQuery.of(context).size.width/4, height: 40,
              child: Text(seatNumber.toString(),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14,letterSpacing: .5,color: darkBlue)
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
          child: Text("Amount Payable",style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 12)),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 8.0),
          child: Text(amount.toStringAsFixed(2),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14,letterSpacing: .5,color: darkBlue)
          ),
        )
      ],
    );
  }

  update(newList) {
    seatNumber.clear();
    seatNumber.addAll(newList);


    setState(() {
      amount= seatNumber.length* double.parse(ticketData.deckes[0].seatPrice);
    });
  }
}
