import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ticket_booking/AppBar/AppBar1.dart';
import 'package:ticket_booking/Drawer/Drawer.dart';
import 'package:ticket_booking/LocalStorage/SharedPreference.dart';
import 'package:ticket_booking/Utils/Images.dart';
import 'package:ticket_booking/Utils/Strings.dart';
import 'package:ticket_booking/Widgets/Menu/DashBoardMenu.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreen createState() => _DashBoardScreen();
}

class _DashBoardScreen extends State<DashBoardScreen> {
  PageController _pageController = PageController();
  int currentPage = 0;

  List<String> menuImg = [
    bookNewTicket,
    myTicket,
    transaction,
    routeIcon,
    nearStation,
    support
  ];
  List<String> menuText = [
    "Book New Tickets",
    "My Tickets",
    "Transaction History",
    "Routes",
    "Nearest Station",
    "Support"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Container(
          width: 200,
          child: Drawer(
            child: LeftSideDrawer(),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar1(
            leadingText: dashBoard1 + Prefs.getString("firstName")!,
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 8),
                child: Container(
                  height: MediaQuery.of(context).size.height * .25,
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: 4,
                      itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                          )),
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                    controller: _pageController, // PageController
                    count: 4,
                    effect: WormEffect(
                        dotHeight: 7,
                        dotWidth: 7,
                        dotColor: Colors.grey,
                        activeDotColor: Theme.of(context)
                            .primaryColor), // your preferred effect
                    onDotClicked: (index) {}),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  dashBoard2,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //mainAxisExtent: 100,
                      childAspectRatio: .8),
                  itemCount: menuImg.length,
                  itemBuilder: (context, index) => DashBoardMenu(
                    image: menuImg[index],
                    onPressed: () {
                      print(index.toString());
                      if (index == 0) {
                        Navigator.pushNamed(context, '/BookNewTicket');
                      }
                    },
                    text: menuText[index],
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
