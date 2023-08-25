import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/modules/pro_woker/profile_cubit/profile_worker_cubit.dart';
import 'package:san3a/modules/user_send_worker/user_send_worker.dart';
import 'package:san3a/shared/component/component.dart';
import 'timeline_user_cubit/time_line_cubit.dart';
import 'timeline_user_cubit/timeline_user_state.dart';

class TimeLineForUser extends StatefulWidget {
  const TimeLineForUser({Key? key}) : super(key: key);

  @override
  State<TimeLineForUser> createState() => _TimeLineForUserState();
}

class _TimeLineForUserState extends State<TimeLineForUser> {
  Future<void> _loadResources() {
    return Future.delayed(
      Duration(seconds:0),(){
      TimeLineUserCubit.get(context).GetDataWorker();
    }
    );

  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = ScrollController();
  final double itemSize = 110;

  @override
  void onListenerController() {
    setState(() {});
  }

  @override
  void initState() {
    controller.addListener(onListenerController);
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return
        BlocConsumer<TimeLineUserCubit, TimeLineUserState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TimeLineUserCubit.get(context);
          return Scaffold(
              body: RefreshIndicator(
                  onRefresh: _loadResources,
                  child: ConditionalBuilder(
                    condition: state is GetWorkerSuccessState,
                    builder: (context) => ListView.builder(
                        controller: controller,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          final itemOffset = index * itemSize;
                          final difference = controller.offset - itemOffset;
                          final precent = 1 - (difference / (itemSize / 2));
                          double opacity = precent;
                          double scale = precent;
                          if (opacity > 1.0) opacity = 1.0;
                          if (opacity < 0.0) opacity = 0.0;
                          if (scale > 1.0) scale = 1.0;
                          return InkWell(
                            onTap: (){
                              cubit.goToProfilePerson(cubit.getDataWorker!.data![index].id);
                              navigateTo(context, ProUserSendWorker(index));
                            },
                            child: Opacity(
                                opacity: opacity,
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.identity()
                                        ..scale(scale, 1.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 105,
                                                width: double.infinity,
                                                alignment: Alignment.topCenter,
                                                margin: const EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(100),
                                                        bottomLeft:
                                                            Radius.circular(100)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 3,
                                                        blurRadius: 5,
                                                        offset: const Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ]),
                                              ),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 55,
                                                    backgroundImage: NetworkImage(
                                                        '${cubit.getDataWorker!.data![index].photo}'),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "${cubit.getDataWorker!.data![index].name}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: const [
                                                              Icon(
                                                                Icons.star,
                                                                color: Color(
                                                                    0xffe59819),
                                                                size: 16,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                color: Color(
                                                                    0xffe59819),
                                                                size: 16,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 16,
                                                                color: Color(
                                                                    0xffe59819),
                                                              ),
                                                              Icon(
                                                                size: 16,
                                                                Icons.star_border,
                                                                color: Color(
                                                                    0xffe59819),
                                                              ),
                                                              Icon(
                                                                size: 16,
                                                                Icons.star_border,
                                                                color: Color(
                                                                    0xffe59819),
                                                              ),
                                                            ],
                                                          ),
                                                          Text(
                                                            " | ${cubit.getDataWorker!.data![index].job}",
                                                            style: TextStyle(
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1.5,
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                        child: Wrap(children: [
                                                          SizedBox(
                                                            width: 210,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      left: 10.0),
                                                              child: Text(
                                                                "${cubit.getDataWorker!.data![index].bio}",
                                                                textDirection:San3aLayoutCubit.get(context).isArabic1 ?  TextDirection.rtl : TextDirection.ltr,
                                                                style: TextStyle(
                                                                    fontSize:10),
                                                                maxLines: 2,
                                                              ),
                                                            ),
                                                          ),
                                                        ]),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                )),
                          );
                        }
                        ),
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                  )));
        },
      );
  }

  // Widget _lisview() => ListView.builder(
  //     controller: controller,
  //     itemCount: 15,
  //     itemBuilder: (context, index) {
  //       final itemOffset = index * itemSize;
  //       final difference = controller.offset - itemOffset;
  //       final precent = 1 - (difference / (itemSize / 2));
  //       double opacity = precent;
  //       double scale = precent;
  //       if (opacity > 1.0) opacity = 1.0;
  //       if (opacity < 0.0) opacity = 0.0;
  //       if (scale > 1.0) scale = 1.0;
  //       return Opacity(
  //           opacity: opacity,
  //           child: Transform(
  //               alignment: Alignment.center,
  //               transform: Matrix4.identity()..scale(scale, 1.0),
  //               child: Padding(
  //                 padding: const EdgeInsets.all(2.0),
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(4.0),
  //                   child: Stack(
  //                     children: [
  //                       Container(
  //                         height: 105,
  //                         width: double.infinity,
  //                         alignment: Alignment.topCenter,
  //                         margin: const EdgeInsets.all(2),
  //                         decoration: BoxDecoration(
  //                             color: Colors.white,
  //                             borderRadius: BorderRadius.only(
  //                                 topLeft: Radius.circular(100),
  //                                 bottomLeft: Radius.circular(100)),
  //                             boxShadow: [
  //                               BoxShadow(
  //                                 color: Colors.grey.withOpacity(0.5),
  //                                 spreadRadius: 3,
  //                                 blurRadius: 5,
  //                                 offset: const Offset(
  //                                     0, 3), // changes position of shadow
  //                               ),
  //                             ]),
  //                       ),
  //                       Row(
  //                         children: [
  //                           CircleAvatar(
  //                               radius: 55,
  //                               child: Image.asset('assets/images/logo.png')),
  //                           Column(
  //                             mainAxisAlignment: MainAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 "Mohamed Ahmed",
  //                                 style: TextStyle(
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 20),
  //                               ),
  //                               Row(
  //                                 children: [
  //                                   Row(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.center,
  //                                     children: const [
  //                                       Icon(
  //                                         Icons.star,
  //                                         color: Color(0xffe59819),
  //                                         size: 16,
  //                                       ),
  //                                       Icon(
  //                                         Icons.star,
  //                                         color: Color(0xffe59819),
  //                                         size: 16,
  //                                       ),
  //                                       Icon(
  //                                         Icons.star,
  //                                         size: 16,
  //                                         color: Color(0xffe59819),
  //                                       ),
  //                                       Icon(
  //                                         size: 16,
  //                                         Icons.star_border,
  //                                         color: Color(0xffe59819),
  //                                       ),
  //                                       Icon(
  //                                         size: 16,
  //                                         Icons.star_border,
  //                                         color: Color(0xffe59819),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                   Text(
  //                                     "| Mechanices",
  //                                     style: TextStyle(fontSize: 12),
  //                                   ),
  //                                 ],
  //                               ),
  //                               SizedBox(
  //                                 height: 1.5,
  //                               ),
  //                               SizedBox(
  //                                 height: 50,
  //                                 child: Row(
  //                                   mainAxisAlignment: MainAxisAlignment.start,
  //                                   children: [
  //                                     Wrap(
  //                                         children: const [
  //                                       SizedBox(
  //                                         width: 210,
  //                                         child: Padding(
  //                                           padding: EdgeInsets.only(left:10.0),
  //                                           child: Text(
  //                                             "Manar AdelAhmed Manar Adel Ahmed Manar Adel Ahmed",
  //                                             style: TextStyle(fontSize: 16),
  //                                             maxLines: 2,
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ]),
  //                                   ],
  //                                 ),
  //                               )
  //                             ],
  //                           ),
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               )));
  //     });
}

