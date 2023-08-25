// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:san3a/modules/Admin/Users/Customer/Cubit/AdminUsersCubit.dart';
// import 'package:san3a/modules/Admin/Users/Customer/Cubit/AdminUsersStates.dart';
//
//
// class UsersScreen extends StatelessWidget {
//   const UsersScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return  BlocConsumer<AdminUsersCubit ,AdminUsersStates>(
//       listener: (context,state){
//
//       },
//       builder: (context, state){
//         return SafeArea(
//           child: Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 ' All Users',
//                 style: TextStyle(
//                   fontSize: 25.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.yellowAccent,
//                 ),
//               ),
//               iconTheme: IconThemeData(
//                 size: 30,
//                 color: Colors.yellowAccent,
//               ),
//               backgroundColor: Color(0xff4377ec),
//             ),
//             body: Column(
//               children: [
//
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
//
//
//
//
//
//
// // Padding(
// // padding: const EdgeInsets.all(8.0),
// // child: SingleChildScrollView(
// // child: Column(
// // children: [
// // Text('All Customer',
// // style: TextStyle(
// // fontSize: 25,
// // fontWeight: FontWeight.bold,
// // ),),
// // const Divider(thickness: 2,),
// // ConditionalBuilder(
// // condition: state is AdminGetUsersSuccessState,
// // fallback: (context) => const Center(child: CircularProgressIndicator()),
// // builder: (context) =>ListView.separated(
// // shrinkWrap: true,
// // physics: const BouncingScrollPhysics(),
// // itemBuilder: (context, index) => Card(
// // child: Column(
// // children: [
// // Row(
// // mainAxisAlignment:
// // MainAxisAlignment.spaceBetween,
// // children: [
// // Padding(
// // padding: const EdgeInsets.all(8.0),
// // child: Row(
// // children: [
// // Container(
// // alignment: Alignment.topLeft,
// // child: CircleAvatar(
// // backgroundColor:
// // Colors.transparent,
// // radius: 25,
// // backgroundImage: NetworkImage(
// // AdminUsersCubit.get(context)
// //     .adminUserstModel!
// //     .data![index]
// //     .photo!),
// // ),
// // ),
// // Padding(
// // padding:
// // const EdgeInsets.all(8.0),
// // child: Column(
// // crossAxisAlignment:
// // CrossAxisAlignment.start,
// // children: [
// // Text( AdminUsersCubit.get(context)
// //     .adminUserstModel!
// //     .data![index]
// //     .name!),
// // // Text( AdminUsersCubit.get(context)
// // //     .adminUserstModel!
// // //     .data![index]
// // //     .rateAverage[index]!),
// // ],
// // ),
// // ),
// // ],
// // ),
// // ),
// // ],
// // ),
// // SizedBox(
// // height: 3.0,
// // ),
// // const Divider(),
// // Padding(
// // padding: const EdgeInsets.all(8.0),
// // child: Row(
// // mainAxisAlignment: MainAxisAlignment.end,
// // children: [
// // defaultButtonWithIcon(
// // icon: Icons.delete,
// // background:Color(0xff4377ec),
// // text: 'Delete',
// // function: () async {
// // AdminUsersCubit.get(context).DeleteUserOrWorkerForAdmin(
// // token: token!,
// // userId: AdminUsersCubit.get(context).adminUserstModel!.data![index].sId!
// // );
// // },
// // width: 120.0,
// // radius: 40.0,
// // height: 40.0,
// // ),
// // ],
// // ),
// // ),
// // ],
// // ),
// // ),
// // itemCount: AdminUsersCubit.get(context).adminUserstModel!.data!.length,
// // separatorBuilder:  (context, index) => const SizedBox(
// // height: 10,
// // ),
// // ),
// // ),
// // const Divider(thickness: 10,),
// // Text('All Workers',
// // style: TextStyle(
// // fontSize: 25,
// // fontWeight: FontWeight.bold,
// // ),),
// // const Divider(thickness: 2,),
// // ConditionalBuilder(
// // condition: state is AdminGetWorkersSuccessState,
// // fallback: (context) => const Center(child: CircularProgressIndicator()),
// // builder: (context) =>ListView.separated(
// // shrinkWrap: true,
// // physics: const BouncingScrollPhysics(),
// // itemBuilder: (context, index) => Card(
// // child: Column(
// // children: [
// // Row(
// // mainAxisAlignment:
// // MainAxisAlignment.spaceBetween,
// // children: [
// // Padding(
// // padding: const EdgeInsets.all(8.0),
// // child: Row(
// // children: [
// // Container(
// // alignment: Alignment.topLeft,
// // child: CircleAvatar(
// // backgroundColor:
// // Colors.transparent,
// // radius: 25,
// // backgroundImage: NetworkImage(
// // AdminUsersCubit.get(context)
// //     .adminWorkerstModel!
// //     .data![index]
// //     .photo!),
// // ),
// // ),
// // Padding(
// // padding:
// // const EdgeInsets.all(8.0),
// // child: Column(
// // crossAxisAlignment:
// // CrossAxisAlignment.start,
// // children: [
// // Text( AdminUsersCubit.get(context)
// //     .adminWorkerstModel!
// //     .data![index]
// //     .name!),
// // Text( AdminUsersCubit.get(context)
// //     .adminWorkerstModel!
// //     .data![index]
// //     .bio!),
// // ],
// // ),
// // ),
// // ],
// // ),
// // ),
// // ],
// // ),
// // SizedBox(
// // height: 3.0,
// // ),
// // const Divider(),
// // Padding(
// // padding: const EdgeInsets.all(8.0),
// // child: Row(
// // mainAxisAlignment: MainAxisAlignment.end,
// // children: [
// // defaultButtonWithIcon(
// // icon: Icons.delete,
// // background:Color(0xff4377ec),
// // text: 'Delete',
// // function: () async {
// // AdminUsersCubit.get(context).DeleteUserOrWorkerForAdmin(
// // token: token!,
// // userId: AdminUsersCubit.get(context).adminWorkerstModel!.data![index].sId!
// // );
// // },
// // width: 120.0,
// // radius: 40.0,
// // height: 40.0,
// // ),
// // ],
// // ),
// // ),
// // ],
// // ),
// // ),
// // itemCount: AdminUsersCubit.get(context).adminWorkerstModel!.data!.length,
// // separatorBuilder:  (context, index) => const SizedBox(
// // height: 10,
// // ),
// // ),
// // ),
// // ],
// // ),
// //
// // ),
// // ),