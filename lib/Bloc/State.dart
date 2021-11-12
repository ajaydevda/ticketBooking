import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking/Bloc/Event.dart';
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

@immutable
abstract class AppState extends Equatable {}

class InitialState extends AppState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends AppState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FailedState extends AppState {
  final String message;

  FailedState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class RegisterFailedState extends AppState {
  final RegistrationResponseModel failure;

  RegisterFailedState({required this.failure});

  @override
  // TODO: implement props
  List<Object> get props => [failure];
}

class RegisterSuccessState extends AppState {
  final RegisterationSuccessResponseModel success;

  RegisterSuccessState({required this.success});

  @override
  // TODO: implement props
  List<Object> get props => [success];
}

class OtpFailedState extends AppState {
  final OtpFailResponse failure;

  OtpFailedState({required this.failure});

  @override
  // TODO: implement props
  List<Object> get props => [failure];
}

class OtpSuccessState extends AppState {
  final OtpSuccessResponse success;

  OtpSuccessState({required this.success});

  @override
  // TODO: implement props
  List<Object> get props => [success];
}

class LoginSuccessState extends AppState {
  final LoginSuccessResponse success;

  LoginSuccessState({required this.success});

  @override
  // TODO: implement props
  List<Object> get props => [success];
}

class FailureState extends AppState {
  late final FailureModel failure;

  FailureState({required this.failure});

  @override
  // TODO: implement props
  List<Object> get props => [failure];
}

class ResetPasswordSuccessState extends AppState {
  late final ResetPasswordResponseModel success;
  ResetPasswordSuccessState({required this.success});
  @override
  // TODO: implement props
  List<Object> get props => [success];
}

class ResendPasswordSuccessState extends AppState {
  late final ResendOtpSuccessModel success;
  ResendPasswordSuccessState({required this.success});
  @override
  // TODO: implement props
  List<Object> get props => [success];
}
//SourceDestinationModel

class ListSourceDestinationSuccessState extends AppState {
  late final SourceDestinationModel success;
  ListSourceDestinationSuccessState({required this.success});
  @override
  // TODO: implement props
  List<Object> get props => [success];
}
//FerrylistModel

class ListFerrySuccessState extends AppState {
  late final FerrylistModel success;
  ListFerrySuccessState({required this.success});
  @override
  // TODO: implement props
  List<Object> get props => [success];
}