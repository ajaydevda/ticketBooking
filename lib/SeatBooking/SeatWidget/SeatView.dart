import 'package:flutter/material.dart';
import 'package:ticket_booking/Model/FerrylistModel.dart';
import 'package:ticket_booking/SeatBooking/SeatWidget/seatStatusEnum.dart';
import 'package:ticket_booking/Utils/Colors.dart';

class SeatView extends StatefulWidget {
  late  Seats seat;
  Function add;
  Function remove;
  Function onCheck;
  bool isEnabled;
  SeatView({required this.seat,required this.add,required this.remove,required this.onCheck,required this.isEnabled});
  @override
  _SeatViewState createState() => _SeatViewState();
}

class _SeatViewState extends State<SeatView> {

  late SeatStatusEnum status;
   late Color color;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    switch(widget.seat.status)
    {
      case '0':
        status=SeatStatusEnum.booked;
        color=Colors.grey;
        break;
      case '1':
        status=SeatStatusEnum.availlabel;
        color=Theme.of(context).colorScheme.primary;
        break;
      case '2':
        status=SeatStatusEnum.availlabel;
        color=Theme.of(context).colorScheme.primary;
        widget.seat.status="1";

        break;
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        print(widget.isEnabled);

          if (status == SeatStatusEnum.selected) {
            widget.seat.status = "1";

            setState(() {
              status = SeatStatusEnum.availlabel;
              color = Theme
                  .of(context)
                  .colorScheme
                  .primary;
            });

            widget.remove(widget.seat.code);
            widget.onCheck();

          }

          else if (status == SeatStatusEnum.availlabel && widget.isEnabled) {
            widget.seat.status = "2";

            setState(() {
              status = SeatStatusEnum.selected;
              color = darkGreen;
            });
            widget.add(widget.seat.code);
            widget.onCheck();
          }


      },
      child: Container(
          decoration: BoxDecoration(
            border: Border.all( width: 0.1,color: Colors.white),
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                blurRadius: 0.0,
                spreadRadius: 0,
                offset: new Offset(0.2, 0.2),
              ),
            ],
          ),

          child: Center(child: Text(widget.seat.code))),
    );
  }
}
