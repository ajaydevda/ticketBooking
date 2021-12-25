import 'package:flutter/material.dart';

validationAlert({required BuildContext context, msg}) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Alert",
      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),
    ),
    content: Text(msg, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey)),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
