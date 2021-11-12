import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardMenu extends StatelessWidget{

  final String image;
  final String text;
  final Function onPressed;
  const DashBoardMenu({required this.image,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return InkWell(
    onTap: () =>{
    onPressed()
  } ,
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Image.asset(image,width: MediaQuery.of(context).size.width/3,height: 70,),
        Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Text(text,style: Theme.of(context).textTheme.headline1,),
        )
        ],
      ),
  );

  }
}
