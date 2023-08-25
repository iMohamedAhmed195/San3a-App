// import 'package:flutter/material.dart';
// import 'package:san3a/models/message_model.dart';
// import 'package:san3a/models/message_socket_model.dart';
//
// class OwnMessageCard extends StatelessWidget {
//    OwnMessageCard(this.isSocket, this.messageModel,this.messageSocketModel,this.index,{Key? key }) : super(key: key);
//
//    late bool isSocket ;
//    MessagesModel? messageModel;
//    MessageSocketModel? messageSocketModel;
//   late int index;
//   @override
//   Widget build(BuildContext context ) {
//      if(isSocket){
//        return Align(
//          alignment: Alignment.centerRight,
//          child: ConstrainedBox(
//            constraints: BoxConstraints(
//              minWidth: MediaQuery.of(context).size.width-225,
//              maxWidth: MediaQuery.of(context).size.width-45,
//            ),
//            child: Container(
//              child: Card(
//                elevation: 1,
//                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                color: Color(0xffdcf8c6),
//                margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 5),
//                child: Stack(
//                  children: [
//                    Padding(
//                      padding: const EdgeInsets.only(left: 10,right: 60,top: 10,bottom: 20),
//
//                      child: Text('${messageSocketModel!.message}',style: TextStyle(fontSize: 16),) ,
//                    ),
//                    Positioned(
//                      bottom: 4,
//                      right: 10,
//                      child: Row(children: [
//                        Text('${messageSocketModel!.time}',style: TextStyle(fontSize: 13,color: Colors.grey[600]),) ,
//                        SizedBox(width: 5,),
//                        Icon(Icons.done_all,size: 20,),
//                      ],),
//                    )
//                  ],
//                ),
//              ),
//            ),
//          ),
//        );
//      }else{
//        return Align(
//          alignment: Alignment.centerRight,
//          child: ConstrainedBox(
//            constraints: BoxConstraints(
//              minWidth: MediaQuery.of(context).size.width-225,
//              maxWidth: MediaQuery.of(context).size.width-45,
//            ),
//            child: Container(
//              child: Card(
//                elevation: 1,
//                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                color: Color(0xffdcf8c6),
//                margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 5),
//                child: Stack(
//                  children: [
//                    Padding(
//                      padding: const EdgeInsets.only(left: 10,right: 60,top: 10,bottom: 20),
//
//                      child: Text('${messageModel!.data![index].text}',style: TextStyle(fontSize: 16),)  ,
//                    ),
//                    Positioned(
//                      bottom: 4,
//                      right: 10,
//                      child: Row(children: [Text('${messageModel!.data![index].time}',style: TextStyle(fontSize: 13,color: Colors.grey[600]),) ,
//                        SizedBox(width: 5,),
//                        Icon(Icons.done_all,size: 20,),
//                      ],),
//                    )
//                  ],
//                ),
//              ),
//            ),
//          ),
//        );
//      }
//
//
//   }
// }
