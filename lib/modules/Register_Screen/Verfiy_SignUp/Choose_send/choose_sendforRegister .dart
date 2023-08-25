import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/Register_Screen/SignUp_Screen1.dart';
import 'package:san3a/modules/Register_Screen/Verfiy_SignUp/Choose_send/Cubit/choose_send_cubit_Register.dart';
import 'package:san3a/modules/Register_Screen/Verfiy_SignUp/Choose_send/Cubit/choose_send_states_Register.dart';
import 'package:san3a/modules/otp_Screen/OTP_For_Register/OTPscreen1.dart';
import 'package:san3a/modules/rereset/findaccount/FindAcount.dart';
import 'package:san3a/shared/component/component.dart';

class choose_send_Register extends StatelessWidget {

  final String email;
  final String phone;

  choose_send_Register({required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChooseSendCubitRegister(),
      child: BlocConsumer<ChooseSendCubitRegister, ChooseSendStatesRegister>(
        listener: (context, state) {
          if (state is ChooseSuccessRegisterState) {
            if (state.chooseSendRegister!.status) {
              print(state.chooseSendRegister?.message);
              // print(state.findAccountModel?.data?.token);
               navigateAndFinish(context, OTPscreen1(typesend: ChooseSendCubitRegister.get(context).type, email: email, phone: phone,));
              showToast(
                  text: state.chooseSendRegister!.message,
                  state: ToastState.SUCCESS);
            } else {
              print(state.chooseSendRegister!.message);
              showToast(
                text: state.chooseSendRegister!.message,
                state: ToastState.ERORR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SafeArea(
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: Image(
                                image: AssetImage('assets/images/telent.png'),
                                height: 150.0,
                                width: 150.0,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Select one of the options given below to verfiy your account.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Column(
                              children: [
                                RadioListTile<String>(
                                    value: "email",
                                    groupValue: ChooseSendCubitRegister.get(context).type,
                                    title: Text(
                                      'Sent Code Via Email ${email}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
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
                                      ChooseSendCubitRegister.get(context)
                                          .selectValue(value!);
                                    }
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                RadioListTile<String>(
                                  //content
                                    value: "phone",
                                    groupValue: ChooseSendCubitRegister.get(context).type,
                                    title: Text(
                                      'Sent Code Via SMS ${phone}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
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
                                          ChooseSendCubitRegister.get(context)
                                              .selectValue(value!);
                                    }
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: default_Button(
                                function: () {
                                 if(ChooseSendCubitRegister.get(context).type == "email")
                                 {
                                   ChooseSendCubitRegister.get(context).SendOTP_To_Email(email: '${email}');
                                 }else{
                                   ChooseSendCubitRegister.get(context).SendOTP_To_Phone(phone: '${phone}');
                                 }
                                },
                                text: 'Continue',
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
                                    builder: (context) => SignUp_Screen(),
                                  ),
                                );
                              },
                              text: 'Not You?',
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
