
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/PaymentUnPaidModel.dart';
import 'package:san3a/modules/Admin/Payment/UnPaid/Cubit/UnPaidStates.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class UnPaidPaymentCubit extends Cubit<AdminUnPaidStates> {
  UnPaidPaymentCubit() : super(AdminPaymentInitialState());

  static UnPaidPaymentCubit get(context) => BlocProvider.of(context);


  UnPaidPaymentModel? unPaidPaymentModel;

  void GetAllUnPaidPaymentForAdmin({required String token}) {
    emit(AdminPaymentLoadingState());
    DioHelper.getData(
      url: ADMINGETUNPAIDPAYMENT,
      token: token,
    ).then((value) {
      unPaidPaymentModel = UnPaidPaymentModel.fromJson(value.data);
      emit(AdminGetPaidPaymentSuccessState(unPaidPaymentModel));
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