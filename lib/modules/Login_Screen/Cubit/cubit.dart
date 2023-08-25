
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/login_model.dart';
import 'package:san3a/modules/Login_Screen/Cubit/states.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_worker.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<AppLoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

   LoginModel? loginModel;

  void userLogin({required String email, required String password}) {
    emit(LoginLoadingState());

    DioHelper.postData(
        url: LOGIN,
        data: {
          'email': email,
          'password': password})
        .then((value) {
      loginModel= LoginModel.fromJson(value.data);

      // print(value.data.toString());
      // print(loginModel!.message);
      // print(loginModel!.data!.name);
      emit(LoginSuccessState(loginModel));
    }).catchError((error){
      emit(LoginErrorState());
      print(error.toString());


    });
  }

  IconData suffix=Icons.visibility_outlined;
  bool isPassword=true;

  void ChangePasswordVisibilit()
  {
    isPassword =!isPassword;
    suffix=isPassword ?Icons.visibility_outlined: Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}



























// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tryfix/modules/Login_Screen/Cubit/states.dart';
// import 'package:tryfix/shared/network/remote/dio_helper.dart';
//
// import '../../../models/login_model.dart';
//
// class LoginCubit extends Cubit<AppLoginStates> {
//   LoginCubit() : super(LoginInitialState());
//
//   static LoginCubit get(context) => BlocProvider.of(context);
//   late LoginModel loginModel;
//
//   void userLogin({
//     required String email,
//     required String password,
//   }) {
//     emit(LoginLoadingState());
//     DioHelper.postData(url: 'LOGIN', data: {
//       'email': email,
//       'password': password,
//     }).then((value) {
//
//       print('aha henaaa cubit');
//       loginModel = LoginModel.fromJson(value.data);
//       print(loginModel);
//       emit(LoginSuccessState(loginModel));
//     }).catchError((error){
//       print(error.toString());
//      emit(LoginErrorState(error.toString()));
//     });
//   }
//
//   IconData suffix = Icons.visibility_outlined;
//   bool isPassword = true;
//
//   void changePasswordVisibility()
//   {
//     isPassword = !isPassword;
//     suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;
//     emit(ChangePasswordVisibilityState());
//   }
// }
