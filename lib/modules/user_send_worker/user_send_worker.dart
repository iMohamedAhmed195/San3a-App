import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/models/WorkerSendUserModel.dart';
import 'package:san3a/modules/add_post_screen/add_post_screen.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_cubit.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/individual_chat_from_post.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/individual_chat_from_profile.dart';
import 'package:san3a/modules/chat_screen/individual_chat_screen/individual_chat_from_user_send_worker.dart';
import 'package:san3a/modules/timeline/timeline_user/timeline_user_cubit/time_line_cubit.dart';
import 'package:san3a/modules/timeline/timeline_user/timeline_user_cubit/timeline_user_state.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_cubit/timeLine_cubit.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_cubit/timeLine_states.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/styles/colors.dart';
import 'package:san3a/shared/styles/icon_broken.dart';

class ProUserSendWorker extends StatelessWidget {
  ProUserSendWorker( this.index,{Key? key,}) : super(key: key);
   late  int index ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimeLineUserCubit , TimeLineUserState>(
      listener:(context , state){

      } ,
      builder: (context , state){
        var Cubit= TimeLineUserCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFfafafa),
            elevation: 0,
            leading: IconButton(
              onPressed: (){
                Cubit.GetDataWorker();
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
            condition: state is GoToProfileWorkerSuccessState,
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
                                backgroundImage: NetworkImage(Cubit.profileSendTo!.data!.userData!.photo!),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   Cubit.profileSendTo!.data!.userData!.name!,
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
                                       await ChatCubit.get(context).GetChatsFromPost(idUser: Cubit.profileSendTo!.data!.userData!.id!);
                                       navigateTo(context, IndividualChatFromUserSendWorker(Cubit.profileSendTo));
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
                          children:  [
                            Expanded(
                              flex: 2,
                              child: Text(
                                '${Cubit.profileSendTo!.data!.userData!.bio}',
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
                              children:  [
                                Text( San3aLayoutCubit.get(context).isArabic1?"التفاصيل":'Details',
                                    style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontWeight: FontWeight.bold,
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
                                    children:  [
                                      const Icon(Icons.work_history),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Text( 'Job',
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith( fontSize: 14)),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Row(
                                    children:  [
                                      Text('${Cubit.profileSendTo!.data!.userData!.job}',
                                        style: Theme.of(context).textTheme.bodyText1,)
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
                                  children:  [
                                    const Icon(Icons.home),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text( 'Lives in',
                                        style: Theme.of(context).textTheme.bodyText1!.copyWith( fontSize: 14)),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Row(
                                  children:  [
                                    Text(Cubit.profileSendTo!.data!.userData!.countryCode!,
                                      style: Theme.of(context).textTheme.bodyText1,
                                    )],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                              Row(
                                children: [
                                  Row(
                                    children:  [
                                      const Icon(Icons.date_range),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Text('Born',
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith( fontSize: 14)),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Row(
                                    children:  [
                                      Text('${Cubit.profileSendTo!.data!.userData!.birthdate}',
                                        style: Theme.of(context).textTheme.bodyText1,
                                      )
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
                                  children:  [
                                    const Icon(Icons.add_location_alt_sharp),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text( 'From',
                                        style:Theme.of(context).textTheme.bodyText1!.copyWith( fontSize: 14)),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Row(
                                  children:  [
                                    Text(Cubit.profileSendTo!.data!.userData!.city!,
                                        style: Theme.of(context).textTheme.bodyText1),
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
                  if(Cubit.profileSendTo!.data!.posts!.isEmpty)
                    Text('There is No Posts here'),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        this.index= index;
                        return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProfilePostUserSendWorkerItem(Cubit.profileSendTo!,context , index),
                      );},
                      separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                      itemCount: Cubit.profileSendTo!.data!.posts!.length),
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
