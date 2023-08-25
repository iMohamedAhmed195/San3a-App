import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/animation.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/modules/otp_Screen/OTP_For_Forget/OTPscreen2.dart';
import 'package:san3a/modules/rereset/Choose_send/Cubit/choose_send_cubit.dart';
import 'package:san3a/modules/rereset/Choose_send/Cubit/choose_send_states.dart';
import 'package:san3a/modules/rereset/findaccount/FindAcount.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/network/local/cache_helper.dart';


class choose_send extends StatelessWidget {

  final String email;
  final String phone;

  choose_send({required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChooseSendCubit(),
      child: BlocConsumer<ChooseSendCubit, ChooseSendStates>(
        listener: (context, state) {
          if (state is chooseSuccessState) {
            if (state.chooseSend!.status) {
              print(state.chooseSend?.message);
              // print(state.findAccountModel?.data?.token);
              navigateAndFinish(context,
                  OTPscreen2(typesend: ChooseSendCubit.get(context).type, phone: phone, email: email, )
              );
              showToast(
                  text: state.chooseSend!.message,
                  state: ToastState.SUCCESS);
            } else {
              print(state.chooseSend!.message);
              showToast(
                text: state.chooseSend!.message,
                state: ToastState.ERORR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SafeArea(
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Column(
                          children: [
                            FadeAnimation(1.1, Image.asset(width: 150,height: 150,'assets/images/telent.png')),

                            FadeAnimation(
                              1.2, Text(
                              San3aLayoutCubit.get(context).isArabic1?"حدد أحد الخيارات  لإعادة تعيين \n كلمة المرور الخاصة بك.": 'Select one option to reset your password.',
                              textDirection:San3aLayoutCubit.get(context).isArabic1?  TextDirection.rtl : TextDirection.ltr,
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.black,
                              ),
                            ),
                            ),
                            const SizedBox(height: 30.0),
                            Column(
                              children: [
                                FadeAnimation(
                                  1.5, RadioListTile<String>(
                                      value:"email",
                                      groupValue: ChooseSendCubit.get(context).type,
                                      title: Text(
                                        San3aLayoutCubit.get(context).isArabic1?' الرمز المرسل عبر البريد الإلكتروني${email}':'Sent Code Via Email ${email}',
                                        textDirection:San3aLayoutCubit.get(context).isArabic1?  TextDirection.rtl : TextDirection.ltr,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontFamily: 'Mulish',

                                        ),
                                      ),
                                      // tileColor: Colors.deepPurple.shade50,
                                      dense: true,
                                      contentPadding: EdgeInsets.all(0.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(50.0)),
                                      onChanged: (value) {
                                        ChooseSendCubit.get(context)
                                            .selectValue(value!);
                                      }
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                FadeAnimation(
                                  1.2, RadioListTile<String>(
                                  //content
                                    value: "phone",
                                    groupValue: ChooseSendCubit.get(context).type,
                                    title: Text(
                                      San3aLayoutCubit.get(context).isArabic1?" تم إرسال الرمز عبر الرسائل القصيرة الى ${phone}":'Sent Code Via SMS to ${phone}',
                                      textDirection:San3aLayoutCubit.get(context).isArabic1?  TextDirection.rtl : TextDirection.ltr,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'Mulish',
                                      ),
                                    ),
                                    //tileColor: Colors.deepPurple.shade50,
                                    dense: true,
                                    contentPadding: EdgeInsets.all(0.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(50.0)),
                                    onChanged:
                                        (value) {
                                      ChooseSendCubit.get(context)
                                          .selectValue(value!);
                                    }
                                ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: default_Button(
                                function: () {
                                  if(ChooseSendCubit.get(context).type == "email")
                                  {
                                    ChooseSendCubit.get(context).SendOTP_To_Email(email: '${email}');
                                  }else{
                                    ChooseSendCubit.get(context).SendOTP_To_Phone(phone: '${phone}');
                                  }
                                },
                                text:San3aLayoutCubit.get(context).isArabic1?"استمر":'Continue',
                                isUpperCase: false,
                                textStyle: null,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            default_Button(
                              function: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FindAcount(),
                                  ),
                                );
                              },
                              text: San3aLayoutCubit.get(context).isArabic1?"ليس انت؟":'Not You?',
                              backgroundcolor: const Color(0xFFB6B7B7),
                              textStyle: null,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
