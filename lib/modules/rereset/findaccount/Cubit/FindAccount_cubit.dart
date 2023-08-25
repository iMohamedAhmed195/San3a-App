import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/findAccount_model.dart';
import 'package:san3a/modules/rereset/findaccount/Cubit/FindAccount_states.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';



class SearchAccountCubit extends Cubit<SearchAccountStates> {

  SearchAccountCubit() : super(FindAccountInitialState());

  static SearchAccountCubit get(context) => BlocProvider.of(context);
  FindAccountModel? SearchModel;
  String? emailFromDB;
  String? phoneFromDB;

  void SearchAccount({required String email}) async {
    emit(FindAccountLoadingState());
    await DioHelper.postData(
        url: SEARCHACCOUNT,
        data: {
          'email': email.isNotEmpty ? email : null,
          //'phone': phone.isNotEmpty ? phone : null,
        }).then((value) {
      SearchModel = FindAccountModel.fromJson(value.data);
      emit(FindAccountSuccessState(SearchModel));
    }).catchError((error) {
      emit(FindAccountErrorState(error.toString()));
      print(error.toString());
    });
  }
  //
  // Future<void> getEmailPhone() async {
  //   try {
  //     emit(EmailPhoneLoadingState());
  //
  //     final response = await DioHelper.getData(
  //       url: SEARCHACCOUNT,
  //     );
  //     if (response.statusCode == 200) {
  //       final data = response.data;
  //       final email = data['email'];
  //       final phone = data['phone'];
  //       emit(EmailPhoneLoadedState(email: email, phone: phone));
  //     } else {
  //       emit(EmailPhoneErrorState('Failed to load email and phone'));
  //     }
  //   } catch (error) {
  //     emit(EmailPhoneErrorState(error.toString()));
  //   }
  // }

}

// void searchAccount() async {
//   final currentState = state;
//   final email = currentState.email;
//   final phone = currentState.phone;
//
//   // Search for the account in the database based on the email or phone number
//   String? emailFromDB;
//   String? phoneFromDB;
//   if (email.isNotEmpty || phone.isNotEmpty) {
//     try {
//       final response = await dio.get('/accounts', queryParameters: {
//
//       });
//       final data = response.data;
//       if (data is List && data.isNotEmpty) {
//         emailFromDB = data[0]['email'];
//         phoneFromDB = data[0]['phone'];
//       }
//     } catch (error) {
//       // Handle any errors that occur during the database query
//       print(error.toString());
//     }
//   }

