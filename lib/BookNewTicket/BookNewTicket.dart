import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/AppBar/AppBar1.dart';
import 'package:ticket_booking/Bloc/Bloc.dart';
import 'package:ticket_booking/Bloc/Event.dart';
import 'package:ticket_booking/Bloc/Repo.dart';
import 'package:ticket_booking/Bloc/State.dart';
import 'package:ticket_booking/BookNewTicket/DropDownWidget.dart';
import 'package:ticket_booking/LocalStorage/SharedPreference.dart';
import 'package:ticket_booking/Model/SourceDestinationModel.dart';
import 'package:ticket_booking/Utils/Colors.dart';
import 'package:ticket_booking/Utils/DateHandler.dart';
import 'package:ticket_booking/Utils/Strings.dart';
import 'package:ticket_booking/Widgets/Buttons/SolidButton.dart';
import 'package:ticket_booking/Widgets/Card/CardDecoration.dart';
import 'package:ticket_booking/Widgets/DatePicker/DatePicker.dart';
import 'package:ticket_booking/Widgets/LoadingSpinner/LoadingAlert.dart';

import 'PassengerAdderWidget.dart';

class BookNewTicket extends StatefulWidget {
  const BookNewTicket({Key? key}) : super(key: key);

  @override
  _BookNewTicket createState() => _BookNewTicket();
}

class _BookNewTicket extends State<BookNewTicket> {

  List<FerryStops> ferryStopsData = [];

  late FerryStops fromDestination,toDestination;
  late String journeyDateEpoch;
  late DateHandler dateHandler;


  @override
  void initState() {
    // TODO: implement initState
    dateHandler=DateHandler();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppBloc(
              repoInstance: AppRepo(),
            ),
        child: BlocListener<AppBloc, AppState>(listener: (context, state) {
          if (state is FailureState) {
            Navigator.of(context).pop();

            if (state.failure.message != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 4),
                  backgroundColor: Colors.red,
                  content: Text(state.failure.message.toString()),
                ),
              );
            }
          } else if (state is LoadingState) {
            showLoaderDialog(context);
          } else if (state is ListSourceDestinationSuccessState) {
            Navigator.of(context).pop();
          }
        }, child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          if (state is InitialState) {
            BlocProvider.of<AppBloc>(context).add(GetSourceDestinationEvent());
          } else if (state is ListSourceDestinationSuccessState) {
            ferryStopsData = state.success.ferryStops;
          }
          return Scaffold(
              backgroundColor: white,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: AppBar1(
                  leadingText: BookTicket + Prefs.getString("firstName")!,
                ),
              ),
              body: SafeArea(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        ferryStopsData.length > 0
                            ? DropDownWidget(
                                ferryStopsData: ferryStopsData,
                                onChange: getSourceDestination)
                            : Container(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CardDecoration(
                                padding: EdgeInsets.only(left: 20),
                                child: Container(
                                  height: 60,
                                  child: DatePicker(
                                    onDatePick: getJourneyDate,
                                  ),
                                ),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child: CardDecoration(
                                padding: EdgeInsets.only(right: 20,left: 10),

                                child: Container(
                                  padding: EdgeInsets.only(top: 10,bottom: 10),
                                  child: PassengerAdderWidget(
                                    getCount: getAdultChild,
                                  ),
                                ),
                              ),
                              flex: 3,
                            )
                          ],
                        ),
                      ],
                    ),

                    Positioned(
                      bottom: 20,
                      left: 20,right: 20,
                      child: SolidButton(onPressed: () {

                        Navigator.pushNamed(context, '/AvailableFerry',
                            arguments: {'sourceCode': fromDestination.code,
                              'destinationCode':toDestination.code,
                              'instanceDate':journeyDateEpoch.toString()
                        });


                      },
                        label: "Book Now",
                      ),
                    )
                  ],
                ),
              ));
        })));
  }

  getSourceDestination( FerryStops source,FerryStops destination) {

    fromDestination=source;
    toDestination=destination;

  }

  getJourneyDate(DateTime date) {
    journeyDateEpoch=dateHandler.displayDateTime(date: date);

  }

  getAdultChild(numChild, numAdult) {

  }
}
