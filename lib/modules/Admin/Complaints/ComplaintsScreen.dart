import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/Admin/Complaints/Cubit/ComplaintCubit.dart';
import 'package:san3a/modules/Admin/Complaints/Cubit/ComplaintStates.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';

class ComplaintsScreen extends StatelessWidget {
  const ComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ComplaintsCubit, ComplaintsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                ' All Complaints',
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
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ConditionalBuilder(
                      condition: state is AdminGetComplaintsSuccessState,
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                      builder: (context) => ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Card(
                          color: Colors.grey[90],
                          elevation: 10,
                          //shape: ShapeBorder(5.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            children: [
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
                                            backgroundImage:  NetworkImage(
                                                ComplaintsCubit.get(context)
                                                    .adminComplaintsModel!
                                                    .date![index]
                                                    .userId!.photo!),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${ComplaintsCubit.get(context)
                                                    .adminComplaintsModel!
                                                    .date![index].userId!.name!}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'email : ${ComplaintsCubit.get(context).adminComplaintsModel!.date![index].userId!.email!}',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              ComplaintsCubit.get(context)
                                          .adminComplaintsModel!
                                          .date![index]
                                          .description! == null ? SizedBox() : Align(
                                alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          'Describtion : ${ComplaintsCubit.get(context)
                                              .adminComplaintsModel!
                                              .date![index].description!}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                              ),
                                    ),
                                  ),
                              // const Divider(),
                              // ComplaintsCubit.get(context)
                              //             .adminComplaintsModel!
                              //             .date![index]
                              //             .image == null ? SizedBox() : SizedBox(
                              //               child: Image(
                              //                 image: NetworkImage(
                              //                     ComplaintsCubit.get(context)
                              //                         .adminComplaintsModel!
                              //                         .date![index]
                              //                         .image![0]),
                              //               ),
                              //             ),
                              SizedBox(
                                height: 3.0,
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    defaultButtonWithIcon(
                                      icon: Icons.send,
                                      background: Color(0xff4377ec),
                                      text: 'Massage',
                                      function: () async {
                                      // implement send massage
                                        ComplaintsCubit.get(context).SentHelpMeMessageFromAdmin(token: token!,
                                            email: ComplaintsCubit.get(context).adminComplaintsModel!.date![index].userId!.email!);
                                        ComplaintsCubit.get(context).GetAllHelpMeForAdmin(token: token!);
                                      },
                                      width: 120.0,
                                      radius: 40.0,
                                      height: 40.0,
                                    ),
                                    defaultButtonWithIcon(
                                      icon: Icons.delete,
                                      background: Color(0xff4377ec),
                                      text: 'Delete',
                                      function: () async {
                                        ComplaintsCubit.get(context)
                                            .DeleteHelpMeForAdmin(
                                                token: token!,
                                            helpMeId:
                                                    ComplaintsCubit.get(context)
                                                        .adminComplaintsModel!
                                                        .date![index]
                                                        .sId!);
                                        ComplaintsCubit.get(context).GetAllHelpMeForAdmin(token: token!);
                                      },
                                      width: 120.0,
                                      radius: 40.0,
                                      height: 40.0,
                                    ),
                                  ],
                                ),
                              ),
                              //const Divider(thickness: 10,),
                            ],
                          ),
                        ),
                        itemCount: ComplaintsCubit.get(context).adminComplaintsModel!.length!,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
