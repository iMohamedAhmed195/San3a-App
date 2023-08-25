import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/models/chat_model.dart';
import 'package:san3a/models/delete_chat_model.dart';

import 'package:san3a/models/message_model.dart';
import 'package:san3a/models/send_message.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_state.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/network/End_Points.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';

class ChatCubit extends Cubit<ChatState>{
  ChatCubit():super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);
  ChatModel? chatModel;
  MessagesModel? messageModel;
  SendMessage? sendMessage;
  DeleteChatModel? deleteModel;
  void GetAllChats() {
    emit(ChatLoadingState());
    DioHelper.getData(
        url: GETALLCHATS,
        token: token
    ).then((value) {
      chatModel = ChatModel.fromJson(value.data);

      emit(ChatSuccessState(chatModel ));
    }).catchError((error) {
      emit(ChatErrorState(error.toString()));
    });
  }


  void GetMessageChats({required int index}) {
    emit(MessageLoadingState());
    DioHelper.postData(
        url: GETALLMESSAGE,
        token: token,
        data: {
          'chatId': chatModel!.data![index].sId})
        .then((value) {
      messageModel= MessagesModel.fromJson(value.data);
      print(messageModel!.chatID);

      emit(MessageSuccessState(messageModel));
      print(' message is success');
      print(messageModel!.data![index].text);
    }).catchError((error){
      emit(MessageErrorState(error.toString()));
      print(error.toString());


    });
  }

  Future<void> PostMessageChats({ required String content}) async{
    DioHelper.postData(
        url: SENDMESSAGE,
        token: token,
        data: {
          'text': content,
          'chatId': messageModel!.chatID})
        .then((value) {
      sendMessage= SendMessage.fromJson(value.data);

    }).catchError((error){
      emit(SendErrorState(error.toString()));
    });
  }

  void PostMessageFromPost({ required String content}) {

    DioHelper.postData(
        url: SENDMESSAGE,
        token: token,
        data: {
          'text': content,
          'chatId': messageModel!.chatID})
        .then((value) {
      sendMessage= SendMessage.fromJson(value.data);
      emit(SendSuccessState());
    }).catchError((error){
      emit(SendErrorState(error.toString()));
    });
  }

  Future<void> GetChatsFromPost({ required String idUser}) async {
    emit(MessageLoadingState());
    DioHelper.postData(
        url: GETMESSAGEFromPost,
        token: token,
        data: {
          'id':idUser })
        .then((value) {
      messageModel= MessagesModel.fromJson(value.data);
      print(messageModel!.message);

      emit(MessageSuccessState(messageModel));
    }).catchError((error){
      emit(MessageErrorState(error.toString()));
      print(error.toString());

    });
  }

  void DeleteOneChat({required int index}) {

    DioHelper.postData(
        url: DELETEONECHAT,
        token: token,
        data: {
          'chatId': chatModel!.data![index].sId})
        .then((value) {
      deleteModel= DeleteChatModel.fromJson(value.data);
      GetAllChats();
      emit(DeleteSuccessState());
    }).catchError((error){
      emit(DeleteErrorState(error.toString()));
      print(error.toString());


    });
  }
  void DeleteAllChat() {
    DioHelper.postData(
        url: DELETEALLCHAT,
        token: token,
      )
        .then((value) {
      deleteModel= DeleteChatModel.fromJson(value.data);
      GetAllChats();
      emit(DeleteSuccessState());
    }).catchError((error){
      emit(DeleteErrorState(error.toString()));
      print(error.toString());


    });
  }
  void FilterMessageChats({required String job}) {
    emit(ChatLoadingState());
    DioHelper.postData(
        url: FILTERCHAT,
        token: token,
        data: {
          'job': job
        })
        .then((value) {
      chatModel= ChatModel.fromJson(value.data);

      emit(ChatSuccessState(chatModel ));
    }).catchError((error){
      emit(ChatErrorState(error.toString()));
      print(error.toString());


    });
  }


}
