import 'package:flutter/material.dart';
import 'package:ticket_booking/Widgets/TextField/CustomTextField.dart';

class PassengerDetailWidget extends StatefulWidget {

  late String passenger;
  late String seatNumber;

  PassengerDetailWidget({required this.seatNumber,required this.passenger});

  @override
  _PassengerDetailWidgetState createState() => _PassengerDetailWidgetState();
}

class _PassengerDetailWidgetState extends State<PassengerDetailWidget> {

  late TextEditingController passCtrl,emailCtrl,phoneCtrl;
  List<DropdownMenuItem<String>> dropDownItems=[];
  late String currentItem;
  late String passenger;
  late String seatNumber;
  late String lab1,lab2,lab3,lab4,lab5;
  @override
  void initState() {
    // TODO: implement initState
    passCtrl=TextEditingController();
    emailCtrl=TextEditingController();
    phoneCtrl=TextEditingController();

    for (String item in ["Standard"]) {
      dropDownItems.add(DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ));
    }

    currentItem=dropDownItems[0].value!;

    lab1='Passenger ${widget.passenger} seat ${widget.seatNumber}';
    lab2='Full Name of Passenger ${widget.passenger}';
    lab3='Passenger ${widget.passenger} Ticket Type';
    lab4='Passenger ${widget.passenger} Email Address';
    lab5='Passenger ${widget.passenger} Phone number';

    super.initState();
  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

//    label=
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {


  return  ExpansionTile(
      title: Text(
        lab1,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500,color: Colors.black),
      ),
      children: <Widget>[

        Padding(
          padding:
          const EdgeInsets.only(top: 20.0, bottom: 10,left: 20,right: 20),
          child: CustomTextField(
            label: lab2,
            hint: "FullName",
            isMandatory: true,
            isObscure: true,
            textEditingController: passCtrl,
            // error: passwordError==""?null:passwordError,

          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom:0.0,left: 20,right: 20),
          child: Row(
            children: [
              Text(lab3,style: TextStyle(fontSize: 14.0),),
              Text("*",style: TextStyle(fontSize: 14.0,color: Colors.red),),

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: DropdownButton<String>(
            isExpanded: true,
            value: currentItem,
            items:dropDownItems,
            onChanged: (_) {},
          ),
        ),

        Padding(
          padding:
          const EdgeInsets.only(top: 10.0, bottom: 10,left: 20,right: 20),
          child: CustomTextField(
            label: lab4,
            hint: "Email",
            isMandatory: true,
            isObscure: true,
            textEditingController: emailCtrl,
            // error: passwordError==""?null:passwordError,

          ),
        ),

        Padding(
          padding:
          const EdgeInsets.only(top: 10.0, bottom: 10,left: 20,right: 20),
          child: CustomTextField(
            label: lab5,
            hint: "Phone",
            isMandatory: true,
            isObscure: true,
            textEditingController: phoneCtrl,
            //error: passwordError==""?null:passwordError,

          ),
        ),
      ],
    );


  }
}
