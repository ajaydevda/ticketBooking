import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ticket_booking/LocalStorage/SharedPreference.dart';
import 'package:ticket_booking/Utils/Images.dart';
import 'package:ticket_booking/WalkThrough/page1.dart';
import 'package:ticket_booking/WalkThrough/page2.dart';
import 'package:ticket_booking/WalkThrough/page3.dart';
import 'package:ticket_booking/WalkThrough/page4.dart';
import 'package:ticket_booking/Widgets/Buttons/IconCircularButton.dart';
import 'package:ticket_booking/Widgets/Buttons/LoginButton.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  _PageViewWidget createState() => _PageViewWidget();
}

class _PageViewWidget extends State<PageViewWidget> {
  PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    Prefs.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 10,
          child: PageView(
            children: [Page1(), Page2(), Page3(), Page4()],
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
          ),
        ),


        Expanded(
          flex: 1,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text("")),
              Expanded(

                child: Center(
                  child: SmoothPageIndicator(
                      controller: _pageController, // PageController
                      count: 4,
                      effect: WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          dotColor: Colors.grey,
                          activeDotColor: Theme.of(context)
                              .primaryColor), // your preferred effect
                      onDotClicked: (index) {}),
                ),
              ),
              Expanded(
                flex: 1,
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  currentPage == 0
                      ? IconCircularButton(
                          onPressed: () {
                            // Navigator.pushReplacementNamed(context, '/signUp');
                          },
                          image: nextButton,
                        )
                      : Container(
                          height: 40,
                          width: 40,
                        ),
                  currentPage == 3
                      ? LoginButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/LoginScreen');
                        },
                        label: "Sign Up / Login",
                      )
                      : Container(
                          height: 40,
                          width: 40,
                        ),
                ],
              )),
            ],
          ),
        )
      ],
    );
  }
}
