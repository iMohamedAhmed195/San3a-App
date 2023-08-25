import 'package:flutter/material.dart';
import 'package:san3a/layout/states.dart';


import '../shared/component/component.dart';

class Filter_screen extends StatefulWidget {
  const Filter_screen({Key? key}) : super(key: key);

  @override
  State<Filter_screen> createState() => _Filter_screenState();
}

class _Filter_screenState extends State<Filter_screen> {
  bool value = false;
  final category=[

    CheckBoxState(title:  "نجار" ),
    CheckBoxState(title: 'سباك'),
    CheckBoxState(title: "كهربائى"),
    CheckBoxState(title:  "تبريد وتكييف"),
    CheckBoxState(title:  "نقاش"),
    CheckBoxState(title:  "تبريد وتكييف" ),
    CheckBoxState(title: "كهربائى سيارات"),
    CheckBoxState(title: "كهربائى أجهزة"),
    CheckBoxState(title:   "سباك"),
  CheckBoxState(title:  "تركيبات وصيانة"),
  CheckBoxState(title:  "فنى أجهزة التحكم"),
  CheckBoxState(title:   "حداد"),
  CheckBoxState(title:   "نجار"),
  CheckBoxState(title:   'فنى أجهزة التحكم'),

  ];
  final location=[
    CheckBoxState(title: 'cairo'),
    CheckBoxState(title: 'giza'),
    CheckBoxState(title: 'ggg') ,
    CheckBoxState(title: 'cairo'),
    CheckBoxState(title: 'giza'),
    CheckBoxState(title: 'ggg'),
    CheckBoxState(title: 'giza'),
    CheckBoxState(title: 'ggg') ,
    CheckBoxState(title: 'cairo'),
    CheckBoxState(title: 'giza'),
    CheckBoxState(title: 'ggg'),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Color(0xff5F33AC ) ,
      body:  Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.only(top: 45,left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                const SizedBox(height: 5,)
                , const Text("Filter",textAlign: TextAlign.center ,
                  style: TextStyle(fontSize: 24,color: Colors.white),)
              ],),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: const Text('Category',style: TextStyle(fontSize: 20,color:Colors.white),),
              ),
              Container(
                height: 220,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...category.map(checkbox).toList(),
                    ],),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Location',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
              ),

              Container(
                height: 240,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...location.map(checkbox).toList(),
                    ],),
                ),
              ),
            ],

          ),
        ),
      ),


    );
  }
  Widget checkbox(CheckBoxState checkBox)=> Transform.scale(
    scale: 0.9,
    child: CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.white,
      checkColor: Colors.black,

      side: BorderSide(color: Colors.white,),

      title:  Text(checkBox.title,style: const TextStyle(fontSize: 18,color: Colors.white),),
      value: checkBox.value, onChanged: (value)=>setState((){
      checkBox.value=value!;
      print("checkBox.value=value!=${checkBox.value=value}");

    }),

    ),
  );

}
