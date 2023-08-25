import 'package:san3a/models/AdminGetWorkerModel.dart';

abstract class AdminWorkersStates{}

class AdminWorkersInitialState extends AdminWorkersStates {}

class AdminWorkersLoadingState extends AdminWorkersStates {}

class AdminDeleteLoadingState extends AdminWorkersStates {}

class AdminGetWorkersSuccessState extends AdminWorkersStates {
  AdminGetWorkerModel? adminWorkerstModel;
  AdminGetWorkersSuccessState(this.adminWorkerstModel);
}


class AdminWorkersErrorState extends AdminWorkersStates {
  final String error;
  AdminWorkersErrorState(this.error);
}

class AdminDeleteUserSuccessState extends AdminWorkersStates {
  AdminGetWorkerModel? adminWorkerstModel;
  AdminDeleteUserSuccessState(this.adminWorkerstModel);
}

class AdminDeleteUserErrorState extends AdminWorkersStates {
  final String error;
  AdminDeleteUserErrorState(this.error);
}

