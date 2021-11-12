import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/Bloc/Bloc.dart';
import 'package:ticket_booking/Bloc/Event.dart';
import 'package:ticket_booking/Bloc/Repo.dart';
import 'package:ticket_booking/Bloc/State.dart';
import 'package:ticket_booking/LocalStorage/SharedPreference.dart';
import 'package:ticket_booking/Utils/Encrption.dart';
import 'package:ticket_booking/Utils/Images.dart';
import 'package:ticket_booking/Utils/Strings.dart';
import 'package:ticket_booking/Widgets/Buttons/LoginButton.dart';
import 'package:ticket_booking/Widgets/LoadingSpinner/LoadingAlert.dart';
import 'package:ticket_booking/Widgets/TextField/CustomTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  int currentPage = 0;
  bool value = false, value1 = false;

  String emailError = '';
  String passwordError = '';

  late TextEditingController mobCtrl;
  late TextEditingController passCtrl;
  late AesEncryption aesEncryption;


  @override
  void initState() {
    // TODO: implement initState

    mobCtrl = TextEditingController(text: "trimax.surya@gmail.com");
    passCtrl = TextEditingController(text: "Surya@123456");
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

            if(state.failure.message!=null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 4),
                  backgroundColor: Colors.red,
                  content: Text(state.failure.message.toString()),
                ),
              );
            }

          } else if (state is LoadingState) {
            showLoaderDialog(context);
          } else if (state is LoginSuccessState) {

            Prefs.setInt("customerId", state.success.customerId);
            Prefs.setString("jwt", state.success.jwt);
            Prefs.setString("firstName", state.success.firstName);
            Prefs.setString("middleName", state.success.middleName);
            Prefs.setString("lastName", state.success.lastName);
            Prefs.setInt("gender", state.success.gender);
            Prefs.setString("dateOfBirth", state.success.dateOfBirth);
            Prefs.setString("email", state.success.email);
            Prefs.setString("mobileNumber", state.success.mobileNumber);



            Navigator.of(context).pop();
            Navigator.pushReplacementNamed(context, '/DashBoardScreen');
          }
        }, child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          if (state is FailureState) {

            emailError = "";
            passwordError = "";
            if(state.failure.validationErrors.length>0) {

              state.failure.validationErrors.where((element) {
                if (element.value == "Email") {
                  emailError = element.error;
                } else if (element.value == "Password") {
                  passwordError = element.error;
                }
                return false;
              }).toList();
            }
          } else if (state is LoginSuccessState) {
            emailError = "";
            passwordError = "";
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
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 20),
                                  child: Text(
                                    loginText5,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 32),
                                  ),
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
                                textEditingController: mobCtrl,
                                error: emailError==""?null:emailError,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30.0, bottom: 10),
                              child: CustomTextField(
                                label: "Password",
                                hint: "Password",
                                isMandatory: true,
                                isObscure: true,
                                textEditingController: passCtrl,
                                error: passwordError==""?null:passwordError,

                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: "Forgot Password? ",
                                    style: TextStyle(color: Colors.black87)),
                                TextSpan(
                                    text: "Reset it",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500),
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {

                                        Navigator.pushNamed(context, '/ResetPasswordScreen');

                                      }),
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 24.0,
                                    width: 24.0,
                                    child: Checkbox(
                                      value: value,
                                      checkColor: Colors.white,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(loginText1),
                                  ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 24.0,
                                    width: 24.0,
                                    child: Checkbox(
                                      value: value1,
                                      checkColor: Colors.white,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.value1 = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(loginText2),
                                  ))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40.0, bottom: 20),
                              child: LoginButton(
                                onPressed: () {
                                  // Navigator.pushReplacementNamed(context, '/DashBoardScreen');

                                  var encryptedPw;

                                  if (passCtrl.text.isNotEmpty) {
                                    encryptedPw = aesEncryption
                                        .encryptData(input: passCtrl.text)
                                        .base64;
                                  } else {
                                    encryptedPw = "";
                                  }

                                  BlocProvider.of<AppBloc>(context).add(
                                      LoginEvent(
                                          password: encryptedPw,
                                          email: mobCtrl.text,
                                          channelId: 1));
                                },
                                label: "Log in",
                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: loginText3,
                                    style: TextStyle(color: Colors.black87)),
                                TextSpan(
                                    text: loginText4,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500),
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(context, '/signUp');
                                      }),
                              ]),
                            )
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
