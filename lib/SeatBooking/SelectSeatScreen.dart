import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/AppBar/AppBar1.dart';
import 'package:ticket_booking/Bloc/Bloc.dart';
import 'package:ticket_booking/Bloc/Event.dart';
import 'package:ticket_booking/Bloc/Repo.dart';
import 'package:ticket_booking/Bloc/State.dart';
import 'package:ticket_booking/LocalStorage/SharedPreference.dart';
import 'package:ticket_booking/Model/FerrylistModel.dart';
import 'package:ticket_booking/SeatBooking/SeatWidget/JoinerSeatLayout.dart';
import 'package:ticket_booking/SeatBooking/SeatWidget/SeatDetail.dart';
import 'package:ticket_booking/SeatBooking/SeatWidget/SeatStateColor.dart';
import 'package:ticket_booking/Utils/Colors.dart';
import 'package:ticket_booking/Widgets/Alert/ValidationAlert.dart';
import 'package:ticket_booking/Widgets/Buttons/SolidButton.dart';
import 'package:ticket_booking/Widgets/LoadingSpinner/LoadingAlert.dart';

class SelectSeatScreen extends StatefulWidget {
  const SelectSeatScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SelectSeatScreen> {
  late Tickets ticketData;
  late int numOfChild, numOfAdult;
  late final List<ReserveSeatModel> bookedSeat = [];
  late JoinerSeatLayout seatLayout;
  late double totalPrice;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routes =
    ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, dynamic>;
    numOfChild = routes['numOfChild'];
    numOfAdult = routes['numOfAdult'];
    ticketData = routes['ticket'];

    seatLayout=JoinerSeatLayout(setSeatStatus: getSelectedSeatsDetail,);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            AppBloc(
              repoInstance: AppRepo(),
            ),
        child: BlocListener<AppBloc, AppState>(listener: (context, state) {
          if (state is FailedState) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 4),
                backgroundColor: Colors.red,
                content: Text(state.message.toString()),
              ),
            );
          } else if (state is LoadingState) {
            showLoaderDialog(context);
          } else if (state is ReserveFerrySuccessSeat) {
            Navigator.of(context).pop();

            Navigator.pushNamed(context, '/PassengerDetailsScreen',
                arguments: {
                  'ticketData': ticketData,
                  'bookingId': state.success.bookingId,
                  'amount':totalPrice,
                  'bookedSeat':bookedSeat
                });

          }
        }, child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {



          return Scaffold(
              backgroundColor: white,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: AppBar1(
                  leadingText: "Where would you like to sit, " +
                      Prefs.getString("firstName")!,
                ),
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SeatStateColor(),
                        seatLayout,
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 20, bottom: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 40,
                                  child: TextButton(
                                    child: Text(
                                      "Change Ticket Detail",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(color: darkBlue),
                                    ),
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                side:
                                                BorderSide(color: darkBlue)))),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: SolidButton(
                                      onPressed: () {


                                        var count=numOfChild+numOfAdult;
                                        print(count);
                                        if(count==bookedSeat.length)
                                          {
                                            totalPrice=count* double.parse(ticketData.deckes[0].seatPrice);

                                            BlocProvider.of<AppBloc>(context).add(
                                                ReserveFerrySeat
                                                  ( destinationStation1:ticketData.endStationCode,
                                                    ferryCode:ticketData.ferryCode,
                                                    sourceStation1:ticketData.startStationCode,
                                                    totalPrice:totalPrice.toString(),
                                                    seats:bookedSeat
                                                ));

                                          }
                                        else{

                                          validationAlert(context: context,msg: "Please select required number of seats");
                                        }

                                      },
                                      label: "Confirm Details"))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text:
                                    "This ticket should be used for entry at the station within 30 minutes of purchase. To know more, read SC soft's ",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(fontSize: 10)),
                                TextSpan(
                                    text: 'Terms and condition .',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                        fontSize: 10, color: Colors.red),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Double tapped.
                                      }),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )));
        })));
  }


  getSelectedSeatsDetail(listOfSeat) {
    bookedSeat.clear();
    bookedSeat.addAll(listOfSeat);
  }

}
