import 'package:san3a/models/AdminComplaintsModel.dart';

abstract class ComplaintsStates{}

class AdminComplaintsInitialState extends ComplaintsStates {}

class AdminComplaintsLoadingState extends ComplaintsStates {}

class AdminSentHelpMeMessageLoadingState extends ComplaintsStates {}

class AdminDeleteLoadingState extends ComplaintsStates {}

class AdminGetComplaintsSuccessState extends ComplaintsStates {
  AdminComplaintsModel? adminComplaintsModel;
  AdminGetComplaintsSuccessState(this.adminComplaintsModel);
}


class AdminSentHelpMeMessageSuccessState extends ComplaintsStates {
  AdminComplaintsModel? adminComplaintsModel;
  AdminSentHelpMeMessageSuccessState(this.adminComplaintsModel);
}

class AdminSentHelpMeMessageErrorState extends ComplaintsStates {
  final String error;
  AdminSentHelpMeMessageErrorState(this.error);
}

class AdminComplaintsErrorState extends ComplaintsStates {
  final String error;
  AdminComplaintsErrorState(this.error);
}

class AdminDeleteComplaintsSuccessState extends ComplaintsStates {
  AdminComplaintsModel? adminComplaintsModel;
  AdminDeleteComplaintsSuccessState(this.adminComplaintsModel);
}

class AdminDeleteComplaintsrErrorState extends ComplaintsStates {
  final String error;
  AdminDeleteComplaintsrErrorState(this.error);
}

