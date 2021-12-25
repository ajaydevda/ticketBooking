import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/AppBar/AppBar1.dart';
import 'package:ticket_booking/Bloc/Bloc.dart';
import 'package:ticket_booking/Bloc/Repo.dart';
import 'package:ticket_booking/Bloc/State.dart';
import 'package:ticket_booking/LocalStorage/SharedPreference.dart';
import 'package:ticket_booking/Model/FerrylistModel.dart';
import 'package:ticket_booking/PassengerDetails/PassengerDetailWidget.dart';
import 'package:ticket_booking/SeatBooking/SeatWidget/SeatDetail.dart';
import 'package:ticket_booking/Utils/Colors.dart';
import 'package:ticket_booking/Widgets/LoadingSpinner/LoadingAlert.dart';

class PassengerDetailsScreen extends StatefulWidget {
  const PassengerDetailsScreen({Key? key}) : super(key: key);

  @override
  _PassengerDetailsScreen createState() => _PassengerDetailsScreen();
}

class _PassengerDetailsScreen extends State<PassengerDetailsScreen> {
  late Tickets ticketData;
  late int numOfChild, numOfAdult;
  late final List<ReserveSeatModel> bookedSeat;
  late String bookingId;
  late double amount;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routes = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    ticketData =  routes['ticketData'];
    bookedSeat =  routes['bookedSeat'];
    bookingId =  routes['bookingId'];
    amount =  routes['amount'];

    print(bookedSeat.length);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppBloc(
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
          }
        }, child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          if (state is InitialState) {}

          return Scaffold(
              backgroundColor: white,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: AppBar1(
                  leadingText: "Fill your ticket details, " +
                      Prefs.getString("firstName")!,
                ),
              ),
              body: SafeArea(
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        PassengerDetailWidget(seatNumber: bookedSeat[index].seatNumber, passenger: (index+1).toString()),
                  itemCount: bookedSeat.length,
                  )));
        })));
  }

  getSelectedSeatsDetail(listOfSeat) {
    bookedSeat.clear();
    bookedSeat.addAll(listOfSeat);
  }
}
