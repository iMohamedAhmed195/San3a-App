import 'dart:io';

import 'package:san3a/models/register_model.dart';

enum UserTypesOption {
  Worker,
  Customer,
}

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class VisibilityForWorkerState extends RegisterStates {}

class ProfileImageSuccessStates extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class UserTypeOptionState extends RegisterStates {}

class ChangeOptionState extends RegisterStates {}
class ChangePhoneState extends RegisterStates {}

class AgreemenTremstStateDone extends RegisterStates {}

class DropdownCraftChooseState extends RegisterStates {}

class PhotoUploadState extends RegisterStates {
  final File? image;
  PhotoUploadState({this.image});
}

class PhotoUploadErrorState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final RegisterModel regesterModel;

  RegisterSuccessState(this.regesterModel);
}

class RegisterErorrState extends RegisterStates {
  final String error;
  RegisterErorrState(this.error);
}

// class RegisterRadioButtonState extends RegisterStates {
//   final UserTypesOption selectedOption;
//   RegisterRadioButtonState({required this.selectedOption});
// }

// class RegisterDropdownListState extends RegisterStates {
//   final UserTypesOption selectedOption;
//   RegisterDropdownListState({required this.selectedOption});
// }

class ProfileImageErrorStates extends RegisterStates {
  //final String erorr;
  // ProfileImageErrorStates(this.erorr);
}

class RegisterchangePaasswordVisibilityState extends RegisterStates {}
