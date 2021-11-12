import 'package:flutter/material.dart';

class AddRemoveWidget extends StatefulWidget {
  late Function onChange;
  late String label;

  AddRemoveWidget({required this.onChange,required this.label});
  @override
  _AddRemoveWidgetState createState() => _AddRemoveWidgetState();
}

class _AddRemoveWidgetState extends State<AddRemoveWidget> {

  int value=0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text("${widget.label}", style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14),),
        SizedBox(
          width: 40,
          height: 40,
          child: Material(
            clipBehavior:Clip.hardEdge ,
            color: Colors.white,
            child: IconButton(
              onPressed: (){
              setState(() {
                value=value+1;
                widget.onChange(value);
              });
            }, icon: Icon(Icons.add_circle_outline),),
          ),
        ),

        Text("${value.toString()}"),

        SizedBox(
          width: 40,
          height: 40,
          child: Material(
            clipBehavior:Clip.hardEdge ,
            color: Colors.white,
            child: IconButton(onPressed: (){
              if(value>0)
              setState(() {
                value=value-1;
                widget.onChange(value);
              });

            }, icon: Icon(Icons.remove_circle_outline),),
          ),
        ),


      ],
    );
  }
}
