import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/payment_screen/Network/dioHelperPayment.dart';
import 'package:san3a/modules/payment_screen/cubit/payment_state.dart';
import 'package:san3a/shared/component/constant.dart';

class PaymentCubitCubit extends Cubit<PaymentCubitState> {
  PaymentCubitCubit() : super(PaymentCubitInitial());
  static PaymentCubitCubit get(context) => BlocProvider.of(context);

  Future<void> getAuthToken() async {
    emit(PaymentAuthLoadingState());
    DioHelperPayment.postDataDio(
        url: ApiConst.getAuthToken,
        data: {
      "api_key": ApiConst.paymentApiKey,
    }).then((value) {

      ApiConst.paymentFirstToken = value.data['token'];
      print ('ana henaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ahoooo ===== > 1');
      print("the tooooooooken${ApiConst.paymentFirstToken}");
      emit(PaymentAuthSucessState());
    }).catchError((error) {
      print ('ana henaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ahoooo ===== > error 1');
      emit(PaymentAuthErrorState());
    });
  }

  /////////////////////////////////////////////////////////////////////////
  Future getOrderRegisterationId({
    required String name,
    required String email,
    required String phone,
  }) async {
    emit(PaymentGetOrderRegistrationIdLoadingState());
    DioHelperPayment.postDataDio(
        url: ApiConst.getOrderId,
        data: {
      "auth_token": ApiConst.paymentFirstToken,
      "delivery_needed": "false",
      "amount_cents": "100",
      "currency": "EGP",
      "items": [],
    }).then((value) {
      print ('ana henaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ahoooo ===== > 2');
      ApiConst.payementOrderId = value.data['id'];
      print ('ana henaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ahoooo ===== > 22');
      getPaymentRequest(
        name: name, email: email, phone: phone,);
      print ('ana henaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ahoooo ===== > 222');
      emit(PaymentGetOrderRegistrationIdSucessState());
    }).catchError((error) {
      print ('ana henaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ahoooo ===== > error 2');
      print('=======================> Error here 2 ${error.toString()}');
      emit(PaymentGetOrderRegistrationIdErrorState());
    });
  }

  Future<void> getPaymentRequest({
    required String name,
    required String email,
    required String phone,
  }) async {
    emit(getPaymentRequestRegistrationIdLoadingState());
    DioHelperPayment.postDataDio(
        url: ApiConst.getPaymentId,
        data: {
      "auth_token": ApiConst.paymentFirstToken,
      "amount_cents": "10000",
      "expiration": 3600,
      "order_id": ApiConst.payementOrderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": name,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": "Ahmed",
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": ApiConst.integrationIdCart,
      "lock_order_when_paid": "false"
    }).then((value) {
      ApiConst.finalToken = value.data['token'];
      print ('ana henaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ahoooo ===== > 3');
      print("the tooooooooken${ApiConst.finalToken}");
      emit(getPaymentRequestRegistrationIdSucessState());
    }).catchError((error) {
      print ('ana henaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ahoooo ===== > error 3');
      print('=======================> Error here 3  ${error.toString()}');
      emit(getPaymentRequestRegistrationIdErrorState());
    });
  }

  Future<void> getRefCode() async {
    emit(getRefCodeRegistrationIdLoadingState());
    DioHelperPayment.postDataDio(
        url: ApiConst.getRefCode,
        data: {
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
      "payment_token": ApiConst.finalToken
    }).then((value) {
      ApiConst.refCode = value.data['id'].toString();
      emit(getRefCodeRegistrationIdSucessState());
    }).catchError((error) {
      print('=======================> Error here ${error.toString()}');
      emit(getRefCodeRegistrationIdErrorState());
    });
  }

  void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => widget,
        ),
        (route) => false,
      );
}
