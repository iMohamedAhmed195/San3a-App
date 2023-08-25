import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/AdminGetUsersModel.dart';
import 'package:san3a/modules/Admin/Users/Customer/Cubit/AdminUsersStates.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class AdminUsersCubit extends Cubit<AdminUsersStates> {
  AdminUsersCubit() : super(AdminUsersInitialState());

  static AdminUsersCubit get(context) => BlocProvider.of(context);

  AdminGetUsersModel? adminUserstModel;


  void GetAllUsersForAdmin({required String token}) {
    emit(AdminUsersLoadingState());
    DioHelper.getData(
      url: GETALLCUSTOMERUSERSFORADMIN,
      token: token,
    ).then((value) {
      adminUserstModel = AdminGetUsersModel.fromJson(value.data);
      emit(AdminGetUsersSuccessState(adminUserstModel));
    }).catchError((error) {
      print(error.toString());
      emit(AdminUsersErrorState(error.toString()));

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
      adminUserstModel = AdminGetUsersModel.fromJson(value.data);
      emit(AdminDeleteUserSuccessState(adminUserstModel));
    }).catchError((error) {
      print(error.toString());
      emit(AdminDeleteUserErrorState(error.toString()));

    });
  }

}