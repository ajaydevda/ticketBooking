import 'package:flutter/material.dart';
import 'package:ticket_booking/SeatBooking/SeatWidget/SeatLayout.dart';
import 'package:ticket_booking/SeatBooking/SeatWidget/TicketDisplay.dart';

class JoinerSeatLayout extends StatelessWidget {

  late final List<String> seatNumber=[];
  GlobalKey<TicketDisplayState> _key = new GlobalKey(); //so we can call snackbar from anywhere

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        SeatLayout(selectSeat: selectSeat,removeSeat: removeSeat,),
        TicketDisplay(key: _key,),

      ],
    );
  }

  selectSeat(String code)
  {
    seatNumber.add(code);

    print(seatNumber);
    _key.currentState!.update(seatNumber);

  }
  removeSeat(String code)
  {
    seatNumber.remove(code);
    print(seatNumber);
    _key.currentState!.update(seatNumber);
  }


}




