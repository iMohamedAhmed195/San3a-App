

import 'package:san3a/models/AdminPaymentModel.dart';

abstract class AdminPaidStates{}

class AdminPaymentInitialState extends AdminPaidStates {}

class AdminPaymentLoadingState extends AdminPaidStates {}

class AdminPaymentDeleteLoadingState extends AdminPaidStates {}

class AdminGetPaidPaymentSuccessState extends AdminPaidStates {
  PaymentPaidModel? paymentPaidModel;
  AdminGetPaidPaymentSuccessState(this.paymentPaidModel);
}


class AdminPaymentErrorState extends AdminPaidStates {
  final String error;
  AdminPaymentErrorState(this.error);
}

class AdminDeletePaymentSuccessState extends AdminPaidStates {
  PaymentPaidModel? paymentPaidModel;
  AdminDeletePaymentSuccessState(this.paymentPaidModel);
}

class AdminDeletePaymentErrorState extends AdminPaidStates {
  final String error;
  AdminDeletePaymentErrorState(this.error);
}

