import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/AdminPostModel.dart';
import 'package:san3a/models/post_model.dart';
import 'package:san3a/modules/Admin/Posts/Cubit/AdminPostStates.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class AdminPostCubit extends Cubit<AdminPostStates> {
  AdminPostCubit() : super(AdminPostInitialState());

static AdminPostCubit get(context) => BlocProvider.of(context);

AdminPostModel? adminPostModel;

  void GetPostsForAdmin({required String token}) {
    emit(AdminPostLoadingState());
    DioHelper.getData(
        url: GETALLREPORTEDPOSTS,
        token: token,
    ).then((value) {
      adminPostModel = AdminPostModel.fromJson(value.data);
      emit(AdminGetPostSuccessState(adminPostModel));
    }).catchError((error) {
      print(error.toString());
      emit(AdminPostErrorState(error.toString()));
    });
  }

  void DeletePostsForAdmin({required String token, required String postId}) {
    emit(AdminPostLoadingState());
    DioHelper.postData(
      url: ADMINDELETEPOST,
      token: token,
      data: {
        'postId' : postId,
      },
    ).then((value) {
      adminPostModel = AdminPostModel.fromJson(value.data);
      emit(AdminGetPostSuccessState(adminPostModel));
    }).catchError((error) {
      print(error.toString());
      emit(AdminPostErrorState(error.toString()));

    });
  }

}