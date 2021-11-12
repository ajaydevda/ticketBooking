import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/Bloc/Event.dart';
import 'package:ticket_booking/Bloc/State.dart';
import 'package:ticket_booking/Model/FerrylistModel.dart';
import 'package:ticket_booking/Model/LoginFailureResponseModel.dart';
import 'package:ticket_booking/Model/LoginSuccessResponse.dart';
import 'package:ticket_booking/Model/OtpFailResponse.dart';
import 'package:ticket_booking/Model/OtpSuccessResponse.dart';
import 'package:ticket_booking/Model/RegisterationSuccessResponseModel.dart';
import 'package:ticket_booking/Model/RegistrationResponseModel.dart';
import 'package:ticket_booking/Model/ResendOtpSuccessModel.dart';
import 'package:ticket_booking/Model/ResetPasswordResponseModel.dart';
import 'package:ticket_booking/Model/SourceDestinationModel.dart';
import 'package:ticket_booking/Utils/Api.dart';

import 'Repo.dart';

class AppBloc extends Bloc<AppEvents, AppState> {
  late AppRepo repoInstance;

  AppBloc({required this.repoInstance}) : super(InitialState());

  @override
  Stream<AppState> mapEventToState(AppEvents event) async* {
    if (event is RegisterEvent) {
      yield LoadingState();
      try {
        String jsonPost = json.encode(<String, dynamic>{
          "email": "${event.email}",
          "mobileNumber": "${event.mobileNumber}",
          "firstName": "${event.firstName}",
          "middleName": "${event.middleName}",
          "lastName": "${event.lastName}",
          "gender": "${event.gender}",
          "dateOfBirth": "${event.dateOfBirth}",
          "password": "${event.password}",
          "channelId": "${event.channelId}",
          "deviceId": "${event.deviceId}"
        });


        var response = await repoInstance.postApiResponse(jsonPostData: jsonPost, api: customerRegistration);

        var flowSetterFlag=response['verificationId'];
          dynamic resData;

          if( flowSetterFlag==null) {
          print(response['verificationId']);
          resData = RegistrationResponseModel.fromJson(response);
          yield RegisterFailedState(failure: resData);

          }
          else {
            resData=RegisterationSuccessResponseModel.fromJson(response);
            yield RegisterSuccessState(success: resData);

          }

      } catch (e) {
        yield FailedState(message: e.toString());
      }
    }

    else if(event is OtpVerificationEvent)
    {
      yield LoadingState();
      try {
        String jsonPost = json.encode(<String, dynamic>{
          "otp": "${event.otp}",
          "verificationId": "${event.verificationId}",
        });


        var response = await repoInstance.postApiResponse(jsonPostData: jsonPost, api: otpVerificationAndLogin);



        var flowSetterFlag=response['jwt'];
        dynamic resData;

        if( flowSetterFlag==null) {
          print(response['message']);

          resData = OtpFailResponse.fromJson(response);
          yield OtpFailedState(failure: resData);
        }
        else {
          resData=OtpSuccessResponse.fromJson(response);
          yield OtpSuccessState(success: resData);
        }

      } catch (e) {
        yield FailedState(message: e.toString());
      }
    }

    else if(event is LoginEvent)
    {
      yield LoadingState();
      try {
        String jsonPost = json.encode(<String, dynamic>{
          "email": "${event.email}",
          "password": "${event.password}",
          "channelId":"${event.channelId}"
        });

        var response = await repoInstance.putApiResponse(jsonPostData: jsonPost, api: login);
        var flowSetterFlag=response['jwt'];
        dynamic resData;


        if( flowSetterFlag==null) {
          print(response['message']);
          resData = FailureModel.fromJson(response);
          yield FailureState(failure: resData);
        }
        else {
          resData=LoginSuccessResponse.fromJson(response);
          yield LoginSuccessState(success: resData);
        }
      }
      catch (e) {
        print(e);
        yield FailedState(message: e.toString());
      }
    }

    else if(event is ResetPasswordEvent)
      {
        yield LoadingState();
        try {
          String jsonPost = json.encode(<String, dynamic>{
            "email": "${event.email}",
            "password": "${event.newPassword}",

          });

          var response = await repoInstance.putApiResponse(jsonPostData: jsonPost, api: forgotPassword);
          var flowSetterFlag=response['verificationId'];
          dynamic resData;


          if( flowSetterFlag==null) {
            print(response['message']);
            resData = FailureModel.fromJson(response);
            yield FailureState(failure: resData);
          }
          else {
            resData=ResetPasswordResponseModel.fromJson(response);
            yield ResetPasswordSuccessState(success: resData);
          }
        }
        catch (e) {
          yield FailedState(message: e.toString());
        }

      }


    else if(event is ResendOTPEvent)
    {
      yield LoadingState();
      try {
        String jsonPost = json.encode(<String, dynamic>{
          "verificationId": "${event.verificationId}",
        });

        var response = await repoInstance.postApiResponse(jsonPostData: jsonPost, api: resendOtp);
        var flowSetterFlag=response['verificationId'];
        dynamic resData;


        if( flowSetterFlag==null) {
          print(response['message']);
          resData = FailureModel.fromJson(response);
          yield FailureState(failure: resData);
        }
        else {
          resData=ResendOtpSuccessModel.fromJson(response);
          yield ResendPasswordSuccessState(success: resData);
        }
      }
      catch (e) {
        yield FailedState(message: e.toString());
      }

    }


    else if(event is GetSourceDestinationEvent)
    {
      yield LoadingState();
      try {

        var response = await repoInstance.getApiResponse(api: getSourceDestination,jsonPostData: '');
        var flowSetterFlag=response['ferryStops'];
        dynamic resData;


        if( flowSetterFlag==null) {
            print(response['ferryStops']);
            resData = FailureModel.fromJson(response);
            yield FailureState(failure: resData);
        }
        else {
            resData=SourceDestinationModel.fromJson(response);
            yield ListSourceDestinationSuccessState(success: resData);
        }
      }
      catch (e) {
        yield FailedState(message: e.toString());
      }

    }



    else if (event is GetListOfFerryEvent) {
      yield LoadingState();
      try {

        String jsonPost = json.encode(<String, dynamic>{
          "sourceStation": "${event.sourceStation}",
          "destinationStation": "${event.destinationStation}",
          "instanceDate": "${event.instanceDate}",
        });

        var response = await repoInstance.postApiResponse(
            api: numOfFerries, jsonPostData: jsonPost);
        var flowSetterFlag = response['tickets'];
        dynamic resData;

        if (flowSetterFlag.length ==0) {
          resData = FailureModel.fromJson(response);
          yield FailureState(failure: resData);
        } else {
          resData = FerrylistModel.fromJson(response);
          yield ListFerrySuccessState(success: resData);
        }
      } catch (e) {
        yield FailedState(message: e.toString());
      }
    }

  }
}
