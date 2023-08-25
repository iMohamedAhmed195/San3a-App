import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/WorkerSendUserModel.dart';
import 'package:san3a/modules/add_post_screen/add_post_screen.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_cubit.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/individual_chat_from_post.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/individual_chat_from_profile.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_cubit/timeLine_cubit.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_cubit/timeLine_states.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/styles/colors.dart';
import 'package:san3a/shared/styles/icon_broken.dart';

class ProUser extends StatelessWidget {
    ProUser( this.index,{Key? key,}) : super(key: key);
   late  int index ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimeLineCubit , TimeLineState>(
      listener:(context , state){

      } ,
      builder: (context , state){
        var Cubit= TimeLineCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFfafafa),
            elevation: 0,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon:const Icon(Icons.arrow_back,color: Colors.black,),),
            title: const Text('Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () { navigateTo(context, const AddScreen()); },
            child: const Icon(IconBroken.Edit),
          ),
          body: ConditionalBuilder(
            condition: state is GoToProfilePersonSuccessState,
            builder: (context)=>SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 120.0,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 50.0,
                                backgroundImage: NetworkImage(Cubit.getProfileSender!.data!.userData!.photo!),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   Cubit.getProfileSender!.data!.userData!.name!,
                                   maxLines: 1,
                                   overflow: TextOverflow.ellipsis,
                                   style: const TextStyle(
                                     fontSize: 20.0,
                                     fontWeight: FontWeight.bold,
                                     color: textColor,
                                   ),
                                 ),
                                 const SizedBox(
                                   height: 5.0,
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: const [
                                     Icon(
                                       Icons.star,
                                       color: Color(0xffe59819),
                                     ),
                                     Icon(
                                       Icons.star,
                                       color: Color(0xffe59819),
                                     ),
                                     Icon(
                                       Icons.star,
                                       color: Color(0xffe59819),
                                     ),
                                     Icon(
                                       Icons.star_border,
                                       color: Color(0xffe59819),
                                     ),
                                     Icon(
                                       Icons.star_border,
                                       color: Color(0xffe59819),
                                     ),
                                   ],
                                 ),
                          SizedBox(height: 5,),
                                 Container(
                                   width: 115
                                   ,
                                   height: 25,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(8),
                                     color: Colors.blue,
                                   ),
                                   child: MaterialButton(
                                     onPressed: ()async{
                                       await ChatCubit.get(context).GetChatsFromPost(
                                           idUser: TimeLineCubit.get(context).getProfileSender!.data!.userData!.id!);

                                       navigateTo(context, IndividualChatFromProfile(index, TimeLineCubit.get(context).getProfileSender!.data!.userData!.id!));
                                     },
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Expanded(
                                           flex: 3,
                                           child: Text(
                                             'Send Message',
                                             style: const TextStyle(
                                               fontSize: 10,
                                               fontWeight: FontWeight.w700,
                                               color: Colors.white,
                                             ),

                                           ),
                                         ),

                                       ],
                                     ),
                                   ),
                                 )
                               ],
                             )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae elementum nulla, at ornare est',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          children: [
                            Row(
                              children: const [
                                Text('Details',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                        letterSpacing: 2.0,
                                        fontSize: 18)),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.home),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text('Lives in',
                                        style: TextStyle(color: textColor, fontSize: 18)),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Row(
                                  children: const [
                                    Text('AlHaram street',
                                        style: TextStyle(
                                          color: textColor,
                                        )),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.add_location_alt_sharp),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text('From',
                                        style: TextStyle(color: textColor, fontSize: 18)),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Row(
                                  children: const [
                                    Text('Giza',
                                        style: TextStyle(
                                          color: textColor,
                                        )),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        this.index= index;
                        return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProfilePostWorkerSendUserItem(Cubit.getProfileSender!,context , index),
                      );},
                      separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                      itemCount: Cubit.getProfileSender!.data!.posts!.length),
                ],
              ),
            ),
            fallback:(context)=> const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
