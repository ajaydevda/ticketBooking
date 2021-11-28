import 'package:flutter/material.dart';
import 'package:ticket_booking/Utils/Colors.dart';

class SeatStateColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [

          Expanded(child: Row(children: [

            Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.1, color: Colors.white),
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      blurRadius: 0.0,
                      spreadRadius: 0,
                      offset: new Offset(0.2, 0.5),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Available",style: Theme.of(context).textTheme.headline1,),
            )

          ],)),

          Expanded(child: Row(children: [

            Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.1, color: Colors.white),
                  color: darkGreen,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      blurRadius: 0.0,
                      spreadRadius: 0,
                      offset: new Offset(0.2, 0.5),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Selected",style: Theme.of(context).textTheme.headline1,),
            )

          ],)),

          Expanded(child: Row(children: [

            Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.1, color: Colors.white),
                  color: darkGray,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      blurRadius: 0.0,
                      spreadRadius: 0,
                      offset: new Offset(0.2, 0.5),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Unavailable",style: Theme.of(context).textTheme.headline1,),
            )

          ],)),


        ],
      ),
    );
  }
}
