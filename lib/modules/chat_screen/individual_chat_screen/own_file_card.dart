

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:san3a/models/message_model.dart';

class OwnFileCard extends StatelessWidget {
   OwnFileCard(this.messageModel,this.index,{Key? key,}) : super(key: key);
   MessagesModel? messageModel;
  late int index;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        child: Container(
          height: MediaQuery.of(context).size.height/2.3,
          width: MediaQuery.of(context).size.width/1.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green[300]
          ),
          child: Card(
            margin: EdgeInsets.all(3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(

              children: [
                Expanded(
                  child: Image(image: NetworkImage('${messageModel!.data![index].image}'))
                ),
               20 > 0? Container(
                  height: 40,
                  padding: EdgeInsets.only(left: 15,top: 8),
                  child: Text('${messageModel!.data![index].text}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),),
                ):Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
