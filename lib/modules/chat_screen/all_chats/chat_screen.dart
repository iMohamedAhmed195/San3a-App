import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/chat_model.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_cubit.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_state.dart';
import 'package:san3a/modules/chat_screen/all_chats/custom_card.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/styles/colors.dart';

class ChatScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit()..GetAllChats(),
      child: BlocConsumer<ChatCubit,ChatState>(
        listener:(context , state){

        } ,
        builder: (context , state){
          var Cubit = ChatCubit.get(context);
          return Scaffold(

              body: ConditionalBuilder(
                condition: state is ChatSuccessState ,
                builder: (BuildContext context) {
                  return  ListView.separated(
                    itemBuilder: (context , index)=> Dismissible(
                      onDismissed: (direction){
                        Cubit.DeleteOneChat(index: index);
                      },
                        key: Key(''),
                        child: CustomCard(index)),
                    separatorBuilder: (BuildContext context, int index)=>Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: myDividor2(),
                    ),
                    itemCount: Cubit.chatModel!.data!.length,

                  );
                },
                fallback: (BuildContext context)=>Center(child: CircularProgressIndicator()),
              )
          ) ;
        },
      ),
    );
  }
}
