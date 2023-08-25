
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/WorkerSendUserModel.dart';
import 'package:san3a/models/post_model.dart';
import 'package:san3a/models/save_post_from_timeLine_model.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_cubit/timeLine_states.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class TimeLineCubit extends Cubit<TimeLineState> {
  TimeLineCubit() : super(InitialPostState());

  static TimeLineCubit get(context) => BlocProvider.of(context);
  PostModel? getPost;
  WorkerSendUser? getProfileSender;
  SavedPostFromTimeLineModel? saved;
  void GetPosts() {
    emit(GetPostLoadingState());

    DioHelper.getData(url: GETPOSTS, token: token).then((value) {
      getPost = PostModel.fromJson(value.data);

      emit(GetPostSuccessState(getPost));
    }).catchError((error) {
      emit(GetPostErrorState(error.toString()));
    });
  }

  void goToProfilePerson(index) {
    emit(GoToProfilePersonLoadingState());
    DioHelper.postData(
        url: GOTOPROFILEPERSON,
        data: {
          "usId": getPost!.postData![index].userDataPost!.id
        })
        .then((value) {
      getProfileSender= WorkerSendUser.fromJson(value.data);
      emit(GoToProfilePersonSuccessState(getProfileSender));
    })
        .catchError((error) {
      emit(GoToProfilePersonErrorState(error.toString()));
    });
  }

  void SavePost({required String postId}) {
    DioHelper.postData(
        url: SAVEPOST,
        data: {
          "postId":postId
        })
        .then((value) {
      saved= SavedPostFromTimeLineModel.fromJson(value.data);
      emit(SavePostSuccessState(saved));
    })
        .catchError((error) {
      emit(SavePostErrorState(error.toString()));
    });
  }
}
