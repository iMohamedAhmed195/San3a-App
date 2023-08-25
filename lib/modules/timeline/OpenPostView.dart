import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/post_model.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_state.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/individual_chat_from_post.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_cubit/timeLine_cubit.dart';
import 'package:san3a/shared/styles/colors.dart';
import 'package:san3a/shared/styles/icon_broken.dart';

import '../../shared/component/component.dart';
import '../chat_screen/all_chats/cubit_chat/chat_cubit.dart';
enum  _MenuValue{
  Save,
  Report,
}
class OpenPostView extends StatelessWidget {
   OpenPostView(this.index,this.model ,{ Key? key}) : super(key: key);
   PostModel? model;
  late int index;

  @override
  Widget build(BuildContext context) {

    return   Scaffold(

      appBar: AppBar(title: Text("Post")),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5.0,
            // margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          TimeLineCubit.get(context).goToProfilePerson(index);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 25,
                          backgroundImage: NetworkImage(
                              model!.postData![index].userDataPost!.photo!),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                TimeLineCubit.get(context).goToProfilePerson(index);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    model!.postData![index].userDataPost!.name!,
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  model!.postData![index].date!,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  model!.postData![index].job!,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      IconButton(
                          onPressed: () {

                            PopupMenuButton<_MenuValue>(
                              itemBuilder: (context)=> [
                                PopupMenuItem(child: Text('Save'),value: _MenuValue.Save,),
                                PopupMenuItem(child: Text('Report'),value: _MenuValue.Save,),
                              ],
                              onSelected: (value){
                                switch(value){
                                  case _MenuValue.Save: TimeLineCubit.get(context).SavePost(postId: model!.postData![index].postId!);
                                  break;
                                  case _MenuValue.Report:
                                    break;
                                }
                              },
                            );
                          },
                          icon: const Icon(
                            IconBroken.More_Square,
                            size: 18,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: myDividor2(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10.0),
                      child: Text(
                        model!.postData![index].description!,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                  if (model!.postData![index].image!.isNotEmpty)
                    if(model!.postData![index].image!.length == 1)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 15.0),
                        child: Container(
                            height: 200.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        model!.postData![index].image![0])))),
                      ),
                  const SizedBox(
                    height: 10,
                  ),
                  if(model!.postData![index].image!.length > 1)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children:<Widget> [
                             Container(
                               //height: 400,
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context , index1){
                                  return Card(

                                    child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Image(image: NetworkImage('${model!.postData![index].image![index1]}'),fit: BoxFit.fill,),
                                ),
                                  );},
                                itemCount: model!.postData![index].image!.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:1 ),
                              ),
                            ),

                        ],
                      ),
                    ),
                  if (model!.postData![index].image!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: myDividor2(),
                    ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BlocConsumer<ChatCubit, ChatState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return defaultButtonWithIcon(
                              icon: Icons.send,
                              background: defaultColor,
                              text: 'Send Message',
                              function: () async {
                                await ChatCubit.get(context).GetChatsFromPost(
                                    idUser: model!.postData![index].userDataPost!.id!);

                                navigateTo(context,
                                    IndividualChatFromPost(index, model!.postData![index].userDataPost!.id!));
                              },
                              width: 120.0,
                              radius: 30.0,
                              height: 30.0,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
