
import 'package:san3a/models/PaymentUnPaidModel.dart';

abstract class AdminUnPaidStates{}

class AdminPaymentInitialState extends AdminUnPaidStates {}

class AdminPaymentLoadingState extends AdminUnPaidStates {}

class AdminPaymentDeleteLoadingState extends AdminUnPaidStates {}

class AdminGetPaidPaymentSuccessState extends AdminUnPaidStates {
  UnPaidPaymentModel? unPaidPaymentModel;
  AdminGetPaidPaymentSuccessState(this.unPaidPaymentModel);
}


class AdminPaymentErrorState extends AdminUnPaidStates {
  final String error;
  AdminPaymentErrorState(this.error);
}

class AdminDeletePaymentSuccessState extends AdminUnPaidStates {
  UnPaidPaymentModel? unPaidPaymentModel;
  AdminDeletePaymentSuccessState(this.unPaidPaymentModel);
}

class AdminDeletePaymentErrorState extends AdminUnPaidStates {
  final String error;
  AdminDeletePaymentErrorState(this.error);
}

