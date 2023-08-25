

import '../../../../models/ResetPassword_model.dart';

abstract class ResetPassStates {}

class ResretInitialState extends ResetPassStates {}

class ResetLoadingState extends ResetPassStates {}

class ResetPassSuccessState extends ResetPassStates {
  ResetPassword_model? ResetpassModel;
  ResetPassSuccessState(this.ResetpassModel);
}

class ResetErrorState extends ResetPassStates {
  final String error;
  ResetErrorState(this.error);
}

class ChangePasswordVisibilityState extends ResetPassStates {}