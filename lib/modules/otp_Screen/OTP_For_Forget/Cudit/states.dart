

import 'package:san3a/models/otp_model.dart';

abstract class OtpForgetStates {}

class OtpInitialState extends OtpForgetStates {}

class OtpLoadingState extends OtpForgetStates {}

class otpSuccessState extends OtpForgetStates {
  OtpModel? otpModel;
  otpSuccessState(this.otpModel);
}

class otpErrorState extends OtpForgetStates {
  final String error;
  otpErrorState(this.error);
}
