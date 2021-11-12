import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PageViewWidget.dart';

class WalkOverScreen extends StatefulWidget {
  const WalkOverScreen({Key? key}) : super(key: key);

  @override
  _WalkOverScreen createState() => _WalkOverScreen();
}

class _WalkOverScreen extends State<WalkOverScreen> {
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
          child: PageViewWidget(),
        )

    );
  }
}
