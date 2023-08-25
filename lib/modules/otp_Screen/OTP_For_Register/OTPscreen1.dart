import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/layout/san3a_layout.dart';
import 'package:san3a/modules/Login_Screen/Login_Screen.dart';
import 'package:san3a/modules/otp_Screen/OTP_For_Register/Cudit/cubit.dart';
import 'package:san3a/modules/otp_Screen/OTP_For_Register/Cudit/states.dart';
import 'package:san3a/modules/rereset/Choose_send/Cubit/choose_send_cubit.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/network/local/cache_helper.dart';


class OTPscreen1 extends StatelessWidget {

  @override
  final formKey = GlobalKey<FormState>();
  var otpcontroller = TextEditingController();

  final String typesend;
  final String email;
  final String phone;
  OTPscreen1({required this.typesend, required this.phone, required this.email});

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OtpRegisterCubit(),
      child: BlocConsumer<OtpRegisterCubit , OtpRegisterStates>(
        listener: (context , state){
          if (state is otpSuccessState) {
            if (state.otpModel!.status) {
              navigateAndFinish(context, Login_Screen());
              showToast(
                  text: state.otpModel!.message,
                  state: ToastState.SUCCESS);
              // CacheHelper.saveData(
              //   key: 'token',
              //   value: state.otpModel!.token,
              // ).then((value) {
              //   token = state.otpModel!.token;
              //
              //
              // });
            } else {
              showToast(
                text: state.otpModel!.message,
                state: ToastState.ERORR,
              );
            }
          }
        },
        builder: (context , state){
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SafeArea(
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                          // This will be the login form
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    child: const Image(
                                      image: AssetImage('assets/images/telent.png'),
                                      height: 150.0,
                                      width: 150.0,
                                    ),
                                  ),
                                  const SizedBox(height: 15.0),
                                   Text(
                                    San3aLayoutCubit.get(context).isArabic1? "لقد أرسلنا لك OTP" :'We have sent to you an OTP',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30.0),
                              Column(
                                children: [
                                  Container(
                                    child: Center(
                                      child: TextFormField(
                                        controller: otpcontroller,
                                        onFieldSubmitted: (evalue) {
                                          print(evalue);
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return San3aLayoutCubit.get(context).isArabic1?'أدخل الرمز المرسل إلى رقمك / بريدك الإلكتروني':'Enter The Code sent to your Number/Email';
                                          } else {
                                            return null;
                                          }
                                        },
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          // hintText: 'Email Adress',
                                          // prefixIcon: Icon(Icons.phone),
                                          labelText:San3aLayoutCubit.get(context).isArabic1?"أدخل الرمز المرسل إليك": ' Enter Code sent to You ',
                                          border: OutlineInputBorder(
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(50))),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30.0),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          // alignment: Alignment.bottomRight,
                                          child: default_Button(
                                            function: () {
                                              if (formKey.currentState!.validate()) {
                                                if(typesend == "email"){
                                                  OtpRegisterCubit.get(context).OTPPostForEmail(otp: otpcontroller.text);
                                                }else {
                                                  OtpRegisterCubit.get(context).OTPPostForPhone(otp: otpcontroller.text, phone : phone);
                                                }
                                              }
                                            },
                                            text: San3aLayoutCubit.get(context).isArabic1?'تأكيد':'Confirm',
                                            isUpperCase: false,
                                            textStyle: null,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Container(
                                          // alignment: Alignment.bottomLeft,
                                          child: default_Button(
                                            function: () {
                                              Navigator.pop(context);
                                            },
                                            text: San3aLayoutCubit.get(context).isArabic1?'رجوع':'back',
                                            isUpperCase: false,
                                            textStyle: null,
                                            backgroundcolor: const Color(0xFFB6B7B7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(San3aLayoutCubit.get(context).isArabic1?"لم تستلم؟ ":"Didn't Recieve? "),
                                          InkWell(
                                            onTap: (){
                                              if(ChooseSendCubit.get(context).type == "email")
                                              {
                                                ChooseSendCubit.get(context).SendOTP_To_Email(email: '${email}');
                                              }else{
                                                ChooseSendCubit.get(context).SendOTP_To_Phone(phone: '${phone}');
                                              }
                                            },
                                            child: Text(
                                              San3aLayoutCubit.get(context).isArabic1?"اعادة الارسال":"sent agin",
                                              style: TextStyle(
                                                color: const Color(0xff4377ec),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ],
                          )),
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

// class OTPInput extends StatelessWidget {
//   const OTPInput({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 60,
//       height: 60,
//       decoration: ShapeDecoration(
//         color: const Color(0xFFB6B7B7),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 18, left: 20),
//             child: Text(
//               "*",
//               style: TextStyle(fontSize: 45),
//             ),
//           ),
//           TextField(
//             decoration: InputDecoration(border: InputBorder.none),
//           ),
//         ],
//       ),
//     );
//   }
//}
