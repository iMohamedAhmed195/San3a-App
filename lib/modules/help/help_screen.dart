import 'package:flutter/material.dart';
import 'package:san3a/animation.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';



class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(child:  Text(San3aLayoutCubit.get(context).isArabic1?'المساعدة':'Help',style: TextStyle(fontSize: 24),)),
        actions: const [
          // AppBarIcons( icon: Icons.wechat, function: () {  },),
          // AppBarIcons( icon: Icons.menu, function: () {  },),
        ],),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children:   [
              // Container(
              //   height: 120,width: 120,
              //   decoration:  BoxDecoration(
              //       borderRadius: BorderRadius.circular(500),
              //       image: const DecorationImage(
              //           image: NetworkImage(
              //               'https://static4.depositphotos.com/1000393/362/i/600/depositphotos_3628253-stock-photo-smiling-manual-worker.jpg'),
              //           fit: BoxFit.cover)),
              // ),
              SizedBox(height: 10,),
              FadeAnimation(
              1.1, TextFeild_(icon:Icons.person,
                  text: San3aLayoutCubit.get(context).isArabic1?'اسم المستخدم':'User Name',
                  maxLine: 1,
                //  maxLength: 30,
                  keyboardType:TextInputType.name ,),
              ),
              SizedBox(height: 10,),
              FadeAnimation(
              1.2, TextFeild_(icon:Icons.person,
                  text:San3aLayoutCubit.get(context).isArabic1?'البريد الالكترونى': 'Email Address',
                  maxLine: 1,
                 // maxLength:40,
                  keyboardType:TextInputType.emailAddress ,),
              ),
              SizedBox(height: 10.0,),
              FadeAnimation(
                1.3, TextFeild_(
                  text: San3aLayoutCubit.get(context).isArabic1?"ما المشكلة؟":'What happened ?',
                  keyboardType:TextInputType.multiline,
                  maxLine: null ,
                  maxLength: 200,
                  minLine: 10, icon: null,),
              ),
              FadeAnimation(
                1.4, Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(

                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(25),

                  ),
                  child:   MaterialButton(

                      onPressed: (){},
                      child: Row(children:  [
                          SizedBox(width: 10.0,),
                          Center(
                            child: Text(San3aLayoutCubit.get(context).isArabic1?'تقديم':'Submit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
