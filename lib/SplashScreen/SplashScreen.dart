import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking/Utils/Colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    new Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/walkOver');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:

      Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    skyBlue, white
                  ],
                  begin: const FractionalOffset(1.0, 1.0),
                  end: const FractionalOffset(1.0, 0.4),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),

          ),

          Positioned(
              top: MediaQuery.of(context).size.height/2,
              left: MediaQuery.of(context).size.width/2-70,
              child: Column(
                children: [
                  Text("DHATHURU APP",style: Theme.of(context).textTheme.bodyText1,),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Text("(Dhathuru logo)",style: Theme.of(context).textTheme.bodyText2),
                  ),

                ],
              ))




        ],
      )

    );
  }
}
