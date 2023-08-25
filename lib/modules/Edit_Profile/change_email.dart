import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';

import '../../animation.dart';
import '../../header.dart';

class Email_Edit extends StatelessWidget {
   Email_Edit({Key? key}) : super(key: key);

   var old_emailcontroller = TextEditingController();
   var new_emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: defaultAppBar(text: isArabic? " تغيير البريد الإلكتروني" :'Change Your Email ', func1: () {  }, func2: () {  }),
      body: SingleChildScrollView(
        child: Center(
          child : Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeAnimation(1.1,Text(San3aLayoutCubit.get(context).isArabic1? " تغيير البريد الإلكتروني" :'Change Your Email ',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      //color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                FadeAnimation(1.1, default_tTextFormField(
                  controller: old_emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  labelText:San3aLayoutCubit.get(context).isArabic1? " البريد الإلكتروني القديم":'Enter old Email Address',
                  prefix: Icons.email,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return San3aLayoutCubit.get(context).isArabic1?"يجب ألا يكون رقم البريد الإلكتروني فارغًا":'Email Number must not be empty';
                    }
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                )),
                SizedBox(height: 25.0,),
               FadeAnimation(1.2,  default_tTextFormField(
                 controller: new_emailcontroller,
                 keyboardType: TextInputType.emailAddress,
                 labelText: San3aLayoutCubit.get(context).isArabic1?"البريد الإلكتروني الجديد":'Enter new Email Address',
                 prefix: Icons.email,
                 validate: (String? value) {
                   if (value!.isEmpty) {
                     return  San3aLayoutCubit.get(context).isArabic1?"يجب ألا يكون  البريد الإلكتروني فارغًا":'Email must not be empty';
                   }
                 },
                 onFieldSubmitted: (value) {
                   print(value);
                 },
               )),
                SizedBox(height: 35.0,),
               FadeAnimation(1.3,  AnimatedButton(
                 height: 40,
                 width: double.infinity,
                 text: San3aLayoutCubit.get(context).isArabic1?"التالى":'next',
                 textStyle: TextStyle(color: Colors.white,fontSize: 20),
                 isReverse: true,
                 selectedTextColor: Colors.white,
                 transitionType: TransitionType.LEFT_TO_RIGHT,

                 backgroundColor: Colors.blueAccent,
                 borderColor: Colors.blue,
                 borderRadius: 50,
                 borderWidth: 1,
                 onPress: () {
                 },
               )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
