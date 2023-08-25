import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/Admin/Users/Customer/Cubit/AdminUsersCubit.dart';
import 'package:san3a/modules/Admin/Users/Customer/Cubit/AdminUsersStates.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';


class AllCustomerScreen extends StatelessWidget {
  const AllCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AdminUsersCubit ,AdminUsersStates>(
      listener: (context,state){

      },
      builder: (context, state){
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                ' All Customer',
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
                    //const Divider(thickness: 2,),
                    ConditionalBuilder(
                      condition: state is AdminGetUsersSuccessState,
                      fallback: (context) => const Center(child: CircularProgressIndicator()),
                      builder: (context) =>ListView.separated(
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
                                            backgroundImage: NetworkImage(
                                                AdminUsersCubit.get(context)
                                                    .adminUserstModel!
                                                    .data![index]
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
                                              Text( AdminUsersCubit.get(context)
                                                  .adminUserstModel!
                                                  .data![index]
                                                  .name!,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                              // Text( AdminUsersCubit.get(context)
                                              //     .adminUserstModel!
                                              //     .data![index]
                                              //     .rateAverage[index]!),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: (){
                                        AdminUsersCubit.get(context).DeleteUserOrWorkerForAdmin(
                                            token: token!,
                                            userId: AdminUsersCubit.get(context)
                                                .adminUserstModel!.data![index].sId!
                                        );
                                        AdminUsersCubit.get(context).GetAllUsersForAdmin(token: token!);
                                      },
                                      icon: Icon(Icons.delete,
                                      color: Color(0xff4377ec),),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              const Divider(),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.end,
                              //     children: [
                              //       defaultButtonWithIcon(
                              //         icon: Icons.delete,
                              //         background:Color(0xff4377ec),
                              //         text: 'Delete',
                              //         function: () async {
                              //           AdminUsersCubit.get(context).DeleteUserOrWorkerForAdmin(
                              //               token: token!,
                              //               userId: AdminUsersCubit.get(context).adminUserstModel!.data![index].sId!
                              //           );
                              //           AdminUsersCubit.get(context).GetAllUsersForAdmin(token: token!);
                              //         },
                              //         width: 120.0,
                              //         radius: 40.0,
                              //         height: 40.0,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              //const Divider(thickness: 10,),
                            ],
                          ),
                        ),
                        itemCount: AdminUsersCubit.get(context).adminUserstModel!.data!.length,
                        separatorBuilder:  (context, index) => const SizedBox(
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
