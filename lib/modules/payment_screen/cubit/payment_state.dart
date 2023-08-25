 abstract class PaymentCubitState{}
 class PaymentCubitInitial extends PaymentCubitState{}

 class PaymentAuthLoadingState extends PaymentCubitState{}
 class PaymentAuthSucessState extends PaymentCubitState{}
 class PaymentAuthErrorState extends PaymentCubitState{}

 class PaymentGetOrderRegistrationIdLoadingState extends PaymentCubitState{}
 class PaymentGetOrderRegistrationIdSucessState extends PaymentCubitState{}
 class PaymentGetOrderRegistrationIdErrorState extends PaymentCubitState{}

 class getPaymentRequestRegistrationIdLoadingState extends PaymentCubitState{}
 class getPaymentRequestRegistrationIdSucessState extends PaymentCubitState{}
 class getPaymentRequestRegistrationIdErrorState extends PaymentCubitState{}

 class getRefCodeRegistrationIdLoadingState extends PaymentCubitState{}
 class getRefCodeRegistrationIdSucessState extends PaymentCubitState{}
 class getRefCodeRegistrationIdErrorState extends PaymentCubitState{}