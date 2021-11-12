import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/AppBar/AppBar1.dart';
import 'package:ticket_booking/Bloc/Bloc.dart';
import 'package:ticket_booking/Bloc/Event.dart';
import 'package:ticket_booking/Bloc/Repo.dart';
import 'package:ticket_booking/Bloc/State.dart';
import 'package:ticket_booking/Model/FerrylistModel.dart';
import 'package:ticket_booking/Utils/Colors.dart';
import 'package:ticket_booking/Widgets/LoadingSpinner/LoadingAlert.dart';

import 'FerryCell.dart';

class AvailableFerry extends StatefulWidget {

  const AvailableFerry({Key? key}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<AvailableFerry> {

  late String sourceCode;
  late String destinationCode;
  late String instanceDate;

  FerrylistModel? ferrylistModel;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routes = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    sourceCode = routes['sourceCode']!;
    destinationCode = routes['destinationCode']!;
    instanceDate = routes['instanceDate']!;

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
          } else if (state is ListFerrySuccessState) {
            Navigator.of(context).pop();
            ferrylistModel=state.success;
          }
        }, child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          if (state is InitialState) {
            BlocProvider.of<AppBloc>(context).add(GetListOfFerryEvent(
              destinationStation: destinationCode,
              instanceDate: instanceDate,
              sourceStation: sourceCode
            ));
          }
          return Scaffold(
              backgroundColor: white,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: AppBar1(
                  leadingText: "",
                ),
              ),
              body: SafeArea(
                child:

                ferrylistModel!=null ?
                ListView.builder(
                itemBuilder: (context, index) => FerryCell(ticketData: ferrylistModel!.tickets[index],),
                itemCount: ferrylistModel!.tickets.length,
                ):Container(),
              ));
        })));
  }

}

