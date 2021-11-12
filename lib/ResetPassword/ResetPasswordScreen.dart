//ResetPasswordScreen
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/Bloc/Bloc.dart';
import 'package:ticket_booking/Bloc/Event.dart';
import 'package:ticket_booking/Bloc/Repo.dart';
import 'package:ticket_booking/Bloc/State.dart';
import 'package:ticket_booking/Utils/Encrption.dart';
import 'package:ticket_booking/Utils/Images.dart';
import 'package:ticket_booking/Utils/Strings.dart';
import 'package:ticket_booking/Widgets/Buttons/LoginButton.dart';
import 'package:ticket_booking/Widgets/LoadingSpinner/LoadingAlert.dart';
import 'package:ticket_booking/Widgets/TextField/CustomTextField.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreen createState() => _ResetPasswordScreen();
}

class _ResetPasswordScreen extends State<ResetPasswordScreen> {
  int currentPage = 0;
  bool value = false,value1=false;

  late TextEditingController newPasswordCtrl;
  late TextEditingController confirmPasswordCtrl;
  late TextEditingController emailCtrl;

  late AesEncryption aesEncryption;

  @override
  void initState() {
    // TODO: implement initState
    emailCtrl=TextEditingController();
    newPasswordCtrl=TextEditingController();
    confirmPasswordCtrl=TextEditingController();
    aesEncryption = AesEncryption();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
        create: (context) => AppBloc(
          repoInstance: AppRepo(),
        ),
        child: BlocListener<AppBloc, AppState>(listener: (context, state) {
          if (state is FailureState) {
            Navigator.of(context).pop();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 4),
                backgroundColor: Colors.red,
                content: Text(state.failure.message),
              ),
            );

          } else if (state is LoadingState) {
            showLoaderDialog(context);
          } else if (state is ResetPasswordSuccessState) {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/OtpVerificationScreen',arguments: {'verificationId': state.success.verificationId});

          }
        }, child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          if (state is FailureState) {

          } else if (state is ResetPasswordSuccessState) {

          }

          return Scaffold(
              body: SafeArea(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      child: Image.asset(
                        ribbon,
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                      ),
                    ),

                    SingleChildScrollView(
                      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.only(left:0.0,top: 20),
                                      child: Text(resetPassword,style: TextStyle(color: Colors.black,fontSize: 32,letterSpacing: 0.1),),
                                    )
                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: CustomTextField(
                                    label: "Mobile Number / Email Address",
                                    hint: "Registered Mobile Number / Email Address",
                                    isObscure: false,
                                    isMandatory: true,
                                    textEditingController: emailCtrl,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: CustomTextField(
                                    label: "New Password",
                                    hint: "New password (min. 8-16 characters)",
                                    isMandatory: true,
                                    textEditingController: newPasswordCtrl,
                                    keyPadType: TextInputType.text,
                                    error: null,
                                    isObscure: false,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0,bottom: 10),
                                  child: CustomTextField(
                                    label: "Confirm Password",
                                    hint: "Re-enter new password",
                                    isMandatory: true,
                                    textEditingController: confirmPasswordCtrl,
                                    keyPadType: TextInputType.text,
                                    error: null,
                                    isObscure: false,


                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0, bottom: 20),
                                  child: Align(
                                    alignment:Alignment.centerRight ,
                                    child: LoginButton(
                                      onPressed: () {
                                        var encryptedPw;

                                        if (newPasswordCtrl.text.isNotEmpty) {
                                          encryptedPw = aesEncryption
                                              .encryptData(input: newPasswordCtrl.text)
                                              .base64;
                                        }
                                        else {
                                          encryptedPw = "";
                                        }

                                        BlocProvider.of<AppBloc>(context).add(
                                            ResetPasswordEvent(
                                                email: emailCtrl.text,
                                                newPassword: encryptedPw
                                            )
                                        );

                                      },
                                      label: "Submit",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));

        })));



  }
}
