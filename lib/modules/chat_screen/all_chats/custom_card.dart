import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/chat_model.dart';
import 'package:san3a/models/message_socket_model.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_cubit.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_state.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/individual_chat.dart';
import 'package:san3a/modules/pro_woker/profile_cubit/profile_worker_cubit.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';

class CustomCard extends StatelessWidget {
   CustomCard(this.index, {Key? key}) : super(key: key);

  late int index;
   int i =0;
   MessageSocketModel? messageSocketModel;
   List<MessageSocketModel> messages = [];
   @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit , ChatState>(
        listener: (context ,state){
        },
      builder: (context ,state){
          var Cubit = ChatCubit.get(context);
        return InkWell(
          onTap: (){
             Cubit.GetMessageChats(index: index);

             navigateTo(context, IndividualChat( index , ChatCubit.get(context).chatModel!.data![index].sId!));

          },
          child: Column(
            children: [
              if(Cubit.chatModel!.data![index].to!.id ==  Cubit.chatModel!.loginId)
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('${Cubit.chatModel!.data![index].from!.photo}'),
                ),
                title: Text(
                  '${Cubit.chatModel!.data![index].from!.name}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.done_all,color:  const Color(0xFF7E8181),),
                    SizedBox(width: 3,),
                    if(Cubit.chatModel!.data![index].latestMessage!.text == null)
                      Text(
                        'في ايقون هنا',
                        style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
                      ),
                    if(Cubit.chatModel!.data![index].latestMessage!.text != null)
                    Text(
                      '${Cubit.chatModel!.data![index].latestMessage!.text}',
                      style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
                    )
                  ],
                ),
                trailing: Text('${Cubit.chatModel!.data![index].latestMessage!.time!}',
                style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13,color: Colors.white),) ,
              ),
              if(Cubit.chatModel!.data![index].to!.id !=  Cubit.chatModel!.loginId)
                ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('${Cubit.chatModel!.data![index].to!.photo}'),
                  ),
                  title: Text(
                    '${Cubit.chatModel!.data![index].to!.name}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Row(
                    children: [
                      Icon(Icons.done_all,color:  const Color(0xFF7E8181),),
                      SizedBox(width: 3,),
                      Expanded(
                        child: Text(
                          Cubit.chatModel!.data![index].latestMessage!.text!,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13,)
                        ),
                      )
                    ],
                  ),
                  trailing: Text(Cubit.chatModel!.data![index].latestMessage!.time!
                  ,style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13,color: Colors.white),) ,
                ),
            ],
          ),
        );
      },
    );
  }
}
