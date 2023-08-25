
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/WorkerSendUserModel.dart';
import 'package:san3a/models/post_model.dart';
import 'package:san3a/models/save_post_from_timeLine_model.dart';
import 'package:san3a/models/saved_posts_model.dart';
import 'package:san3a/modules/saved_posts/saved_posts.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_cubit/timeLine_states.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

import 'state.dart';

class SavedPostCubit extends Cubit<SavedPostsState> {
  SavedPostCubit() : super(SavedPostsPostState());

  static SavedPostCubit get(context) => BlocProvider.of(context);
  SavedPostsModel? save;
  void GetSavedPosts() {
    emit(SavedPostsLoadingState());

    DioHelper.getData(
        url: GETSAVEPOST,
        token: token
    ).then((value) {
      save = SavedPostsModel.fromJson(value.data);
      emit(SavedPostsSuccessState(save));
    }).catchError((error) {
      emit(SavedPostsErrorState(error.toString()));
    });
  }


}
