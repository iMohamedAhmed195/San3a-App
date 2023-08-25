import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:san3a/models/add_post_model.dart';

import 'package:san3a/modules/add_post_screen/cubit/post_states.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class PostCubit extends Cubit<PostStates> {
  PostCubit() : super(PostInitialState());

  static PostCubit get(context) => BlocProvider.of(context);
  AddPostModel? addPostModel;

  bool isPost = false;
  Color ColorButton = Colors.grey;
  void changeColorButton(bool isPost) {
    if (isPost == true) {
      ColorButton = Colors.blue;
      emit(PostChangeColorButtonState());
    } else {
      ColorButton = Colors.grey;
      emit(PostChangeColorButtonState());
    }
  }

  bool changeColorButton1(int index) {
    if (index>=0) {
      ColorButton = Colors.blue;
      emit(PostChangeColorButtonState());
      return true;
    } else {
      ColorButton = Colors.grey;
      emit(PostChangeColorButtonState());
      return false;
    }
  }

  final ImagePicker picker = ImagePicker();


  // List<XFile> pickedFile=[];
  //
  // Future<void> getImageProfileFromGallery() async {
  //   final  List<XFile>? selectImage = await picker.pickMultiImage();
  //   if (selectImage!.isNotEmpty) {
  //     pickedFile.addAll(selectImage);
  //     emit(AddPhotoPostSuccessState());
  //   } else {
  //     print('no image selceted');
  //     emit(AddPhotoPostErrorState());
  //   }
  // }
  File? profileImage;
  XFile? pickedFile ;

  Future<void> getImageProfileFromGallery() async {
    pickedFile = (await picker.pickImage(source: ImageSource.gallery))!;
    if (pickedFile != null) {
      profileImage = File(pickedFile!.path);
      emit(AddPhotoPostSuccessState());
    } else {
      print('no image selceted');
      emit(AddPhotoPostErrorState());
    }
  }

  Future<void> addPost(String? image, String description, {required String job}) async {
    emit(AddPostLoadingState());
    FormData pathData = FormData.fromMap ({
        "image":await MultipartFile.fromFile(pickedFile!.path , filename:pickedFile!.path.split("/").last),
        'description': description,
        'job': job,});

    DioHelper.postData(
        url: ADDPOST,
        data: pathData)
        .then((value) {
         addPostModel= AddPostModel.fromJson(value.data);
          emit(AddPostSuccessState());
    })
        .catchError((error) {
          print('ghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh ');
      emit(AddPostErrorState(error.toString()));
    });
  }
}
