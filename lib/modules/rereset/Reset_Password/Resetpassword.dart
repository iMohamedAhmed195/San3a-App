import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:san3a/animation.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/modules/Login_Screen/Login_Screen.dart';
import 'package:san3a/modules/rereset/Reset_Password/Cubit/reset_cubit.dart';
import 'package:san3a/modules/rereset/Reset_Password/Cubit/reset_states.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/network/local/cache_helper.dart';


class ResetPassword_Screen extends StatelessWidget {

  final formKey = GlobalKey<FormState>();

  var passcontroller = TextEditingController();

  var conpasscontroller = TextEditingController();

  ResetPassword_Screen({required token});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ResetPassCubit(),
      child: BlocConsumer<ResetPassCubit, ResetPassStates>(
        listener: (context, state) {
          if (state is ResetPassSuccessState) {
            if (state.ResetpassModel!.status) {
              print(state.ResetpassModel?.message);
              navigateAndFinish(context, Login_Screen());
              showToast(
                  text: state.ResetpassModel!.message,
                  state: ToastState.SUCCESS);
            } else {
              print(state.ResetpassModel!.message);
              showToast(
                text: state.ResetpassModel!.message,
                state: ToastState.ERORR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SafeArea(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: FadeAnimation(
                                    1.5, Image(
                                      image: AssetImage('assets/images/telent.png'),
                                      height: 150.0,
                                      width:150.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                FadeAnimation(
                                  1.5, Text(
                                    San3aLayoutCubit.get(context).isArabic1 ? 'كلمة المرور الجديدة':'Set your new Password ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                            FadeAnimation(
                              1.5, TextFormField(
                                controller: passcontroller,
                                onFieldSubmitted: (value) {
                                  print(value);
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: ResetPassCubit.get(context).isPassword,
                                decoration: InputDecoration(
                                  // hintText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      ResetPassCubit.get(context)
                                          .ChangePasswordVisibilit();
                                    },
                                    icon: Icon(ResetPassCubit.get(context).suffix),
                                  ),
                                  labelText: San3aLayoutCubit.get(context).isArabic1 ?'كلمة المرور': 'Password',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'password must not be empty';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            FadeAnimation(
                              1.5, TextFormField(
                                controller: conpasscontroller,
                                onFieldSubmitted: (cvalue) {
                                  print(cvalue);
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: ResetPassCubit.get(context).isPassword,
                                decoration: InputDecoration(
                                  // hintText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      ResetPassCubit.get(context)
                                          .ChangePasswordVisibilit();
                                    },
                                    icon: Icon(ResetPassCubit.get(context).suffix),
                                  ),
                                  labelText:San3aLayoutCubit.get(context).isArabic1 ?'تأكيد كلمة المرور': 'Confirm Password',

                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'password must not be empty';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            ConditionalBuilder(
                              condition: state is! ResetLoadingState,
                              builder: (context) =>
                                  FadeAnimation(
                                    1.5, default_Button(
                                function: () {
                                    if(formKey.currentState!.validate()) {
                                      if(passcontroller.text == conpasscontroller.text){
                                        ResetPassCubit.get(context).UserResetPass(pass: passcontroller.text,
                                            confpass: conpasscontroller.text, token: token!);
                                      }else{
                                        showToast(
                                            text: 'Password must match confirm Password',
                                            state:  ToastState.ERORR);
                                      }
                                    }
                                },
                                text: 'Next',
                                textStyle: null,
                              ),
                                  ),
                              fallback: (context) => Center(child: CircularProgressIndicator()),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            FadeAnimation(
                              1.5, default_Button(
                                function: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Login_Screen(),
                                    ),
                                  );
                                },
                                text: 'Cancel',
                                textStyle: null,
                                backgroundcolor: const Color(0xFFB6B7B7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
