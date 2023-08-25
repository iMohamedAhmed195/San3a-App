import 'package:san3a/models/AdminGetUsersModel.dart';

abstract class AdminUsersStates{}

class AdminUsersInitialState extends AdminUsersStates {}

class AdminDeleteLoadingState extends AdminUsersStates {}

class AdminUsersLoadingState extends AdminUsersStates {}

class AdminGetUsersSuccessState extends AdminUsersStates {
  AdminGetUsersModel? adminUserstModel;
  AdminGetUsersSuccessState(this.adminUserstModel);
}

class AdminUsersErrorState extends AdminUsersStates {
  final String error;
  AdminUsersErrorState(this.error);
}

class AdminDeleteUserSuccessState extends AdminUsersStates {
  AdminGetUsersModel? adminUserstModel;
  AdminDeleteUserSuccessState(this.adminUserstModel);
}

class AdminDeleteUserErrorState extends AdminUsersStates {
  final String error;
  AdminDeleteUserErrorState(this.error);
}

