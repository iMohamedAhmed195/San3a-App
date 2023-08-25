import 'package:flutter/material.dart';
import 'package:san3a/animation.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';

class change_phone extends StatelessWidget {
   change_phone({Key? key}) : super(key: key);

  var old_phonecontroller = TextEditingController();
  var new_phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(20, 50, 20, 50),
          child: Center(
            child : Column(
              children: [
                FadeAnimation(1.1,Text(San3aLayoutCubit.get(context).isArabic1?"تغيير رقم الهاتف":'Change Your Phone Number',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    //color: Colors.blue,
                  ),
                  ),
                ),
              SizedBox(height: 10,),
              FadeAnimation(1.2,
               default_tTextFormField(
                    controller: old_phonecontroller,
                    keyboardType: TextInputType.phone,
                    labelText:San3aLayoutCubit.get(context).isArabic1?'رقم الهاتف القديم': 'Enter old Phone Number',
                    prefix: Icons.phone,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return San3aLayoutCubit.get(context).isArabic1?"رقم الهاتف يجب ألا يكون فارغًا":'Phone Number must not be empty';
                      }
                    },
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                  ),
              ),
                SizedBox(height: 15.0,),
                FadeAnimation(1.3,
                   default_tTextFormField(
                    controller: new_phonecontroller,
                    keyboardType: TextInputType.phone,
                    labelText: San3aLayoutCubit.get(context).isArabic1?" رقم الهاتف الجديد":'Enter new Phone Number',
                    prefix: Icons.phone,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return  San3aLayoutCubit.get(context).isArabic1?"رقم الهاتف يجب ألا يكون فارغًا":'Phone Number must not be empty';
                      }
                    },
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                  ),
                ),
                SizedBox(height: 35.0,),
            FadeAnimation(1.7,
               default_Button(
                text:San3aLayoutCubit.get(context).isArabic1? "تغيير":'Change',
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
