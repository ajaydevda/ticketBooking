import 'package:equatable/equatable.dart';

abstract class AppEvents extends Equatable {}

class RegisterEvent extends AppEvents {
  late String? email;
  late String? mobileNumber;
  late String? firstName;
  late String? middleName;
  late String? lastName;
  late String? gender;
  late String? dateOfBirth;
  late String? password;
  late String? channelId;
  late String? deviceId;

  RegisterEvent(
      {this.email,
      this.mobileNumber,
      this.firstName,
      this.middleName,
      this.lastName,
      this.gender,
      this.dateOfBirth,
      this.password,
      this.channelId,
      this.deviceId});

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class OtpVerificationEvent extends AppEvents {
  late String otp;

  late String verificationId;

  OtpVerificationEvent({required this.otp, required this.verificationId});

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginEvent extends AppEvents {
  late String email;

  late String password;

  late int channelId;

  LoginEvent(
      {required this.email, required this.password, required this.channelId});

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ResetPasswordEvent extends AppEvents {
  late String newPassword;

  late String email;

  ResetPasswordEvent({required this.newPassword, required this.email});

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ResendOTPEvent extends AppEvents {
  late String verificationId;

  ResendOTPEvent({required this.verificationId});

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetSourceDestinationEvent extends AppEvents {
  GetSourceDestinationEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}


class GetListOfFerryEvent extends AppEvents {
  late String sourceStation;
  late String destinationStation;
  late String instanceDate;

  GetListOfFerryEvent({required this.sourceStation, required this.destinationStation,required this.instanceDate});

  @override
  // TODO: implement props
  List<Object> get props => [];
}