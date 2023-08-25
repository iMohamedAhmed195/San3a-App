import 'package:san3a/models/AdminPostModel.dart';
import 'package:san3a/models/post_model.dart';


abstract class AdminPostStates{}

class AdminPostInitialState extends AdminPostStates {}

class AdminPostLoadingState extends AdminPostStates {}

class AdminGetPostSuccessState extends AdminPostStates {
  AdminPostModel? adminPostModel;
  AdminGetPostSuccessState(this.adminPostModel);
}

class AdminPostErrorState extends AdminPostStates {
  final String error;
  AdminPostErrorState(this.error);
}
