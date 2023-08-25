import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/animation.dart';
import 'package:san3a/header.dart';
import 'package:san3a/modules/Admin/Complaints/ComplaintsScreen.dart';
import 'package:san3a/modules/Admin/Cubit/AdminCubit.dart';
import 'package:san3a/modules/Admin/Cubit/AdminStates.dart';
import 'package:san3a/modules/Admin/Payment/Paid/PaidPaymentScreen.dart';
import 'package:san3a/modules/Admin/Payment/UnPaid/UnPaidScreen.dart';
import 'package:san3a/modules/Admin/Posts/Cubit/AdminPostCubit.dart';
import 'package:san3a/modules/Admin/Posts/PostsScreen.dart';
import 'package:san3a/modules/Admin/Users/Customer/AllCustomerScreen.dart';
import 'package:san3a/modules/Admin/Users/UsersScreen.dart';
import 'package:san3a/modules/Admin/Users/Worker/AllWorkerScreen.dart';
import 'package:san3a/modules/Login_Screen/Login_Screen.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/styles/icon_broken.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AdminCubit, AdminStates>(
      listener: (context, state) {
        // if (state is LoginSuccessState) {
        //   if (state.loginModel!.status) {
        //     CacheHelper.saveData(
        //       key: 'token',
        //       value: state.loginModel!.token,
        //     ).then((value) {
        //       token = state.loginModel!.token!;
        //       navigateAndFinish(context, San3aLayout());
        //       showToast(
        //           text: state.loginModel!.message, state: ToastState.SUCCESS);
        //     });
        //   }
        // } else if (state is LoginErrorState) {
        //   showToast(
        //     text: state.error.toString(),
        //     state: ToastState.ERORR,
        //   );
        // }
      },
      builder: (context, state) {
        return Scaffold(
          //backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FadeAnimation(
                    1,
                    Container(
                      height: size.height * 0.3 > size.width * 0.3 ? size.height * 0.3 : size.width * 0.3,
                      child: FadeAnimation(
                          1.2,
                          HeaderWidget(
                            size.height * 0.3,
                            true,
                            Center(
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  WavyAnimatedText('Admin Panel',
                                      textStyle: TextStyle(
                                          fontSize: 40,
                                          color: Colors.yellowAccent,
                                          fontWeight: FontWeight.bold)),
                                ],
                                isRepeatingAnimation: true,
                              ),
                            ),
                          )
                      ), //let's create a common header widget
                    ),
                  ),
                  InkWell(
                    hoverColor: const Color(0xff4377ec),
                    onTap: () {
                      //AdminPostCubit.get(context).GetPostsForAdmin(token: token!);
                      navigateTo(context, UnPaidPaymentScreen());
                    },
                    child: ListTile(
                      //tileColor: Colors.indigo,
                      leading: Icon(Icons.payment,
                        color: Colors.red,
                      ),
                      title: Text("All UnPaid Worker",
                        style: TextStyle(
                          fontFamily: 'mulish',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 3.0,
                  ),
                  InkWell(
                    hoverColor: const Color(0xff4377ec),
                    onTap: () {
                      //AdminPostCubit.get(context).GetPostsForAdmin(token: token!);
                      navigateTo(context, PaidPaymentScreen());
                    },
                    child: ListTile(
                      //tileColor: Colors.indigo,
                      leading: Icon(Icons.payment,
                        color: Colors.green,
                      ),
                      title: Text("All Paid Worker",
                        style: TextStyle(
                          fontFamily: 'mulish',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 3.0,
                  ),
                  InkWell(
                    hoverColor: const Color(0xff4377ec),
                    onTap: () {
                      //AdminPostCubit.get(context).GetPostsForAdmin(token: token!);
                       navigateTo(context, PostsScreen());
                    },
                    child: ListTile(
                      //tileColor: Colors.indigo,
                      leading: Icon(Icons.post_add,
                        color: Colors.deepPurple,
                      ),
                      title: Text("All Report Posts",
                        style: TextStyle(
                          fontFamily: 'mulish',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2.0,
                  ),
                  InkWell(
                    hoverColor: const Color(0xff4377ec),
                    onTap: (){
                      navigateTo(context, AllWorkerScreen());
                    },
                    child: ListTile(
                      // tileColor: Colors.greenAccent,
                      leading: Icon(Icons.person,
                        color: Colors.green,
                      ),
                      title: Text("All Worker",
                        style: TextStyle(
                          fontFamily: 'mulish',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 3.0,
                  ),
                  InkWell(
                    hoverColor: const Color(0xff4377ec),
                    onTap: (){
                      navigateTo(context, AllCustomerScreen());
                    },
                    child: ListTile(
                      // tileColor: Colors.greenAccent,
                      leading: Icon(Icons.person,
                        color: Colors.blue,
                      ),
                      title: Text("All Customer",
                        style: TextStyle(
                          fontFamily: 'mulish',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 3.0,
                  ),
                  InkWell(
                    hoverColor: const Color(0xff4377ec),
                    onTap: (){
                      navigateTo(context, ComplaintsScreen());
                    },
                    child: ListTile(
                      //tileColor: Colors.limeAccent,
                      leading: Icon(Icons.warning_amber,
                      color: Colors.red,
                       ),
                      title: Text("Complaints",
                        style: TextStyle(
                          fontFamily: 'mulish',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 3.0,
                  ),
                   InkWell(
                     hoverColor: const Color(0xff4377ec),
                     onTap: (){
                       navigateTo(context, Login_Screen());
                     },
                     child: ListTile(
                      // tileColor: Colors.limeAccent,
                      leading: Icon(Icons.exit_to_app,
                        color: const Color(0xff4377ec),
                      ),
                      title: Text("Sign Out",
                        style: TextStyle(
                          fontFamily: 'mulish',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                     ),
                   ),
                  const Divider(
                    thickness: 3.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}



/*
  Text('Admin Panel',
                  style:TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'mulish',
                    //const Color(0xff4377ec),
                     ),
                  ),
                  BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.yellowAccent,
                    backgroundColor: Colors.grey[300],
                    selectedFontSize: 17.0,
                    unselectedFontSize: 14.0,
                    elevation: 10.0,
                    currentIndex: AdminCubit.get(context).currentIndex,
                    onTap: (index) {
                      AdminCubit.get(context).changeIndex(index);
                      print(index);
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.check),
                        label: 'Paymet',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.post_add),
                        label: 'Posts',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Users',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.warning_amber),
                        label: 'Report',
                      ),
                    ],
                  ),
                ],
 */