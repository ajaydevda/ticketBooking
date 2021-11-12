import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/Bloc/Bloc.dart';
import 'package:ticket_booking/Bloc/Event.dart';
import 'package:ticket_booking/Bloc/Repo.dart';
import 'package:ticket_booking/Bloc/State.dart';
import 'package:ticket_booking/Logic/NameSpliter.dart';
import 'package:ticket_booking/Utils/Colors.dart';
import 'package:ticket_booking/Utils/Encrption.dart';
import 'package:ticket_booking/Utils/Images.dart';
import 'package:ticket_booking/Utils/Strings.dart';
import 'package:ticket_booking/Widgets/Buttons/AnimatedToggle.dart';
import 'package:ticket_booking/Widgets/Buttons/IconCircularButton.dart';
import 'package:ticket_booking/Widgets/Buttons/LoginButton.dart';
import 'package:ticket_booking/Widgets/LoadingSpinner/LoadingAlert.dart';
import 'package:ticket_booking/Widgets/TextField/CustomTextField.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreen createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  int currentPage = 0;
  bool value = false;
  late TextEditingController fullNameCtrl,
      emailCtrl,
      passwordCtrl,
      mobCtrl,
      dobCtrl;
  late String nameError = "",
      emailError = "",
      passwordError = "",
      mobError = "";
  late AesEncryption aesEncryption;
  DateTime selectedDate = DateTime(1993, 3);
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final DateFormat formatter2 = DateFormat('yyyyMMdd');

  int _toggleValue = 0;
  late String dob;

  @override
  void initState() {
    // TODO: implement initState

    fullNameCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    mobCtrl = TextEditingController();
    dobCtrl = TextEditingController();
    aesEncryption = AesEncryption();
    dobCtrl.text = formatter.format(selectedDate);
    dob = formatter2.format(selectedDate);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppBloc(
              repoInstance: AppRepo(),
            ),
        child: BlocListener<AppBloc, AppState>(listener: (context, state) {
          if (state is RegisterFailedState) {
            Navigator.of(context).pop();

//
//            ScaffoldMessenger.of(context).showSnackBar(
//              SnackBar(
//                duration: Duration(seconds: 4),
//                backgroundColor: Colors.red,
//                content: Text(state.failure.message!),
//              ),
//            );

          } else if (state is LoadingState) {
            showLoaderDialog(context);
          } else if (state is RegisterSuccessState) {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/OtpVerificationScreen',
                arguments: {'verificationId': state.success.verificationId});
          }
        }, child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          if (state is RegisterFailedState) {
            emailError = "";
            mobError = "";
            passwordError = "";
            nameError = "";

            state.failure.validationErrors!.where((element) {
              if (element.value == "Email") {
                emailError = element.error;
              } else if (element.value == "MobileNumber") {
                mobError = element.error;
              } else if (element.value == "Password") {
                passwordError = element.error;
              } else if (element.value == "FirstName" ||
                  element.value == "LastName") {
                nameError = element.error;
              }
              return false;
            }).toList();
          } else if (state is RegisterSuccessState) {
            emailError = "";
            mobError = "";
            passwordError = "";
            nameError = "";
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
                                IconCircularButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  image: backButton,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 20),
                                  child: Text(
                                    signUpText4,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 32),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: CustomTextField(
                                label: "Your Name",
                                hint: "Full Name",
                                isMandatory: true,
                                textEditingController: fullNameCtrl,
                                error: nameError != "" ? nameError : null,
                                isObscure: false,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: CustomTextField(
                                label: "Email Address",
                                hint: "Email Address",
                                isMandatory: true,
                                textEditingController: emailCtrl,
                                isObscure: false,
                                error: emailError != "" ? emailError : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: CustomTextField(
                                label: "Password",
                                hint: "Password (min 8-16 characters)",
                                isMandatory: true,
                                textEditingController: passwordCtrl,
                                isObscure: true,
                                error:
                                    passwordError != "" ? passwordError : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: CustomTextField(
                                label: "Mobile Number",
                                hint: "Mobile Number",
                                isMandatory: true,
                                textEditingController: mobCtrl,
                                isObscure: false,
                                keyPadType: TextInputType.number,
                                error: mobError != "" ? mobError : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: InkWell(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: CustomTextField(
                                  label: "Date Of Birth",
                                  hint: "DD/MM/YYYY",
                                  isMandatory: true,
                                  textEditingController: dobCtrl,
                                  isObscure: false,
                                  isEnabled: false,
                                  error: mobError != "" ? mobError : null,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30.0, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Gender",
                                          style: TextStyle(fontSize: 14.0),
                                        ),
                                        Text(
                                          " *",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AnimatedToggle(
                                    values: ['Male', 'Female'],
                                    onToggleCallback: (value) {
                                      setState(() {
                                        _toggleValue = value;
                                      });
                                    },
                                    buttonColor: blue1,
                                    backgroundColor: white,
                                    textColor: black,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  child: Text(signUpText1),
                                ))
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40.0, bottom: 20),
                              child: LoginButton(
                                onPressed: () {
                                  var encryptedPw;

                                  if (passwordCtrl.text.isNotEmpty) {
                                    encryptedPw = aesEncryption
                                        .encryptData(input: passwordCtrl.text)
                                        .base64;
                                  } else {
                                    encryptedPw = "";
                                  }

                                  var name =
                                      NameSpliter(fullName: fullNameCtrl.text);

                                  BlocProvider.of<AppBloc>(context).add(
                                      RegisterEvent(
                                          channelId: "1",
                                          dateOfBirth: dob,
                                          deviceId: "",
                                          email: emailCtrl.text,
                                          firstName: name.getFirstName(),
                                          gender: _toggleValue == 0 ? "1" : "0",
                                          lastName: name.getLastName(),
                                          middleName: name.getSecondName(),
                                          mobileNumber: mobCtrl.text,
                                          password: encryptedPw));
                                },
                                label: "Sign Up",
                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: signUpText2,
                                    style: TextStyle(color: Colors.black87)),
                                TextSpan(
                                    text: signUpText3,
                                    style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.bold),
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {
                                        //LoginScreen
                                        Navigator.pushNamed(
                                            context, '/LoginScreen');
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1965, 8),
        lastDate: DateTime(2000));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dobCtrl.text = formatter.format(selectedDate);
        dob = formatter2.format(selectedDate);
      });
  }

  @override
  void dispose() {
    fullNameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    mobCtrl.dispose();

    super.dispose();
  }
}
