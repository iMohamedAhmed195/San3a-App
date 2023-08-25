import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/Admin/AdminScreen.dart';
import 'package:san3a/modules/Admin/Posts/Cubit/AdminPostCubit.dart';
import 'package:san3a/modules/Admin/Posts/Cubit/AdminPostStates.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/styles/colors.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminPostCubit, AdminPostStates>(
      listener: (context, states) {
        // if (state is PostSuccessState) {
        //   navigateTo(context, const ProUser());
        // }
      },
      builder: (context, state) {
        print(state);
        var Cubit = AdminPostCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
                title: Text(
                    ' All Report Posts',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellowAccent,
                    ),
                  ),
                iconTheme: IconThemeData(
                 size: 30,
                  color: Colors.yellowAccent,
                ),
              backgroundColor: Color(0xff4377ec),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // Container(
                  //   color: Color(0xff4377ec),
                  //   child: Row(
                  //     children: [
                  //       IconButton(
                  //         onPressed: () {
                  //           navigateTo(context, AdminScreen());
                  //         },
                  //         icon: Icon(Icons.arrow_back),
                  //         iconSize: 30.0,
                  //       ),
                  //       Text(
                  //         ' All Report Posts',
                  //         style: TextStyle(
                  //           fontSize: 25.0,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       const Divider(
                  //         thickness: 3.0,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SingleChildScrollView(
                      child: ConditionalBuilder(
                        condition: state is AdminGetPostSuccessState,
                        builder: (context) => ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              // navigateTo(context, PostItem(Cubit.adminPostModel!,context , index));
                            },
                            child: Card(
                              elevation: 10.0,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 3.0,
                                  ),
                                   //Card on column
                                   Column(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Align(
                                           alignment: Alignment.topLeft,
                                           child: Text(
                                             'Reported Post : ',
                                             style: TextStyle(
                                               fontSize: 18,
                                               fontFamily: 'mulish',
                                               fontWeight: FontWeight.bold,
                                               color: Colors.black,
                                             ),
                                           ),
                                         ),
                                       ),
                                       Row(
                                         mainAxisAlignment:
                                         MainAxisAlignment.spaceBetween,
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Row(
                                               children: [
                                                 Container(
                                                   alignment: Alignment.topLeft,
                                                   child: CircleAvatar(
                                                     backgroundColor:
                                                     Colors.transparent,
                                                     radius: 25,
                                                     backgroundImage:  AdminPostCubit.get(context)
                                                         .adminPostModel!
                                                         .date![index]
                                                         .postId!
                                                         .user!
                                                         .photo == null ? NetworkImage('assets/images/img_5.png') : NetworkImage(
                                                         AdminPostCubit.get(context)
                                                             .adminPostModel!
                                                             .date![index]
                                                             .postId!
                                                             .user!
                                                             .photo!),
                                                   ),
                                                 ),
                                                 Padding(
                                                   padding:
                                                   const EdgeInsets.all(8.0),
                                                   child: Column(
                                                     crossAxisAlignment:
                                                     CrossAxisAlignment.start,
                                                     children: [
                                                       Text(AdminPostCubit.get(
                                                           context)
                                                           .adminPostModel!
                                                           .date![index]
                                                           .postId!
                                                           .user!
                                                           .name!),
                                                       Text('created at : ${AdminPostCubit.get(
                                                           context)
                                                           .adminPostModel!
                                                           .date![index]
                                                           .postId!
                                                           .date!}'),
                                                     ],
                                                   ),
                                                 ),
                                               ],
                                             ),
                                           ),
                                         ],
                                       ),
                                       Container(
                                         padding: const EdgeInsets.all(10.0),
                                         alignment: Alignment.bottomLeft,
                                         child: Text(
                                           AdminPostCubit.get(context)
                                               .adminPostModel!
                                               .date![index]
                                               .postId!
                                               .description!,
                                           maxLines: 2,
                                           style: TextStyle(
                                             fontSize: 16.0,
                                             color: Colors.black,
                                           ),
                                         ),
                                       ),
                                       // const Divider(),
                                       // AdminPostCubit.get(context)
                                       //             .adminPostModel!
                                       //             .date![index]
                                       //             .postId!
                                       //             .image == [] ? SizedBox() : SizedBox(
                                       //         child: Image(
                                       //           image: NetworkImage(
                                       //               AdminPostCubit.get(context)
                                       //                   .adminPostModel!
                                       //                   .date![index]
                                       //                   .postId!
                                       //                   .image![0]),
                                       //         ),
                                       //       ),
                                     ],
                                   ),
                                   ///Card on culomn
                                   Column(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Align(
                                           alignment: Alignment.topLeft,
                                           child: Text(
                                             'Reported From : ',
                                             style: TextStyle(
                                               fontSize: 18,
                                               fontFamily: 'mulish',
                                               fontWeight: FontWeight.bold,
                                               color: Colors.black,
                                             ),
                                           ),
                                         ),
                                       ),
                                       //=======================================
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Row(
                                           children: [
                                             Container(
                                               alignment: Alignment.topLeft,
                                               child: CircleAvatar(
                                                 backgroundColor: Colors.transparent,
                                                 radius: 25,
                                                 backgroundImage: NetworkImage(
                                                     AdminPostCubit.get(context)
                                                         .adminPostModel!
                                                         .date![index]
                                                         .postId!
                                                         .user!
                                                         .photo!),
                                               ),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Column(
                                                 crossAxisAlignment:
                                                 CrossAxisAlignment.start,
                                                 children: [
                                                   Text(AdminPostCubit.get(context)
                                                       .adminPostModel!
                                                       .date![index]
                                                       .userId!
                                                       .name!),
                                                   Text( 'reported at : ${AdminPostCubit.get(context)
                                                       .adminPostModel!
                                                       .date![index]
                                                       .reportedAt}'),
                                                 ],
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Align(
                                           alignment: Alignment.topLeft,
                                           child: Text(
                                             'Report description : ',
                                             style: TextStyle(
                                               fontSize: 18,
                                               fontFamily: 'mulish',
                                               fontWeight: FontWeight.bold,
                                               color: Colors.black,
                                             ),
                                           ),
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Align(
                                           alignment: Alignment.topLeft,
                                           child: Text(AdminPostCubit.get(context)
                                               .adminPostModel!
                                               .date![index]
                                               .description!,
                                             style: TextStyle(
                                               fontSize: 14,
                                               fontFamily: 'mulish',
                                               //fontWeight: FontWeight.bold,
                                               color: Colors.black,
                                             ),
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        defaultButtonWithIcon(
                                          icon: Icons.send,
                                          background: Color(0xFFFBC02D),
                                          text: 'Warning message',
                                          function: () async {
                                            //implement warring massage
                                            AdminPostCubit.get(context).GetPostsForAdmin(token: token!);
                                          },
                                          width: 120.0,
                                          radius: 40.0,
                                          height: 40.0,
                                        ),
                                        defaultButtonWithIcon(
                                          icon: Icons.delete,
                                          background: Color(0xFFE53935),
                                          //Color(0xff4377ec),
                                          text: 'Delete Post',
                                          function: () async {
                                            AdminPostCubit.get(context).DeletePostsForAdmin(token: token!,
                                              postId: AdminPostCubit.get(context).adminPostModel!.date![index].postId!.sId!,);
                                            AdminPostCubit.get(context).GetPostsForAdmin(token: token!);
                                          },
                                          width: 120.0,
                                          radius: 40.0,
                                          height: 40.0,
                                        ),
                                      ],

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemCount: Cubit.adminPostModel!.length!,
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
