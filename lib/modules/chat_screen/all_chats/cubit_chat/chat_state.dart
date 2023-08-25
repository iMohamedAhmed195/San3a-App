import 'package:san3a/models/chat_model.dart';

import 'package:san3a/models/message_model.dart';
import 'package:san3a/models/send_message.dart';

abstract class ChatState {}

class ChatInitialState extends ChatState {}

class ChatLoadingState extends ChatState {}
class ChatSuccessState extends ChatState {
  ChatModel? chatModel;

  ChatSuccessState(this.chatModel);
}

class ChatErrorState extends ChatState {
  final String error;
  ChatErrorState(this.error);
}

class MessageLoadingState extends ChatState {}
class MessageSuccessState extends ChatState {
  MessagesModel? messageModel;
   MessageSuccessState(this.messageModel);
}
class MessageErrorState extends ChatState {
  final String error;
  MessageErrorState(this.error);
}

class SendLoadingState extends ChatState {}
class SendSuccessState extends ChatState {
}

class SendErrorState extends ChatState {
  final String error;
  SendErrorState(this.error);
}


class DeleteSuccessState extends ChatState {
}

class DeleteErrorState extends ChatState {
  final String error;
  DeleteErrorState(this.error);
}
