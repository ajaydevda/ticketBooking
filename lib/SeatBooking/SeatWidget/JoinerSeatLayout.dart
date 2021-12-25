import 'package:flutter/material.dart';
import 'package:ticket_booking/SeatBooking/SeatWidget/SeatDetail.dart';
import 'package:ticket_booking/SeatBooking/SeatWidget/SeatLayout.dart';
import 'package:ticket_booking/SeatBooking/SeatWidget/TicketDisplay.dart';

class JoinerSeatLayout extends StatelessWidget {

  late final List<ReserveSeatModel> seatNumber=[];
  GlobalKey<TicketDisplayState> _key = new GlobalKey(); //so we can call snackbar from anywhere
  Function setSeatStatus;

  JoinerSeatLayout({required this.setSeatStatus});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        SeatLayout(selectSeat: selectSeat,removeSeat: removeSeat,),
        TicketDisplay(key: _key,),

      ],
    );
  }

  selectSeat(String code,String deckCode)
  {
    seatNumber.add(ReserveSeatModel(deckCode: deckCode,seatNumber: code));
    _key.currentState!.update(seatNumber);

    setSeatStatus(seatNumber);
  }
  removeSeat(String code,String deckCode)
  {
    print(">>>");
    seatNumber.removeWhere((element) => element.seatNumber==code);
    _key.currentState!.update(seatNumber);
    setSeatStatus(seatNumber);
    print("<<<<<>>>>>>>>"+seatNumber.length.toString());

  }


}




