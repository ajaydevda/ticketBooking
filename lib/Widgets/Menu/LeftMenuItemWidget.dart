import 'package:flutter/material.dart';

class LeftMenuItemWidget extends StatelessWidget {

  final String image;
  final String text;
  Function onPressed;
  LeftMenuItemWidget({required this.image,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0,left: 10),
        child: Row(
          children: [
            SizedBox(
//              width: 24,height: 24,
                child: Image.asset(image,height: 35,width: 35,)),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text(this.text),
            )
          ],
        ),
      ),
      onTap: (){
        debugPrint("ABCD");
      },
    );
  }
}
