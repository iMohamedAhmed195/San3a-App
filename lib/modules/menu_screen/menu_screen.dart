
import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:conditional_builder_null_safety/example/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/layout/cubit/states_layout.dart';
import 'package:san3a/modules/Edit_Profile/Edit_profile.dart';
import 'package:san3a/modules/Login_Screen/Cubit/cubit.dart';
import 'package:san3a/modules/Login_Screen/Cubit/states.dart';
import 'package:san3a/modules/help/help_screen.dart';
import 'package:san3a/modules/payment_screen/ToggelScreen.dart';
import 'package:san3a/modules/payment_screen/cubit/payment_cubit.dart';
import 'package:san3a/modules/payment_screen/cubit/payment_state.dart';
import 'package:san3a/modules/payment_screen/visaScreen.dart';
import 'package:san3a/modules/pro_woker/pro_worker.dart';
import 'package:san3a/modules/pro_woker/profile_cubit/profile_worker_cubit.dart';
import 'package:san3a/modules/pro_woker/profile_cubit/profile_worker_states.dart';
import 'package:san3a/modules/saved_posts/saved_posts.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_worker.dart';

import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/network/local/cache_helper.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuState();
}

class _MenuState extends State<MenuScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PaymentCubitCubit(),
      child: BlocConsumer<San3aLayoutCubit,San3aLayoutStates>(
        listener:(context,state){

        } ,
        builder: (context,state){
          return Scaffold(

            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        BlocConsumer<ProfileWorkerCubit , ProfileWorkerState>(
                          listener:(context ,state){

                          } ,
                          builder: (context ,state){
                            final cubit = ProfileWorkerCubit.get(context);

                            return ConditionalBuilder(
                                condition: true,
                                builder: (context)=>Column(
                                  children: [
                                    SizedBox(height: 30),
                                    Container(
                                        height: 100.0,
                                        width: 100.0,
                                        child:  CircleAvatar(
                                          backgroundImage: NetworkImage('https://img.freepik.com/free-photo/porait-cute-boy-cafe_23-2148436119.jpg?w=996&t=st=1691587331~exp=1691587931~hmac=0c3c234aae1177129cd8e3e90604fe5fb6df35d5323bcc678e93adfaaf5e6791'),
                                        )

                                    ),

                                    const SizedBox(height: 5),
                                    Text('Mohamed Ahmed' ,style:Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22,fontWeight: FontWeight.bold),),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.dark_mode_outlined,
                                            size: 40,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 16.0),
                                            child: Text(
                                              San3aLayoutCubit.get(context).isArabic1? 'الوضع الداكن': 'Dark Mode',
                                              style:Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18,fontWeight: FontWeight.bold) ,
                                            ),
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 20.0),
                                            child: FlutterSwitch(
                                              width: 50.0,
                                              height: 25.0,
                                              toggleSize: 20.0,
                                              value:  San3aLayoutCubit.get(context).isOpen,
                                              borderRadius: 30.0,
                                              padding: 1.0,
                                              onToggle: (val) {
                                                San3aLayoutCubit.get(context).changeMode();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    MenuPage(
                                        fun: () {
                                          navigateTo(context, ProWorker());
                                        },
                                        color: Colors.orange,
                                        icon: Icons.camera_alt_outlined,
                                        text:San3aLayoutCubit.get(context).isArabic1? 'الصفحة الرئيسية':  'Profile',
                                        context: context
                                    ),
                                    San3aLayoutCubit.get(context).isOpen ?  myDivider() : myDividor2() ,
                                    MenuPage(
                                        fun: () {navigateTo(context, SavedPosts());},
                                        color: Colors.blue,
                                        icon: Icons.save_outlined,
                                        text: San3aLayoutCubit.get(context).isArabic1?"المنشورات المحفوظة":'Saved Posts',
                                        context: context
                                    ),
                                    if(role != 'customer')
                                    San3aLayoutCubit.get(context).isOpen ?  myDivider() : myDividor2() ,
                                    if(role != 'customer')
                                    BlocConsumer<PaymentCubitCubit,PaymentCubitState>(
                                      listener: (BuildContext context, state) {
                                        if( state is getPaymentRequestRegistrationIdSucessState){
                                           navigateTo(context, ToggleScreen());
                                        }
                                      },
                                      builder: (BuildContext context, Object? state) {
                                        return MenuPage(
                                            color: Colors.pink,
                                            icon: Icons.payments_outlined,
                                            text: San3aLayoutCubit.get(context).isArabic1?'الدفع':'Payment',
                                            fun: () {
                                              PaymentCubitCubit.get(context).getOrderRegisterationId(
                                                  name:'Mohamed Ahmed' ,
                                                  email:'M@gmail.com',
                                                  phone: '01060313167'
                                              );

                                            },
                                            context: context
                                        );
                                      },

                                    ),
                                    if(role != 'customer')
                                    San3aLayoutCubit.get(context).isOpen ?  myDivider() : myDividor2() ,
                                    MenuPage(
                                        color: Colors.purple,
                                        icon: Icons.edit_note_outlined,
                                        text: San3aLayoutCubit.get(context).isArabic1?"تعديل الحساب":'Edit Profile',
                                        fun: () { navigateTo(context, Edit_profile()); },
                                        context: context
                                    ),
                                    San3aLayoutCubit.get(context).isOpen ?  myDivider() : myDividor2() ,
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 16.0),

                                            child: Text(
                                              San3aLayoutCubit.get(context).isArabic1?'اللغة':'Language',
                                              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const Spacer(),
                                          Padding(
                                              padding: const EdgeInsets.only(right: 16.0),
                                              child: IconButton(
                                                icon: Icon(Icons.language),
                                                onPressed: (){  showDialog(

                                                    context: context,
                                                    builder: (context)
                                                    {
                                                      return BackdropFilter(
                                                      filter: ImageFilter.blur(sigmaX: 6,sigmaY: 6),
                                                      child:AlertDialog(

                                                        insetPadding: EdgeInsets.all(10),

                                                        title:  Text(San3aLayoutCubit.get(context).isArabic1?'تغيير اللغة':" Change Language"),

                                                        actions: <Widget>[
                                                          Container(
                                                            padding: const EdgeInsets.all(14),
                                                            child: Row(
                                                              children: [
                                                                TextButton(
                                                                    onPressed: () {
                                                                      San3aLayoutCubit.get(context).changeLang();
                                                                      Navigator.pop(context);
                                                                    },
                                                                    child:  Text(San3aLayoutCubit.get(context).isArabic1?"الغة العربية":"Arabic")),
                                                                const Spacer(),
                                                                TextButton(
                                                                    onPressed: () {

                                                                      San3aLayoutCubit.get(context).changeLang();
                                                                      Navigator.pop(context);
                                                                    },
                                                                    child:  Text(San3aLayoutCubit.get(context).isArabic1?"اللغة الانجليزية":"English")),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                      ;}
                                                ); },
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                    San3aLayoutCubit.get(context).isOpen ?  myDivider() : myDividor2() ,
                                    MenuPage(
                                        color: Colors.teal,
                                        icon: Icons.help_outline_outlined,
                                        text: San3aLayoutCubit.get(context).isArabic1?"المساعدة":'Help',
                                        fun: () { navigateTo(context, HelpScreen()); },
                                        context: context
                                    ),
                                    San3aLayoutCubit.get(context).isOpen ?  myDivider() : myDividor2() ,
                                    MenuPage(
                                        color: Colors.red,
                                        icon: Icons.logout,
                                        text:San3aLayoutCubit.get(context).isArabic1?"تسجيل الخروج":'LogOut',
                                        fun: () {showDialog(context: context,
                                            builder:(BuildContext context){
                                              return BackdropFilter(filter: ImageFilter.blur(sigmaY: 6,
                                                  sigmaX: 6),
                                                child: AlertDialog(

                                                  title: Row(
                                                    children:  [
                                                      Text(San3aLayoutCubit.get(context).isArabic1?"تسجيل الخروج":'LogOut'),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Icon(Icons.logout,size: 20,)
                                                    ],
                                                  ),
                                                  content:  Text(San3aLayoutCubit.get(context).isArabic1?"هل أنت متأكد ؟":"Are you sure ?"),
                                                  actions: <Widget>[
                                                    Container(

                                                      child: Row(
                                                        children: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.of(context).pop();
                                                              },
                                                              child:  Text(San3aLayoutCubit.get(context).isArabic1?"لا":"No")),
                                                          const Spacer(),
                                                          TextButton(
                                                              onPressed: () {
                                                                navigateTo(context, TimeLineForWorker());
                                                              },
                                                              child:  Text(San3aLayoutCubit.get(context).isArabic1?"نعم":"Yes")),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                        ); },
                                        context: context

                                    ),
                                  ],
                                ),
                                fallback: (context)=>Center(child: CircularProgressIndicator())
                            );
                          },
                        ),

                      ],
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
