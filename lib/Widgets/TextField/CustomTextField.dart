//CustomTextField
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking/Utils/Colors.dart';

class CustomTextField extends StatelessWidget
{
  final String? hint;
  final String? label;
  final bool? isMandatory;
  final TextEditingController? textEditingController;
  final String? error;
  final bool? isObscure;
  final bool? isEnabled;
  final TextInputType? keyPadType;
  const CustomTextField({this.hint,this.textEditingController,this.label="",this.isMandatory=false,this.error,this.isObscure, this.isEnabled=true, this.keyPadType=TextInputType.text});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom:10.0),
          child: Row(
            children: [
              Text(label!,style: TextStyle(fontSize: 14.0),),
              isMandatory! ?
              Text(" *",style: TextStyle(fontSize: 14.0,color: Colors.red),):Container(),

            ],
          ),
        ),
        TextField(
          autofocus: false,
          obscureText: isObscure!,
          controller: textEditingController,
          enabled: isEnabled,
          keyboardType: keyPadType,
          style: TextStyle(fontSize: 14.0, color: Color(0xFF000000)),
          decoration: InputDecoration(
            errorText: error,
            filled: true,
            fillColor: textFieldFill,
            hintText: hint,
            hintStyle: TextStyle(fontSize: 14),
            contentPadding: const EdgeInsets.only(left: 10.0, bottom: 8.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.7),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.7),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.7),
            ),
          ),
        ),
      ],
    );
  }
}