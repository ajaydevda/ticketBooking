import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
import 'package:ticket_booking/Widgets/Buttons/ToggleableButton.dart';
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

  late FerryStops fromDestination, toDestination;
  late String journeyDateEpoch;
  late DateHandler dateHandler;
  int numberOfAdult = 0, numOfChild = 0;

  @override
  void initState() {
    // TODO: implement initState
    dateHandler = DateHandler();
    numberOfAdult = 0;
    numOfChild = 0;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ferryStopsData.length > 0
                            ? DropDownWidget(
                                ferryStopsData: ferryStopsData,
                                onChange: getSourceDestination)
                            : Container(),
                        Container(
                            height: 40,
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: ToggleableButton(
                              labels: ["One Way", "Return", "Group"],
                              selectedIndex: 0,
                              getSelectedIndex: getTripType,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
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
                                  padding: EdgeInsets.only(right: 20, left: 10),
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: PassengerAdderWidget(
                                      getCount: getAdultChild,
                                    ),
                                  ),
                                ),
                                flex: 3,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SolidButton(
                            onPressed: () {
                              if (numOfChild != 0 || numberOfAdult != 0) {
                                Navigator.pushNamed(context, '/AvailableFerry',
                                    arguments: {
                                      'sourceCode': fromDestination.code,
                                      'destinationCode': toDestination.code,
                                      'instanceDate':
                                          journeyDateEpoch.toString(),
                                      'numOfChild': numOfChild,
                                      'numOfAdult': numberOfAdult
                                    });
                              } else {}
                            },
                            label: "Select Root",
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text:
                                          "This ticket should be used for entry at the station within 30 minutes of purchase. To know more, read SC soft's ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(fontSize: 10)),
                                  TextSpan(
                                      text: 'Terms and condition .',
                                      style: Theme.of(context)
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
                            ))
                      ],
                    ),
                  ],
                ),
              ));
        })));
  }

  getSourceDestination(FerryStops source, FerryStops destination) {
    fromDestination = source;
    toDestination = destination;
  }

  getJourneyDate(DateTime date) {
    journeyDateEpoch = dateHandler.displayDateTime(date: date);
  }

  getAdultChild(int numChild, int numAdult) {
    print(numChild.toString() + "_" + numAdult.toString());
    numberOfAdult = numAdult;
    numOfChild = numChild;
  }

  getTripType(int index) {
    print(index);
  }
}
