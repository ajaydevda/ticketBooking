import 'package:flutter/material.dart';
import 'package:ticket_booking/Model/FerrylistModel.dart';
import 'package:ticket_booking/SeatBooking/SeatWidget/SeatView.dart';
import 'package:ticket_booking/Widgets/Card/CardDecoration.dart';

class SeatLayout extends StatefulWidget {
  late Function selectSeat,removeSeat;

  SeatLayout({required this.selectSeat,required this.removeSeat});

  @override
  State<SeatLayout> createState() => _SeatLayoutState();
}

class _SeatLayoutState extends State<SeatLayout> {
  late  Tickets ticketData;

  late int grid1Count,grid2Count;
  bool isEnabled=true;

  late int numOfChild,numOfAdult;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    final routes = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    ticketData = routes['ticket'];
    numOfChild = routes['numOfChild'];
    numOfAdult = routes['numOfAdult'];

    int seatCount= ticketData.deckes[0].seatCount;
    int numOfRow=(seatCount~/6);
    int n1,n2;

    if(seatCount%6>3) {n1=3;}
    else{n1=seatCount%6;}

    if(seatCount%6>3) {n2=(seatCount%6)%3;}
    else{n2=0;}


    grid1Count=numOfRow*3+n1;
    grid2Count=numOfRow*3+n2;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {



    return CardDecoration(
      padding: EdgeInsets.only(left: 20,top: 20,right: 20),
      child: Container(
        width: MediaQuery.of(context).size.width/2,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.only(top:30.0,bottom: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: grid1Count,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 32,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {

                          if (index>2) {
                           var di= index~/3;
                           var i=index+(3*di);
                            return SeatView(
                              seat: ticketData.deckes[0].seats[i],
                              add: widget.selectSeat,
                               onCheck: onCheck,
                              isEnabled: isEnabled,

                              remove: widget.removeSeat,
                            );
                          }
                          else{
                            return SeatView(
                                seat: ticketData.deckes[0].seats[index],
                                add: widget.selectSeat,
                                isEnabled: isEnabled,
                                onCheck: onCheck,
                                remove: widget.removeSeat);
                          }

                        },
                      ),
                    ),

                    SizedBox(width: 25),

                    Expanded(
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: grid2Count,//ticketData.deckes[0].seatCount~/2,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 32,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {

                            var di= index~/3+1;
                            var i=index+(3*di);
                            print(i.toString()+" "+di.toString()+" "+index.toString());
                            return SeatView(
                              add: widget.selectSeat,
                              remove: widget.removeSeat,
                              onCheck: onCheck,
                              isEnabled: isEnabled,
                              seat: ticketData.deckes[0].seats[i]
                            );


                        },
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onCheck()
  {

    for(int i=0;i<ticketData.deckes[0].seatCount;i++) {
      print(ticketData.deckes[0].seats[i].status);
    }
     List a=ticketData.deckes[0].seats.where((element) => element.status=='2').toList();

     print(">>>>"+a.length.toString());

     if(a.length==numOfChild+numOfAdult)
       {
         print(">>>>");
         isEnabled=false;
         setState(() {

         });
       }
     else{
       isEnabled=true;
       setState(() {

       });
     }

  }
}
