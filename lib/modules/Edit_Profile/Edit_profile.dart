import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:san3a/animation.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/modules/Edit_Profile/change_email.dart';
import 'package:san3a/modules/Edit_Profile/change_password.dart';
import 'package:san3a/modules/Edit_Profile/change_phone.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';

class Edit_profile extends StatelessWidget {
  const Edit_profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            FadeAnimation(1.1,
              EditProfile(

                text: San3aLayoutCubit.get(context).isArabic1?"تغيير البريد الإلكتروني":'Change Email',
                fun: () {navigateTo(context, Email_Edit());},

              ),
            ), const SizedBox(height: 15.0,),
            FadeAnimation(1.2, EditProfile(

                text:San3aLayoutCubit.get(context).isArabic1?  "تغيير كلمة المرور": 'Change Password',
                fun: () {navigateTo(context, Password_Edit());},

              ),
            ), const SizedBox(height: 15.0,),
            FadeAnimation(1.3,EditProfile(

                text: San3aLayoutCubit.get(context).isArabic1?"تغيير رقم الهاتف":'Change Phone',
                fun: () {navigateTo(context, change_phone());},

              ),
            ), const SizedBox(height: 15.0,),


          ],
        ),
      ),
    );
  }
}
