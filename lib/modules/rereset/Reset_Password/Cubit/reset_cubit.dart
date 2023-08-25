import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/ResetPassword_model.dart';
import 'package:san3a/modules/rereset/Reset_Password/Cubit/reset_states.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';


class ResetPassCubit extends Cubit<ResetPassStates> {
  ResetPassCubit() : super(ResretInitialState());

  static ResetPassCubit get(context) => BlocProvider.of(context);

  late ResetPassword_model ResetpassModel;

  void UserResetPass({required String pass, required String confpass, required String token}) {
    emit(ResetLoadingState());
    DioHelper.postData(
        url: RESETPASSWORD,
        data: {
          'password': pass,
          'passwordConfirm': confpass,},
        token: token,
    ).then((value) {
      ResetpassModel= ResetPassword_model.fromJson(value.data);
      emit(ResetPassSuccessState(ResetpassModel));
    }).catchError((error){
      emit(ResetErrorState(error.toString()));
      print(error.toString());
    });
  }

  IconData suffix= Icons.visibility_outlined;
  bool isPassword=true;

  void ChangePasswordVisibilit()
  {
    isPassword = !isPassword;
    suffix = isPassword ?Icons.visibility_outlined: Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
