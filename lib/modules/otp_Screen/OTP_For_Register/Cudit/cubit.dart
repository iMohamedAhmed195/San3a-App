import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/otp_model.dart';
import 'package:san3a/modules/otp_Screen/OTP_For_Register/Cudit/states.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class OtpRegisterCubit extends Cubit <OtpRegisterStates> {
  OtpRegisterCubit() : super(OtpInitialState());

  static OtpRegisterCubit get(context) => BlocProvider.of(context);

  OtpModel? otpModel;

  void OTPPostForEmail({required String otp}) {
    emit(OtpLoadingState());
    DioHelper.postData(
        url: OTPCODEFOREMAIL,
        data: {
          'otp': otp,
        },).then((value) {
      otpModel = OtpModel.fromJson(value.data);
      print(value.data.toString());
      print(otpModel!.message);
      emit(otpSuccessState(otpModel));
    }).catchError((error) {
        print(error.toString());
      emit(otpErrorState(error.toString()));
    });
  }

  void OTPPostForPhone({required String otp , required String phone}) {
    emit(OtpLoadingState());
    DioHelper.postData(
      url: OTPCODEFORPHONE,
      data: {
        'otp': otp,
        'phone' : phone,
      },).then((value) {
      otpModel = OtpModel.fromJson(value.data);
      print(value.data.toString());
      print(otpModel!.message);
      emit(otpSuccessState(otpModel));
    }).catchError((error) {
      print(error.toString());
      emit(otpErrorState(error.toString()));
    });
  }
}