/*
Row(

                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                              NetworkImage('https://via.placeholder.com/180'),
                              backgroundColor: Colors.transparent,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                    height: 35,
                                    child: Wrap(children: const [SizedBox(width:200,child: Text("Manar Adel Ahmed",
                                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                                    ]),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Wrap(children: const [SizedBox(width:200,child: Text("Manar Adel
                                   Ahmed Manar Adel Ahmed Manar Adel Ahmed   ",
                                    style: TextStyle(fontSize: 18),maxLines: 2,),),
                                  ]),
                                )
                              ],
                            )

                          ]),


 */

//
// child:  Material(
// child: Container(
// height: 120,
// child: ListTile(
// leading: Container(
// width: 100,
// height: 100,
// child: GestureDetector(
// behavior: HitTestBehavior.translucent,
// onTap: () {},
// child:  CachedNetworkImage(
// imageUrl: 'https://static4.depositphotos.com/1000393/362/i/600/depositphotos_3628253-stock-photo-smiling-manual-worker.jpg',
//
// imageBuilder: (context, imageProvider) => Container(
//
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// image: DecorationImage(
// image: imageProvider, fit: BoxFit.cover),
// ),
// ),
// placeholder: (context, url) => CircularProgressIndicator(),
// errorWidget: (context, url, error) => Icon(Icons.error),
// ),
//
//
// ),
// ),
// onTap: () {},
// title: Text('mohamed ahmed',style: TextStyle(fontWeight: FontWeight.bold),),
// subtitle:const Text('mohamed ahmed mohamed ahmed mohamed ahmed mohamed'
// ' ahmed mohamed ahmed mohamedmohamedmohamedmohamedmohamedmohamedmohamedmohamed ahmed mohamed ahmed mohamed ahmed'),
// tileColor: Colors.grey,
//
// ),
// ),
//
// ),
