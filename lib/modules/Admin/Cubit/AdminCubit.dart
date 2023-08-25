import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/Admin/Complaints/ComplaintsScreen.dart';
import 'package:san3a/modules/Admin/Cubit/AdminStates.dart';
import 'package:san3a/modules/Admin/Payment/Paid/PaidPaymentScreen.dart';
import 'package:san3a/modules/Admin/Posts/PostsScreen.dart';
import 'package:san3a/modules/Admin/Users/Customer/AllCustomerScreen.dart';
import 'package:san3a/modules/Admin/Users/UsersScreen.dart';
import 'package:san3a/modules/Admin/Users/Worker/AllWorkerScreen.dart';



class AdminCubit extends Cubit<AdminStates> {
  AdminCubit() : super(AdminInitialState());
  static AdminCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;
  List<Widget> screens = [
    PaidPaymentScreen(),
    PostsScreen(),
    AllWorkerScreen(),
    AllCustomerScreen(),
    ComplaintsScreen(),
  ];

 void changeIndex(int index){
   currentIndex = index;
   emit(changeIndexState());
 }

}