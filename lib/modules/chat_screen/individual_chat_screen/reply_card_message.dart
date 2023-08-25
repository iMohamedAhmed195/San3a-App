// import 'package:flutter/material.dart';
// import 'package:san3a/models/message_model.dart';
// import 'package:san3a/models/message_socket_model.dart';
//
// class ReplyMessageCard extends StatelessWidget {
//
//   ReplyMessageCard(this.isSocket, this.messageModel,this.messageSocketModel,this.index,{Key? key }) : super(key: key);
//
//   late bool isSocket ;
//   MessagesModel? messageModel;
//   MessageSocketModel? messageSocketModel;
//   late int index;
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: ConstrainedBox(
//         constraints: BoxConstraints(
//           maxWidth: MediaQuery.of(context).size.width-45,
//         ),
//         child: Card(
//           elevation: 1,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//           color: Color(0xffE9EBECFF),
//           margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 5),
//           child: Stack(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 10,right: 60,top: 10,bottom: 20),
//                 child: isSocket ? Text('${messageSocketModel!.message}',style: TextStyle(fontSize: 16),) :Text('${messageModel!.data![index].text}',style: TextStyle(fontSize: 16),) ,
//               ),
//               Positioned(
//                 bottom: 4,
//                 right: 10,
//                 child:isSocket? Text('${messageSocketModel!.time}',style: TextStyle(fontSize: 13,color: Colors.grey[600]),): Text('${messageModel!.data![index].time}',style: TextStyle(fontSize: 13,color: Colors.grey[600]),),
//
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
