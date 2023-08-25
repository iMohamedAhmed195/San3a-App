import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';

import 'package:san3a/modules/Login_Screen/Cubit/cubit.dart';
import 'package:san3a/modules/add_post_screen/add_post_screen.dart';
import 'package:san3a/modules/pro_woker/profile_cubit/profile_worker_cubit.dart';
import 'package:san3a/modules/pro_woker/profile_cubit/profile_worker_states.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/component/constant.dart';

import 'package:san3a/shared/styles/icon_broken.dart';


class ProWorker extends StatelessWidget {
  const ProWorker( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ProfileWorkerCubit()..GetProfilePostsWorker(),
      child: BlocConsumer<ProfileWorkerCubit , ProfileWorkerState>(
        listener:(context , state){
        } ,
        builder: (context , state){
          var Cubit= ProfileWorkerCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon:const Icon(Icons.arrow_back,),),
              title: Text( San3aLayoutCubit.get(context).isArabic1?"الصفحة الشخصية":'Profile',
                style:Theme.of(context).textTheme.bodyText1),
              centerTitle: true,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () { navigateTo(context, const AddScreen()); },
              child: const Icon(IconBroken.Edit),
            ),
            body: ConditionalBuilder(
              condition: state is GetProfilePostWorkerSuccessState,
              builder: (context)=>SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            height: 170.0,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: NetworkImage(
                                      '${Cubit.profile?.data!.userData!.photo}'),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  '${Cubit.profile?.data!.userData!.name}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20.0, fontWeight: FontWeight.bold)
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
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          if(Cubit.profile!.data!.userData!.role == 'worker')
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child:  Text(
                                  '${Cubit.profile!.data!.userData!.bio}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.0),
                                ),
                              ),
                            ],
                          ),
                          if(Cubit.profile!.data!.userData!.role == 'worker')
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
                              if(Cubit.profile!.data!.userData!.role == 'worker')
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
                                        Text('${Cubit.profile!.data!.userData!.job}',
                                            style: Theme.of(context).textTheme.bodyText1,)
                                      ],
                                    )
                                  ],
                                ),
                              if(Cubit.profile!.data!.userData!.role == 'worker')
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
                                      Text(Cubit.profile!.data!.userData!.countryCode!,
                                          style: Theme.of(context).textTheme.bodyText1,
                                      )],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              if(Cubit.profile!.data!.userData!.role == 'worker')
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
                                        Text('${Cubit.profile!.data!.userData!.birthdate}',
                                            style: Theme.of(context).textTheme.bodyText1,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              if(Cubit.profile!.data!.userData!.role == 'worker')
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
                                      Text(Cubit.profile!.data!.userData!.city!,
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
                    if(Cubit.profile!.data!.posts!.isEmpty)
                      Center(child: Text('There is No Posts here')),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index)=>ProfilePostWorkerItem(Cubit.profile!,context , index),
                        separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                        itemCount: Cubit.profile!.data!.posts!.length),
                  ],
                ),
              ),
              fallback:(context)=> const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
