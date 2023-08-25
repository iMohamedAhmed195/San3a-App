

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/Admin/Payment/UnPaid/Cubit/UnPaidCubit.dart';
import 'package:san3a/modules/Admin/Payment/UnPaid/Cubit/UnPaidStates.dart';

class UnPaidPaymentScreen extends StatelessWidget {
  const UnPaidPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UnPaidPaymentCubit, AdminUnPaidStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                ' All UnPaid Worker',
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
                      condition: state is AdminGetPaidPaymentSuccessState,
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
                                                UnPaidPaymentCubit.get(context)
                                                    .unPaidPaymentModel!
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
                                                '${UnPaidPaymentCubit.get(context)
                                                    .unPaidPaymentModel!
                                                    .data![index].name!}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'job : ${UnPaidPaymentCubit.get(context)
                                                      .unPaidPaymentModel!
                                                      .data![index]
                                                      .job!}',
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
                              // PaidPaymentCubit.get(context)
                              //     .paymentPaidModel!
                              //     .date![index]
                              //     .description! == null ? SizedBox() : Align(
                              //   alignment: Alignment.topLeft,
                              //   child: Text(
                              //       'Describtion : ${PaidPaymentCubit.get(context)
                              //           .paymentPaidModel!
                              //           .date![index].description!}'
                              //   ),
                              // ),
                              SizedBox(
                                height: 3.0,
                              ),
                              // const Divider(),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.end,
                              //     children: [
                              //       defaultButtonWithIcon(
                              //         icon: Icons.delete,
                              //         background: Color(0xff4377ec),
                              //         text: 'Delete',
                              //         function: () async {
                              //           PaidPaymentCubit.get(context)
                              //               .DeletePaidPaymentForAdmin(
                              //               token: token!,
                              //               helpMeId:
                              //               PaidPaymentCubit.get(context)
                              //                   .paymentPaidModel!
                              //                   .date![index]
                              //                   .sId!);
                              //           navigateTo(context, PaidPaymentScreen());
                              //         },
                              //         width: 120.0,
                              //         radius: 40.0,
                              //         height: 40.0,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                             // const Divider(thickness: 10,),
                            ],
                          ),
                        ),
                        itemCount: UnPaidPaymentCubit.get(context).unPaidPaymentModel!.data!.length,
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
