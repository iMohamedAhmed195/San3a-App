
import 'package:san3a/models/otp_model.dart';

abstract class OtpRegisterStates {}

class OtpInitialState extends OtpRegisterStates {}

class OtpLoadingState extends OtpRegisterStates {}

class otpSuccessState extends OtpRegisterStates {
  OtpModel? otpModel;
  otpSuccessState(this.otpModel);
}

class otpErrorState extends OtpRegisterStates {
  final String error;
  otpErrorState(this.error);
}
