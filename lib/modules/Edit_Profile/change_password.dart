import 'package:animated_text_field/animated_text_field.dart';
import 'package:flutter/material.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';

class Password_Edit extends StatelessWidget {
   Password_Edit({Key? key}) : super(key: key);

  var old_passcontroller = TextEditingController();
  var new_passcontroller = TextEditingController();
  var new_confpasscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(20, 50, 20, 50),
          child: Center(
            child : Column(
              children: [
                Center(
                  child: FadeAnimation(1.1, Text(San3aLayoutCubit.get(context).isArabic1?"تغيير كلمة المرور":'Change Your  Password',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        //color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                FadeAnimation(1.2, default_tTextFormField(
                    controller: old_passcontroller,
                    keyboardType: TextInputType.number,
                    labelText:San3aLayoutCubit.get(context).isArabic1?"أدخل كلمة مرورك القديمة":'Enter Your old password',
                    prefix: Icons.lock,
                    suffix: Icons.visibility_off_outlined,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return San3aLayoutCubit.get(context).isArabic1?"يجب ألا تكون كلمة المرور فارغة":'password must not be empty';
                      }
                    },
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                  ),
                ),
                SizedBox(height: 15.0,),
                FadeAnimation(1.3, default_tTextFormField(
                    controller: new_passcontroller,
                    keyboardType: TextInputType.number,
                    labelText: San3aLayoutCubit.get(context).isArabic1?"أدخل كلمة المرور الجديدة":'Enter Your new password',
                    prefix: Icons.lock,
                    suffix: Icons.visibility_off_outlined,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return San3aLayoutCubit.get(context).isArabic1?"يجب ألا تكون كلمة المرور فارغة": 'password must not be empty';
                      }
                    },
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                  ),
                ),
                SizedBox(height: 15.0,),
                FadeAnimation(1.5,default_tTextFormField(
                    controller: new_confpasscontroller,
                    keyboardType: TextInputType.number,
                    labelText: San3aLayoutCubit.get(context).isArabic1?"تأكيد كلمة المرور ":'Confirm new Password',
                    prefix: Icons.lock,
                    suffix: Icons.visibility_off_outlined,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return San3aLayoutCubit.get(context).isArabic1?"يجب ألا تكون كلمة المرور فارغة":'Password must not be empty';
                      }
                    },
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                  ),
                ),
                SizedBox(height: 35.0,),
                FadeAnimation(1.6,
                  default_Button(
                    text: San3aLayoutCubit.get(context).isArabic1?"تغيير كلمة المرور ":'Change Password',
                    isUpperCase: false,
                    textStyle: null,
                    function: () {

                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
