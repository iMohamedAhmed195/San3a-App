import '../../../models/login_model.dart';

abstract class AppLoginStates {}

class LoginInitialState extends AppLoginStates {}

class LoginLoadingState extends AppLoginStates {}

class LoginSuccessState extends AppLoginStates {
   LoginModel? loginModel;
  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends AppLoginStates {
   String error = 'invalid Email or Password';

}

class ChangePasswordVisibilityState extends AppLoginStates {}
