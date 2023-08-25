import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/payment_screen/ToggelScreen.dart';
import 'package:san3a/modules/payment_screen/cubit/payment_cubit.dart';
import 'package:san3a/modules/payment_screen/cubit/payment_state.dart';
import 'package:san3a/shared/component/component.dart';



class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {




    return BlocProvider(
      create: (context) => PaymentCubitCubit()..getAuthToken(),
      child: BlocConsumer<PaymentCubitCubit,PaymentCubitState>(
        listener:(context , state){
          if(state is getPaymentRequestRegistrationIdSucessState){
            navigateTo(context, ToggleScreen());
          }

        } ,
        builder: (context , state){
          return Scaffold();
        },
      ),);
  }
}

