

import 'package:san3a/models/profileModel.dart';
import 'package:san3a/models/timeline_user_model.dart';

abstract class TimeLineUserState{}

class InitialGetWorkerState extends TimeLineUserState{}

class GetWorkerLoadingState extends TimeLineUserState{}
class GetWorkerSuccessState extends TimeLineUserState{
  WorkerTimeLineModel? getDataWorker;
  GetWorkerSuccessState(this.getDataWorker);
}
class GetWorkerErrorState extends TimeLineUserState{
  final String error;
  GetWorkerErrorState(this.error);
}

class GoToProfileWorkerLoadingState extends TimeLineUserState{}
class GoToProfileWorkerSuccessState extends TimeLineUserState{
  ProfileModel? profileSendTo;
  GoToProfileWorkerSuccessState(this.profileSendTo);
}
class GoToProfileWorkerErrorState extends TimeLineUserState{
  final String error;
  GoToProfileWorkerErrorState(this.error);
}