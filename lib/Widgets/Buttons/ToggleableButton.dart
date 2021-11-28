import 'package:flutter/material.dart';
import 'package:ticket_booking/Utils/Colors.dart';

class ToggleableButton extends StatefulWidget {
  late final List<String> labels;
  late final int selectedIndex;
  Function getSelectedIndex;
  ToggleableButton({required this.labels,required this.selectedIndex,required this.getSelectedIndex});

  @override
  _ToggleableButtonState createState() => _ToggleableButtonState();
}

class _ToggleableButtonState extends State<ToggleableButton> {

  late bool isScrollable;
  late  int selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    selectedIndex=widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.labels.length,
        itemBuilder: (context, index) =>
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SizedBox(
                height: 40,
                width: 100,
                child: TextButton(
                    style: selectedIndex==index? ButtonStyle(backgroundColor: MaterialStateProperty.all(blue1),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                            )
                        )

                    ):
                        ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)
                        , shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: blue1)
                                )
                            )
                        ),
                    onPressed: (){
                      setState(() {
                        selectedIndex=index;
                      });
                      widget.getSelectedIndex(selectedIndex);
                    },
                    child: Text(widget.labels[index],
                      style: TextStyle(color: selectedIndex==index? Colors.white :Colors.black),

                    )),
              ),
            )

    );
  }
}







