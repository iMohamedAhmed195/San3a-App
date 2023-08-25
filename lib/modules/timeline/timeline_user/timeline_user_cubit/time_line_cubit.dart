
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/WorkerSendUserModel.dart';
import 'package:san3a/models/post_model.dart';
import 'package:san3a/models/profileModel.dart';
import 'package:san3a/models/save_post_from_timeLine_model.dart';
import 'package:san3a/models/timeline_user_model.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_cubit/timeLine_states.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

import 'timeline_user_state.dart';

class TimeLineUserCubit extends Cubit<TimeLineUserState> {
  TimeLineUserCubit() : super(InitialGetWorkerState());

  static TimeLineUserCubit get(context) => BlocProvider.of(context);
  WorkerTimeLineModel?  getDataWorker;
  ProfileModel? profileSendTo;

  void goToProfilePerson(String? uId) {
    emit(GoToProfileWorkerLoadingState());
    DioHelper.postData(
        url: GOTOPROFILEPERSON,
        data: {
          "usId":uId
        })
        .then((value) {
         print('ana kddddddddddddddddda wdet 1');
      profileSendTo= ProfileModel.fromJson(value.data);
      print(profileSendTo!.data!.userData!.name);
      print(profileSendTo!.data!.userData!.photo);
      print(profileSendTo!.data!.userData!.name);
         print('ana kddddddddddddddddda wdet 2');
      emit(GoToProfileWorkerSuccessState(profileSendTo));
         print('ana kddddddddddddddddda wdet 2');
    })
        .catchError((error) {
      print('ana kddddddddddddddddda error 3');
      emit(GoToProfileWorkerErrorState(error.toString()));
    });
  }

  void GetDataWorker() {
    emit(GetWorkerLoadingState());

    DioHelper.getData(
        url: GETWORKER,
        token: token
    ).then((value) {
      getDataWorker = WorkerTimeLineModel.fromJson(value.data);

      emit(GetWorkerSuccessState(getDataWorker));
    }).catchError((error) {
      emit(GetWorkerErrorState(error.toString()));
    });
  }

  // void goToProfilePerson(index) {
  //   emit(GoToProfilePersonLoadingState());
  //   DioHelper.postData(
  //       url: GOTOPROFILEPERSON,
  //       data: {
  //         "usId": getPost!.postData![index].userDataPost!.id
  //       })
  //       .then((value) {
  //     getProfileSender= WorkerSendUser.fromJson(value.data);
  //     emit(GoToProfilePersonSuccessState(getProfileSender));
  //   })
  //       .catchError((error) {
  //     emit(GoToProfilePersonErrorState(error.toString()));
  //   });
  // }

  // void SavePost({required String postId}) {
  //   DioHelper.postData(
  //       url: SAVEPOST,
  //       data: {
  //         "postId":postId
  //       })
  //       .then((value) {
  //     saved= SavedPostFromTimeLineModel.fromJson(value.data);
  //     emit(SavePostSuccessState(saved));
  //   })
  //       .catchError((error) {
  //     emit(SavePostErrorState(error.toString()));
  //   });
  // }
}
