import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/Choose_send_model.dart';

import 'package:san3a/modules/Register_Screen/Verfiy_SignUp/Choose_send/Cubit/choose_send_states_Register.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class ChooseSendCubitRegister extends Cubit<ChooseSendStatesRegister> {

  ChooseSendCubitRegister() : super(ChooseInitialRegisterState());

  static ChooseSendCubitRegister get(context) => BlocProvider.of(context);

  ChooseSendModel? sendby;

  String type = "";

  void selectValue(String value) {
    type = value;
    emit(UserChooseSendRegisterState());
  }

  void SendOTP_To_Email({required String email}) async {
    await DioHelper.postData(
        url: CHOOOSE_SEND,
        data: {
          'email': email,
        }).then((value) {
      sendby = ChooseSendModel.fromJson(value.data);
      emit(ChooseSuccessRegisterState(sendby!));
    }).catchError((erorr) {
      print(erorr.toString());
      emit(ChooseSendErorrRegisterState(erorr));
    });
  }

  void SendOTP_To_Phone({required String phone}) async {
    await DioHelper.postData(
        url: CHOOOSE_SEND,
        data: {
          'phone': phone,
        }).then((value) {
      sendby = ChooseSendModel.fromJson(value.data);
      emit(ChooseSuccessRegisterState(sendby!));
    }).catchError((erorr) {
      print(erorr.toString());
      emit(ChooseSendErorrRegisterState(erorr.toString()));
    });
  }

}
