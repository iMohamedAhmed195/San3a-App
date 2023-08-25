import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/AdminGetWorkerModel.dart';
import 'package:san3a/modules/Admin/Users/Worker/Cubit/AdminWorkerStates.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class AdminWorkerCubit extends Cubit<AdminWorkersStates> {
  AdminWorkerCubit() : super(AdminWorkersInitialState());

  static AdminWorkerCubit get(context) => BlocProvider.of(context);


  AdminGetWorkerModel? adminWorkerstModel;

  void GetAllWorkersForAdmin({required String token}) {
    emit(AdminWorkersLoadingState());
    DioHelper.getData(
      url: GETALLWORKERUSERSFORADMIN,
      token: token,
    ).then((value) {
      adminWorkerstModel = AdminGetWorkerModel.fromJson(value.data);
      emit(AdminGetWorkersSuccessState(adminWorkerstModel));
    }).catchError((error) {
      print(error.toString());
      emit(AdminWorkersErrorState(error.toString()));

    });
  }

  void DeleteUserOrWorkerForAdmin({required String token, required String userId}) {
    emit(AdminDeleteLoadingState());
    DioHelper.postData(
      url: ADMINDELETEUSERSERORUSER,
      token: token,
      data: {
        'userId': userId,
      },
    ).then((value) {
      adminWorkerstModel = AdminGetWorkerModel.fromJson(value.data);
      emit(AdminDeleteUserSuccessState(adminWorkerstModel));
    }).catchError((error) {
      print(error.toString());
      emit(AdminDeleteUserErrorState(error.toString()));

    });
  }

}