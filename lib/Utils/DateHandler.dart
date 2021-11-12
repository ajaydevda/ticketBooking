import 'package:intl/intl.dart';

class DateHandler {

  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final DateFormat formatter2 = DateFormat('yyyyMMdd');
  final DateFormat formatter3 = DateFormat('yyyyMMddhhmmss');

  String displayDay({weekDay}) {

    String day;
    switch(weekDay) {
      case 0:
        day= "Sunday";
        break;
      case 1:
        day= "Monday";
        break;
      case 2:
        day= "Tuesday";
        break;
      case 3:
        day= "Wednesday";
        break;
      case 4:
        day= "Thursday";
        break;
      case 5:
        day= "Friday";
        break;
       default:
        day= "Saturday";
        break;
    }
    return day;
  }

  String displayDate({date})
  {
    return formatter.format(date).toString();
  }

  String displayDateTime({date})
  {
    return formatter3.format(date).toString();
  }

  int getHour(String startTime)
  {
    String dateWithT = startTime.substring(0, 8) + 'T' + startTime.substring(8);
    DateTime dateTime = DateTime.parse(dateWithT);

    return dateTime.hour;
  }

  int getMin(String startTime)
  {
    String dateWithT = startTime.substring(0, 8) + 'T' + startTime.substring(8);
    DateTime dateTime = DateTime.parse(dateWithT);

    return dateTime.minute;
  }

}
