//OtpVerificationScreen

//ResetPasswordScreen
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/Bloc/Bloc.dart';
import 'package:ticket_booking/Bloc/Event.dart';
import 'package:ticket_booking/Bloc/Repo.dart';
import 'package:ticket_booking/Bloc/State.dart';
import 'package:ticket_booking/Utils/Images.dart';
import 'package:ticket_booking/Utils/Strings.dart';
import 'package:ticket_booking/Widgets/Buttons/LoginButton.dart';
import 'package:ticket_booking/Widgets/LoadingSpinner/LoadingAlert.dart';
import 'package:ticket_booking/Widgets/TextField/CustomTextField.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  _OtpVerificationScreen createState() => _OtpVerificationScreen();
}

class _OtpVerificationScreen extends State<OtpVerificationScreen> {
  late TextEditingController otpCtrl;
  late String error = '';
  late String verificationId;

  @override
  void initState() {
    // TODO: implement initState
    otpCtrl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    verificationId = routes['verificationId']!;

    return BlocProvider(
        create: (context) => AppBloc(
              repoInstance: AppRepo(),
            ),
        child: BlocListener<AppBloc, AppState>(listener: (context, state) {
          if (state is OtpFailedState) {
            Navigator.of(context).pop();
          } else if (state is LoadingState) {
            showLoaderDialog(context);
          } else if (state is ResendPasswordSuccessState) {
            Navigator.of(context).pop();
          } else if (state is OtpSuccessState) {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/LoginScreen');
          }
        }, child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          if (state is OtpFailedState) {
            state.failure.validationErrors.where((element) {
              if (element.value == "OTP Verification" ||
                  element.value == "OTP" ||
                  element.value == "Account Status") {
                error = element.error;
              }
              return false;
            }).toList();
          } else if (state is ResendPasswordSuccessState) {

            print(state.success.verificationId);
            verificationId = state.success.verificationId;
          } else if (state is OtpSuccessState) {
            error = "";
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
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
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
                                  padding:
                                      const EdgeInsets.only(left: 0.0, top: 20),
                                  child: Text(
                                    otp,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 32,
                                        letterSpacing: 0.1),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: CustomTextField(
                                label: "Please Enter OTP",
                                hint: "OTP",
                                isMandatory: true,
                                isEnabled: true,
                                textEditingController: otpCtrl,
                                isObscure: false,
                                keyPadType: TextInputType.number,
                                error: error == "" ? null : error,
                              ),
                            ),
                            InkWell(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text("Resend OTP"),
                              ),
                              onTap: () {

                                BlocProvider.of<AppBloc>(context).add(
                                    ResendOTPEvent(
                                        verificationId: verificationId));


                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40.0, bottom: 20),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: LoginButton(
                                  onPressed: () {
                                    BlocProvider.of<AppBloc>(context).add(
                                        OtpVerificationEvent(
                                            otp: otpCtrl.text,
                                            verificationId:verificationId));
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
