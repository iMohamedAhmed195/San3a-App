import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/Admin/Users/Worker/Cubit/AdminWorkerCubit.dart';
import 'package:san3a/modules/Admin/Users/Worker/Cubit/AdminWorkerStates.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';

class AllWorkerScreen extends StatelessWidget {
  const AllWorkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminWorkerCubit, AdminWorkersStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                ' All Worker',
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
                      condition: state is AdminGetWorkersSuccessState,
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
                                            backgroundColor: Colors.transparent,
                                            radius: 25,
                                            backgroundImage: NetworkImage(
                                                AdminWorkerCubit.get(context)
                                                    .adminWorkerstModel!
                                                    .data![index]
                                                    .photo!),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                AdminWorkerCubit.get(context)
                                                    .adminWorkerstModel!
                                                    .data![index]
                                                    .name!,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      AdminWorkerCubit.get(context)
                                          .DeleteUserOrWorkerForAdmin(
                                              token: token!,
                                              userId:
                                                  AdminWorkerCubit.get(context)
                                                      .adminWorkerstModel!
                                                      .data![index]
                                                      .sId!);
                                      AdminWorkerCubit.get(context)
                                          .GetAllWorkersForAdmin(token: token!);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Color(0xff4377ec),
                                    ),
                                  ),
                                ],
                              ),
                              AdminWorkerCubit.get(context)
                                          .adminWorkerstModel!
                                          .data![index]
                                          .bio ==
                                      null
                                  ? SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Bio : ${AdminWorkerCubit.get(context).adminWorkerstModel!.data![index].bio!}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                              // SizedBox(
                              //    height: 3.0,
                              //  ),
                              // const Divider(thickness: 1.5,),
                              //  Padding(
                              //    padding: const EdgeInsets.all(8.0),
                              //    child: Row(
                              //      mainAxisAlignment: MainAxisAlignment.end,
                              //      children: [
                              //        defaultButtonWithIcon(
                              //          icon: Icons.delete,
                              //          background:Color(0xff4377ec),
                              //          text: 'Delete',
                              //          function: () async {
                              //            AdminWorkerCubit.get(context).DeleteUserOrWorkerForAdmin(
                              //                token: token!,
                              //                userId: AdminWorkerCubit.get(context).adminWorkerstModel!.data![index].sId!
                              //            );
                              //            AdminWorkerCubit.get(context).GetAllWorkersForAdmin(token: token!);
                              //          },
                              //          width: 120.0,
                              //          radius: 40.0,
                              //          height: 40.0,
                              //        ),
                              //      ],
                              //    ),
                              //  ),
                              // const Divider(thickness: 10,),
                            ],
                          ),
                        ),
                        itemCount: AdminWorkerCubit.get(context)
                            .adminWorkerstModel!
                            .data!
                            .length,
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
