import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/modules/saved_posts/CUBIT/cubit.dart';
import 'package:san3a/modules/saved_posts/CUBIT/state.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_cubit/timeLine_cubit.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_cubit/timeLine_states.dart';
import 'package:san3a/modules/wroker_send_user/worker_send_user.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';

class SavedPosts extends StatefulWidget {
  SavedPosts({Key? key}) : super(key: key);

  @override
  State<SavedPosts> createState() => _SavedPostsState();
}

class _SavedPostsState extends State<SavedPosts> {
  late int index;
  Future<void> _loadResources() {
    return Future.delayed(Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SavedPostCubit()..GetSavedPosts(),
      child: BlocConsumer<SavedPostCubit, SavedPostsState>(
        listener: (context, state) {
          if (state is GoToProfilePersonSuccessState) {
            navigateTo(context, ProUser(index));
          }
        },
        builder: (context, state) {
          var Cubit = SavedPostCubit.get(context);
          return RefreshIndicator(
            onRefresh: _loadResources,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConditionalBuilder(
                      condition: state is GetPostSuccessState ||
                          state is GoToProfilePersonSuccessState,
                      builder: (context) => SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                ListView.separated(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      this.index = index;
                                      // return SavedItem(
                                      //     Cubit.save!, context, index);
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          height: 10,
                                        ),
                                    itemCount: Cubit.save!.data!.length),
                                const SizedBox(
                                  height: 10,
                                ),
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
