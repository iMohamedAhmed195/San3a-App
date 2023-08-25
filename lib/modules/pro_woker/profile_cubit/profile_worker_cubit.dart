import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/delete_post_model.dart';
import 'package:san3a/models/post_model.dart';
import 'package:san3a/models/profileModel.dart';
import 'package:san3a/models/update_post_model.dart';
import 'package:san3a/modules/pro_woker/profile_cubit/profile_worker_states.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class ProfileWorkerCubit extends Cubit<ProfileWorkerState>{

  ProfileWorkerCubit():super(ProfileWorkerInitialState());

 static ProfileWorkerCubit get(context)=> BlocProvider.of(context);

  ProfileModel? profile;
  DeletePostModel? deletePost;
  UpdatePostModel? updatePost;

  // ProfileModel? get profile => _profile;

  // Future<void> getProfileIfnotExists() async {
  //   if(_profile == null){
  //     return GetProfilePostsWorker(token: token??'');
  //   }
  //   return;
  // }

  void GetProfilePostsWorker() {
    emit(GetProfilePostWorkerLoadingState());

    DioHelper.getData(
        url: GETPROFILEPAGE,
        token: token
    )
        .then((value) {

      profile=ProfileModel.fromJson(value.data);


      emit(GetProfilePostWorkerSuccessState(profile));
    })
        .catchError((error) {

      emit(GetProfilePostWorkerErrorState(error.toString()));
    });
  }

  void DeletePost({required String postId,required String userId}) {
    emit(DeleltePostLoadingState());

    DioHelper.postData(
        url: DELETEPOST,
        token: token,
        data: {
          'postId':postId,
          'userId':userId
        })
        .then((value) {

      deletePost=DeletePostModel.fromJson(value.data);


      emit(DeleltePostSuccessState(deletePost));
    })
        .catchError((error) {

      emit(DeleltePostErrorState(error.toString()));
    });
  }

  void UpdatePost({required String postId,required String userId , String? text , String? image}) {
    emit(UpdatePostLoadingState());

    DioHelper.postData(
        url: UPDATEPOST,
        token: token,
        data: {
          'postId':postId,
          'userId':userId
        })
        .then((value) {

      updatePost=UpdatePostModel.fromJson(value.data);


      emit(UpdatePostSuccessState(updatePost));
    })
        .catchError((error) {

      emit(UpdatePostErrorState(error.toString()));
    });
  }

}