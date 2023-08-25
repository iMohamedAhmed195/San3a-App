

// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:san3a/models/register_model.dart';
import 'package:san3a/modules/Register_Screen/Cubit/states.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';


enum UserTypeOption {
  Worker,
  Customer,
}

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  var emailcontroller = TextEditingController();
  var userTypecontroller = TextEditingController();
  var desccontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var comfpasscontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var birthcontroller = TextEditingController();
  var cityController = TextEditingController();
  var Nidcontroller = TextEditingController();
  var craftcontroller = TextEditingController();
  var yearController = TextEditingController();
  var monthController = TextEditingController();
  var dayController = TextEditingController();
  var countryCodecontroller = TextEditingController();

  bool isCheckedw = false;

  bool isCheckedc = false;

  bool isCheckedagree = false;

  final List<String> Craftlist = [
    "Choose Your Craft",
    "Metalworking",
    "Jewelry",
    "Pottery",
    "Sculpture",
    "Woodworking",
    "Cabinet making",
    "Marquetry",
    "Lacquerware",
    "Wood burning",
    "Wood turningx",
    "Balloon animal",
    "Beadwork",
    "Doll making",
    "Dollhouse construction and furnishing",
    "Egg decorating",
    "Etching",
    "Glassblowing",
    "Lapidary",
    "Mosaics",
    "Stained glass",
    "Toy making",
    "Polymer clay",
  ];

  String type = "";

  bool isWorker = false;

  String optionValue = "";

  void selectValue(String value) {
    type = value;
    if (type == "worker") {
      isWorker = true;
    } else {
      isWorker = false;
    }
    emit(UserTypeOptionState());
  }

  void changeOption(String selectLevel) async {
    optionValue = selectLevel;
    print(optionValue);
    emit(ChangeOptionState());
  }

  bool isWorkerSelected(UserTypesOption option) {
    if (option == UserTypesOption.Worker) {
      return isWorker = true;
    } else {
      return isWorker = false;
    }
  }

  void ChangeAgreementCheck() {
    isCheckedagree = !isCheckedagree;
    emit(AgreemenTremstStateDone());
  }

  String phone = "";

  void changePhone(String text){
    phone = text;
    emit(ChangePhoneState());
  }

  final ImagePicker picker = ImagePicker();

  File? profileImage;
  XFile? pickedFile;

  Future<void> getImageProfileFromGallery() async {
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile!.path);
      emit(ProfileImageSuccessStates());
    } else {
      print('no image selceted');
      emit(ProfileImageErrorStates());
    }
  }

  File? profileImage_Ca;

  Future<void> getImageProfileFromCamera() async {
    pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      profileImage_Ca = File(pickedFile!.path);
      emit(ProfileImageSuccessStates());
    } else {
      print('no image selceted');
      emit(ProfileImageErrorStates());
    }
  }



  File? NIDImage;
  XFile? NIDFile;

  Future<void> getImageNIDFromGallery() async {
    NIDFile = await picker.pickImage(source: ImageSource.gallery);

    if (NIDFile != null) {
      NIDImage = File(NIDFile!.path);
      emit(ProfileImageSuccessStates());
    } else {
      print('no image selceted');
      emit(ProfileImageErrorStates());
    }
  }

  File? NIDImage_C;

  Future<void> getImageNIDFromCamera() async {
    NIDFile = await picker.pickImage(source: ImageSource.camera);

    if (NIDFile != null) {
      NIDImage_C = File(NIDFile!.path);
      emit(ProfileImageSuccessStates());
    } else {
      print('no image selceted');
      emit(ProfileImageErrorStates());
    }
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void ChangePasswordVisibilit() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterchangePaasswordVisibilityState());
  }

  RegisterModel? registerModel;
  void userRegister ({
    String? image,
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
    required String phone,
    required String birthdate,
    required String city,
    required String national_id,
    required String role,
    String? job_title,
    String? description,
    required String Nidimage,
  }) async {
    emit(RegisterLoadingState());
    FormData pathData = FormData.fromMap ({
      //ابعت كل البيانات بتاعت الريجيستر هنا
      "photo":await MultipartFile.fromFile(pickedFile!.path , filename:pickedFile!.path.split("/").last),
      'name': name,
      'email': email,
      'password': password,
      'passwordConfirm': passwordConfirm,
      'phone': phone,
      'birthdate': birthdate,
      'city': city,
      'national_id': national_id,
      'role': role,
      'job': job_title,
      'bio': description,
      'photo_id': await MultipartFile.fromFile(NIDFile!.path , filename:NIDFile!.path.split("/").last),
    });
    DioHelper.postData(
      url: REGISTER,
      data: pathData,
    ).then((value) {
      print(value.data);
      registerModel = RegisterModel.fromJson(value.data);
      emit(RegisterSuccessState(registerModel!));
    })..catchError((error){
      emit(RegisterErorrState(error.toString()));
      print(error.toString());
    });
  }
}
