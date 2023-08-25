import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/AdminPaymentModel.dart';
import 'package:san3a/modules/Admin/Payment/Paid/Cubit/AdminPaymentStates.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class PaidPaymentCubit extends Cubit<AdminPaidStates> {
  PaidPaymentCubit() : super(AdminPaymentInitialState());

  static PaidPaymentCubit get(context) => BlocProvider.of(context);


  PaymentPaidModel? paymentPaidModel;

  void GetAllPaidPaymentForAdmin({required String token}) {
    emit(AdminPaymentLoadingState());
    DioHelper.getData(
      url: ADMINGETPAIDPAYMENT,
      token: token,
    ).then((value) {
      paymentPaidModel = PaymentPaidModel.fromJson(value.data);
      emit(AdminGetPaidPaymentSuccessState(paymentPaidModel));
    }).catchError((error) {
      print(error.toString());
      emit(AdminPaymentErrorState(error.toString()));

    });
  }
  //
  // void DeletePaidPaymentForAdmin({required String token, required String helpMeId}) {
  //   emit(AdminPaymentDeleteLoadingState());
  //   DioHelper.postData(
  //     url: ADMINDELETEHELPME,
  //     token: token,
  //     data: {
  //       'helpMeId': helpMeId,
  //     },
  //   ).then((value) {
  //     paymentPaidModel = PaymentPaidModel.fromJson(value.data);
  //     emit(AdminDeletePaymentSuccessState(paymentPaidModel));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(AdminDeletePaymentErrorState(error.toString()));
  //
  //   });
  // }

}