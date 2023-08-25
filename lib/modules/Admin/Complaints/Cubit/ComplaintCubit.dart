import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/AdminComplaintsModel.dart';
import 'package:san3a/modules/Admin/Complaints/Cubit/ComplaintStates.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class ComplaintsCubit extends Cubit<ComplaintsStates> {
  ComplaintsCubit() : super(AdminComplaintsInitialState());

  static ComplaintsCubit get(context) => BlocProvider.of(context);


  AdminComplaintsModel? adminComplaintsModel;

  void GetAllHelpMeForAdmin({required String token}) {
    emit(AdminComplaintsLoadingState());
    DioHelper.getData(
      url: GETALLHELPMEFORADMIN,
      token: token,
    ).then((value) {
      adminComplaintsModel = AdminComplaintsModel.fromJson(value.data);
      emit(AdminGetComplaintsSuccessState(adminComplaintsModel));
    }).catchError((error) {
      print(error.toString());
      emit(AdminComplaintsErrorState(error.toString()));

    });
  }

  void DeleteHelpMeForAdmin({required String token, required String helpMeId}) {
    emit(AdminDeleteLoadingState());
    DioHelper.postData(
      url: ADMINDELETEHELPME,
      token: token,
      data: {
        'helpMeId': helpMeId,
      },
    ).then((value) {
      adminComplaintsModel = AdminComplaintsModel.fromJson(value.data);
      emit(AdminDeleteComplaintsSuccessState(adminComplaintsModel));
    }).catchError((error) {
      print(error.toString());
      emit(AdminDeleteComplaintsrErrorState(error.toString()));

    });
  }

  void SentHelpMeMessageFromAdmin({required String token, required String email}) {
    emit(AdminSentHelpMeMessageLoadingState());
    DioHelper.postData(
      url: ADMINMESSAGEHELME,
      token: token,
      data: {
        'email': email,
      },
    ).then((value) {
      adminComplaintsModel = AdminComplaintsModel.fromJson(value.data);
      emit(AdminSentHelpMeMessageSuccessState(adminComplaintsModel));
    }).catchError((error) {
      print(error.toString());
      emit(AdminSentHelpMeMessageErrorState(error.toString()));

    });
  }


}