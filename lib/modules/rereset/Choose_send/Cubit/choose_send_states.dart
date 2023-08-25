import 'package:san3a/models/Choose_send_model.dart';



abstract class ChooseSendStates {}

class chooseInitialState extends ChooseSendStates {}

class chooseLoadingState extends ChooseSendStates {}

class UserChooseSendState extends ChooseSendStates {}

class chooseSuccessState extends ChooseSendStates {
  ChooseSendModel? chooseSend;
  chooseSuccessState(this.chooseSend);
}

class ChooseSendErorrState extends ChooseSendStates {
  final String erorr;
  ChooseSendErorrState(this.erorr);
}


