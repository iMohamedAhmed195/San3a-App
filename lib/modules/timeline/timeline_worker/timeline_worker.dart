import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/pro_woker/profile_cubit/profile_worker_cubit.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_cubit/timeLine_cubit.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_cubit/timeLine_states.dart';
import 'package:san3a/modules/wroker_send_user/worker_send_user.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';


class TimeLineForWorker extends StatefulWidget {
   TimeLineForWorker({Key? key}) : super(key: key);

  @override
  State<TimeLineForWorker> createState() => _TimeLineForWorkerState();
}

class _TimeLineForWorkerState extends State<TimeLineForWorker> {
  late int index ;
  Future<void>_loadResources(){
    return Future.delayed(Duration(seconds: 0),(){
      TimeLineCubit.get(context).GetPosts();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    providers:[
    BlocProvider(create: (context) => TimeLineCubit()..GetPosts()),
    BlocProvider(create: (context) => ProfileWorkerCubit()..GetProfilePostsWorker(),)
    ],
      child: BlocConsumer<TimeLineCubit, TimeLineState>(
        listener: (context, state) {
          if (state is GoToProfilePersonSuccessState) {

            navigateTo(context,  ProUser(index));
          }
        },
        builder: (context, state) {
          var Cubit = TimeLineCubit.get(context);
          return RefreshIndicator(

            onRefresh: _loadResources,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child:
                  ConditionalBuilder(
                      condition:  state is GetPostSuccessState || state is GoToProfilePersonSuccessState,
                      builder: (context) => SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  const Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    elevation: 5.0,
                                    margin: EdgeInsets.all(8.0),
                                    child: Image(
                                      image: NetworkImage('https://img.freepik.com/free-photo/two-worker-making-gates-smithy_7502-9153.jpg?w=1380&t=st=1684504808~exp=1684505408~hmac=7ca3292ddf4b901b98fcdec5fbbaaa4d642c29a198890d81e7f1ce2ed0700122'),
                                      fit: BoxFit.cover,
                                      height: 150.0,
                                      width: double.infinity,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text('احصل علي وظائف مهنتك',
                                      style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListView.separated(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context,index)
                                {
                                  this.index = index;
                                         return PostItem(Cubit.getPost!, context, index);
                                        },
                                separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                                itemCount: Cubit.getPost!.postData!.length),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      ),


                      fallback: (context) =>
                      const Center(child: CircularProgressIndicator()))),
            ),
          );
        },
      ),
    );


  }
}













