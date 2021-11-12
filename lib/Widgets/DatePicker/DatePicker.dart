

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_booking/Utils/Colors.dart';
import 'package:ticket_booking/Utils/DateHandler.dart';

class DatePicker extends StatefulWidget
{
  Function onDatePick;


  DatePicker({required this.onDatePick});
  @override
  State<StatefulWidget> createState() => _DatePicker();

}
class _DatePicker extends State<DatePicker>
{
  DateTime selectedDate = DateTime.now();
  late DateHandler dateHandler;

  @override
  void initState() {
    // TODO: implement initState
    dateHandler=DateHandler();
    widget.onDatePick(selectedDate);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _datePicker(context);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(dateHandler.displayDate(date: selectedDate),style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14,color: redColor)),
          Padding(
            padding: const EdgeInsets.only(top:2.0),
            child: Text(dateHandler.displayDay(weekDay: selectedDate.weekday),style: Theme.of(context).textTheme.headline1,),
          )
        ],
      ),
    );
  }

  Future<void> _datePicker (BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2025));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDatePick(selectedDate);

    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


}