import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ticket_booking/BookNewTicket/BookNewTicket.dart';
import 'package:ticket_booking/DashBoard/DashBoardScreen.dart';
import 'package:ticket_booking/ResetPassword/ResetPasswordScreen.dart';
import 'package:ticket_booking/Utils/Colors.dart';
import 'ListOfAvailabelFerry/AvilabelFerry.dart';
import 'Login/LoginScreen.dart';
import 'OTPScreen/OtpVerificationScreen.dart';
import 'SignUp/SignUpScreen.dart';
import 'SplashScreen/SplashScreen.dart';
import 'WalkThrough/WalkOverScreen.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/walkOver': (context) => const WalkOverScreen(),
        '/signUp':(context)=> const SignUpScreen(),
        '/LoginScreen':(context)=> const LoginScreen(),
        '/ResetPasswordScreen':(context)=> const ResetPasswordScreen(),
        '/DashBoardScreen':(context)=> const DashBoardScreen(),
        '/OtpVerificationScreen':(context) => const OtpVerificationScreen(),
        '/BookNewTicket':(context) => const BookNewTicket(),
        '/AvailableFerry':(context) => const AvailableFerry(),

      },

      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: blue1,
          primaryVariant: skyBlue,
          background: white,
          ),
          textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,letterSpacing: 1),
          bodyText2: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,letterSpacing: 0),
          headline1: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,letterSpacing: 0,color: Colors.black)
          ),
      ),


    );
  }
}

