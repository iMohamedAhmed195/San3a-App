import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/modules/add_post_screen/cubit/post_cubit.dart';
import 'package:san3a/modules/add_post_screen/cubit/post_states.dart';
import 'package:san3a/modules/pro_woker/profile_cubit/profile_worker_cubit.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key,}) : super(key: key);
  @override
  State<AddScreen> createState() => _AddScreenState();

}

class _AddScreenState extends State<AddScreen> {
  String valueChoose = 'elSan3a' ;
  var postController= TextEditingController();


  var formkey = GlobalKey<FormState>();
  int index =0;
  bool isPost=false ;
@override

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PostCubit(),
      child: BlocConsumer<PostCubit , PostStates>(
          listener:(context , state){
          },

          builder:(context , state){
            var cubit = PostCubit.get(context);
            return Scaffold(

              appBar:AppBar(

                leading: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon:const Icon(Icons.arrow_back),),
                title:  Text(San3aLayoutCubit.get(context).isArabic1?"إنشاء منشور":'Create post',
                  style: TextStyle(

                    fontSize: 18,
                  ),),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultButton(
                        background: cubit.ColorButton,
                        text:San3aLayoutCubit.get(context).isArabic1?'منشور': 'Post',
                        function: (){
                          if (formkey.currentState!.validate()){
                           PostCubit.get(context).addPost(PostCubit.get(context).pickedFile!.path, postController.text, job: valueChoose);
                          }
                        },
                        width: 90,
                        height:10),
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 0,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage('${ProfileWorkerCubit.get(context).profile!.data!.userData!.photo}'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            flex: 2,
                            child: Column(

                              children: [
                                Row(
                                  children:  [
                                    Text(
                                      '${ProfileWorkerCubit.get(context).profile!.data!.userData!.name}',
                                      style: Theme.of(context).textTheme.bodyText1
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          alignment: Alignment(0.5, 0),
                                          menuMaxHeight:400,
                                          style: TextStyle(fontSize: 12),
                                          elevation: 0,
                                          value: valueChoose,
                                          borderRadius: BorderRadius.circular(15),
                                          items:  [
                                            DropdownMenuItem<String>( enabled:false,value:'elSan3a' ,child: Text(San3aLayoutCubit.get(context).isArabic1?'اختار مهنتك':'Choose your job',style: TextStyle(color: Colors.grey),),),
                                            DropdownMenuItem<String>(value:'نجار' ,child: Text(San3aLayoutCubit.get(context).isArabic1?'نجار':'Carpenter',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'سباك' ,child: Text(San3aLayoutCubit.get(context).isArabic1?'سباك':' plumber',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'كهربائى' ,child: Text(San3aLayoutCubit.get(context).isArabic1?'كهربائى':'electrician',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'ميكانيكى' ,child: Text(San3aLayoutCubit.get(context).isArabic1?'ميكانيكى ':' mechanices',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'فني تبريد وتكييف ' ,child: Text(San3aLayoutCubit.get(context).isArabic1?'فني تبريد وتكييف ':' Technician Refrigeration & Air Conditioning',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'عامل طلاء' ,child: Text(San3aLayoutCubit.get(context).isArabic1?'عامل طلاء ':' painter',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'طباخ' ,child: Text(San3aLayoutCubit.get(context).isArabic1?'طباخ  ':' Chef',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'فني مصاعد' ,child: Text(San3aLayoutCubit.get(context).isArabic1?'فني مصاعد ':' Elevator technician',style: TextStyle(color: Colors.black),),),
                                            DropdownMenuItem<String>(value:'فني تصليح الكترونيات' ,child: Text(San3aLayoutCubit.get(context).isArabic1?'فني تصليح الكترونيات ':' Electronics repair technician',style: TextStyle(color: Colors.black),),),


                                          ],
                                          onChanged: dropDownCallback,
                                        )),
                                    defaultButton(
                                        background: Colors.blue,
                                        text: San3aLayoutCubit.get(context).isArabic1?'صور ':'Image',
                                        function: (){
                                          PostCubit.get(context).getImageProfileFromGallery();
                                        },
                                        width: 90,
                                        height:30),
                                  ],

                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:20,),
                    Expanded(
                      flex: 2,
                      child: Form(
                        key: formkey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 350,
                                child: TextFormField(
                                  minLines: 1,
                                  maxLines: 8,
                                  style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 17 , color: Colors.black,),
                                  controller: postController,
                                  keyboardType: TextInputType.text,
                                  onChanged: (String? value){
                                    if(value!.isNotEmpty){
                                      isPost=true;
                                      cubit.changeColorButton(isPost);
                                    }
                                    else if(value.isEmpty){
                                      isPost=false;
                                      cubit.changeColorButton(isPost);
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText:San3aLayoutCubit.get(context).isArabic1?'اكتب منشورك هنا .. ':'Write your post here...',
                                    hintStyle: Theme.of(context).textTheme.bodyText1,
                                    border: InputBorder.none,


                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: <Widget>[




                          Expanded(
                              child:GridView.builder(
                                itemBuilder: (context , index){
                                  this.index = index;
                                  return PostCubit.get(context).pickedFile ==null ? SizedBox():  Image.file(File(PostCubit.get(context).pickedFile!.path),
                                    fit: BoxFit.cover,
                                  );

                              },
                                itemCount: 1,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:1 ),
                                addSemanticIndexes: index>=0 ? cubit.changeColorButton1(index): cubit.changeColorButton1(index) ,
                              ),


                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }

  void dropDownCallback( String? selectValue){
    if(selectValue is String){
      setState(() {
        valueChoose = selectValue;
      });
    }
  }
}



